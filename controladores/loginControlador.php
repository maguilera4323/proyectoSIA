<?php

require_once './modelos/loginModelo.php';
require_once "./controladores/VistasControlador.php";
require_once "./controladores/emailControlador.php";
require_once './modelos/mainModel.php';
require_once "./pruebabitacora.php";

class loginControlador extends mainModel{
	//funcion para validar datos e iniciar sesion
	public function accesoUsuario($datos) {
		$usuario=mainModel::limpiar_cadena($datos['usuario']);
		$contrasena=mainModel::limpiar_cadena($datos['password']);
		$ingresos_erroneos=mainModel::limpiar_cadena($datos['contador']);
		$array=array();
		$hash='';
		$array_pregunta=array();

		//se obtiene el hash de la contraseña para validar el inicio de sesion
		$recuperarHash=new Usuario();
		$hash_BD = $recuperarHash->obtenerContrasenaHash($usuario);
			foreach($hash_BD as $fila){
				$hash=$fila['contrasena'];
			}

		//en caso de que el hash concuerde con el de la contraseña ingresada
		if (password_verify($contrasena, $hash)) {
			$verificarDatos = new Usuario(); //se crea una instancia en el archivo modelo de Login
			$respuesta = $verificarDatos->accesoUsuario($usuario, $hash); //datos recibidos del archivo modelo de Login
			foreach ($respuesta as $fila) {
				$array['id'] = $fila['id_usuario'];
				$array['nombre'] = $fila['nombre_usuario'];
				$array['usuario'] = $fila['usuario'];
				$array['estado'] = $fila['estado_usuario'];
				$array['rol'] = $fila['rol'];
				$array['id_rol'] = $fila['id_rol'];
			}

			 //validacion en caso de que el estado del usuario sea Activo
			 //y que el rol del usuario no sea default para poder iniciar sesion
			 if($array['rol']!='default'){
					switch ($array['estado']){
						case 'Activo':
							session_start();
							//datos que se envian para uso del sistema
							$_SESSION['id_login']=$array['id'];
							$_SESSION['usuario_login']=$array['usuario'];
							$_SESSION['nombre_usuario']=($array['nombre']);
							$_SESSION['estado']=$array['estado'];
							$_SESSION['rol']=$array['rol'];
							$_SESSION['id_rol']=$array['id_rol'];
							$_SESSION['token_login']=md5(uniqid(mt_rand(),true));
							$datos_bitacora = [
								"id_objeto" => 0,
								"fecha" => date('Y-m-d H:i:s'),
								"id_usuario" => $fila['id_usuario'],
								"accion" => "Inicio de sesion",
								"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró al sistema"
							];
							Bitacora::guardar_bitacora($datos_bitacora);

							return header("Location:".SERVERURL."home/");
							break;
							case 'Inactivo':
								$_SESSION['respuesta'] = 'Usuario inactivo';
								return header("Location:".SERVERURL."login/");
							break;
							case 'Bloqueado':
								$_SESSION['respuesta'] = 'Usuario bloqueado';
								return header("Location:".SERVERURL."login/");
							break; 
							case 'Nuevo':
								session_start();
								//datos que se envian para el uso del sistema y para el primer ingreso
								$_SESSION['id_login']=$array['id'];
								$_SESSION['usuario_login']=$array['usuario'];
								$_SESSION['nombre_usuario']=($array['nombre']);
								$_SESSION['estado']=$array['estado'];
								$_SESSION['rol']=$array['rol'];
								$_SESSION['token_login']=md5(uniqid(mt_rand(),true));
								return header("Location:".SERVERURL."primer-ingreso/");
							break;
						die();
					}
				}else{
					//cuando el rol del usuario sea default
					$_SESSION['respuesta'] = 'Usuario sin permisos';
					return header("Location:".SERVERURL."login/");
					die();
				}
			}else{
				//en caso de que el hash no concuerde con el de la contraseña ingresada
				//o el usuario sea incorrecto
				$ingresos_erroneos=mainModel::limpiar_cadena($datos['contador']);

				//se llama a la funcion para obtener el limite de intentos de login
				$parametroIntentosValidos=new Usuario();
				$valorParametro=$parametroIntentosValidos->intentosValidos();
					foreach ($valorParametro as $fila) {
						$array_param['valor'] = $fila['valor'];
					}

				//validacion para revisar si el usuario ingresado existe en el sistema
				$verificarDatos = new Usuario();
				$query=$verificarDatos->verificarEstado($usuario);
					foreach ($query as $fila) { 
						$array['usuario'] = $fila['usuario'];
						$array['estado'] = $fila['estado_usuario'];
					}
					
					//Switch que valida si el usuario encontrado está activo
					//si está inactivo, está bloqueado o es un usuario nuevo no se sigue la verificación para bloquearlo
					if (isset($array['usuario'])>0){
							switch ($array['estado']){
								case 'Bloqueado':
									$_SESSION['respuesta'] = 'Usuario bloqueado';
									return header("Location:".SERVERURL."login/");
								break;
								case 'Inactivo':
									$_SESSION['respuesta'] = 'Usuario inactivo';
									return header("Location:".SERVERURL."login/");
								break;
								case 'Nuevo':
									$_SESSION['respuesta'] = 'Datos incorrectos';
									return header("Location:".SERVERURL."login/");
								break;
								case 'Activo':
									//si el usuario es ADMIN no se puede bloquear bajo ninguna circunstancia
									if(($array['usuario']=='ADMIN')){
										$_SESSION['respuesta'] = 'Datos incorrectos';
										return header("Location:".SERVERURL."login/");
										die();

									//se usa el valor de ingresos erroneos recibido del contador
									//y el valor del parametro ADMIN_INTENTOS_INVALIDOS
									}else if(($ingresos_erroneos>($array_param['valor']))){
										$respuesta = $verificarDatos->bloquearUsuario($usuario);
										$_SESSION['respuesta'] = 'Usuario bloqueado';
										return header("Location:".SERVERURL."login/");
									//si los intentos erroneos aun no superan el valor del parametro
									}else{
										$_SESSION['respuesta'] = 'Contraseña incorrecta';
										return header("Location:".SERVERURL."login/");
									break;
									}
								}  
						}else{
							//si no existe el usuario y la contraseña en la base de datos
							$_SESSION['respuesta'] = 'Datos incorrectos';
							return header("Location:".SERVERURL."login/");
							die();
							}
				}
		}
	
		



		//Función para guardar las respuestas de las preguntas de seguridad en el primer ingreso de un usuario
		public function insertarRespuestasSeguridad($datos){
			//valores para guardar las respuestas: respuesta, id de pregunta y id del usuario
			$res_pregunta=mainModel::limpiar_cadena($datos['respuesta']);
			$id_pregunta=mainModel::limpiar_cadena($datos['pregunta']);
			$id_usuario=mainModel::limpiar_cadena($datos['usuario']);

			//se obtienen los valores de los parametros de contraseña ya que serán utilizados despúes
			$parametroMinContrasena=new Usuario();
				$valorParametroMin=$parametroMinContrasena->minContrasena();
					foreach ($valorParametroMin as $fila) {
						$_SESSION['min_contrasena'] = $fila['valor'];
					}
			
			$parametroMaxContrasena=new Usuario();
				$valorParametroMax=$parametroMaxContrasena->maxContrasena();
					foreach ($valorParametroMax as $fila) {
						$_SESSION['max_contrasena'] = $fila['valor'];
					}

		/* 	$revisarRespuestaExistente=new Usuario();
			$respuesta_existe = $revisarRespuestaExistente->revisarPreguntaRespondida($res_pregunta,$id_usuario,$id_pregunta);

			if($respuesta_existe->rowCount()==1){
				$_SESSION['respuesta']='Pregunta ya respondida';
				$_SESSION['contador_preguntas']-=1;
				return header("Location:".SERVERURL."primer-ingreso/");
			} */

			$insertarRespuesta = new Usuario(); //se crea una instancia en el archivo modelo de Login
			$respuesta = $insertarRespuesta->insertarRespuestasSeguridad($res_pregunta,$id_usuario,$id_pregunta);
		    $_SESSION['contador_preguntas']+=1;
					
				if($_SESSION['contador_preguntas']==3){
					//al pasar por todas las preguntas de seguridad se actualiza el estado de usuario a Activo
					//y se redirige a la pagina de home
					$insertarRespuesta = new Usuario();
					$respuesta = $insertarRespuesta->actualizarUsuario($id_usuario);
					$_SESSION['contador_preguntas']=0;
					$_SESSION['respuesta']='';
					return header("Location:".SERVERURL."cambiocontrasena/");
					die();
				}
			}
			

		
				

		//función que se encarga de validar el usuario ingresado para la recuperacion de contraseña
		public function verificaUsuarioExistente($datos){
			$usuario=mainModel::limpiar_cadena($datos['usuario']);
			$metodo_rec=mainModel::limpiar_cadena($datos['metodo_recuperacion']);
			$array=array();

			$verificarUsuario = new Usuario(); //se crea una instancia en el archivo modelo de Login
			$respuesta = $verificarUsuario->verificaUsuarioExistente($usuario);
			foreach ($respuesta as $fila) { 
				$array['usuario'] = $fila['usuario'];
				$array['estado'] = $fila['estado_usuario'];
				$array['correo'] = $fila['correo_electronico'];
			}

			//Se valida si el usuario no está inactivo para realizar la recuperacion de contraseña
			if (isset($array['usuario'])>0 && $array['estado']!='Inactivo'){
				//se revisa la existencia del usuario y el metodo de recuperacion seleccionado
				if (isset($array['usuario'])>0 && $metodo_rec=='Por medio de email'){
					session_start();
						$_SESSION['usuario_rec']=$array['usuario'];
						$_SESSION['respuesta'] = 'Correo enviado';
						$agg_correo = new Correo(); //se crea nueva instancia de correo
      					$respuesta = $agg_correo->enviarCorreo($array['correo']);
						return header("Location:".SERVERURL."olvido-contrasena/");
					die();
				}elseif (isset($array['usuario'])>0 && $metodo_rec=='Por preguntas de seguridad'){
					session_start();
						$_SESSION['usuario_rec']=$array['usuario'];
						$_SESSION['fallo'] = '';
						return header("Location:".SERVERURL."rec-preguntas/");
					die();
				}else{
					//si el usuario es inválido se envia un mensaje de alerta indicando que no se puede hacer la recuperacion
					$_SESSION['respuesta'] = 'Usuario incorrecto';
					return header("Location:".SERVERURL."olvido-contrasena/");
					die();
				}
			}else{
				$_SESSION['respuesta'] = 'Usuario esta inactivo';
				return header("Location:".SERVERURL."olvido-contrasena/");
				die();
			}
		}


		//funcion para validar la respuesta ingresada de la pregunta de seguridad
		public function verificaPreguntaSeguridad($datos){
			$pregunta=mainModel::limpiar_cadena($datos['pregunta']);
			$respuesta=mainModel::limpiar_cadena($datos['respuesta']);
			$usuario=$_SESSION['usuario_rec'];
			$array=array();

			//funciones para los parametros que serán utiizados en la vista de Cambio de contraseña
			//parametros referentes a la cantidad minima y maxima de caracteres de la contraseña
			$parametroMinContrasena=new Usuario();
				$valorParametroMin=$parametroMinContrasena->minContrasena();
					foreach ($valorParametroMin as $fila) { 
						$_SESSION['min_contrasena'] = $fila['valor'];
					}
			
			$parametroMaxContrasena=new Usuario();
				$valorParametroMax=$parametroMaxContrasena->maxContrasena();
					foreach ($valorParametroMax as $fila) {
						$_SESSION['max_contrasena'] = $fila['valor'];
					}

			//funcion que se encarga de hacer un query y revisar si la respuesta existe y corresponde al usuario
			//de no ser asi se ejecuta otro query que bloquea el usuario
			$verificarRespuesta = new Usuario(); 
			$respuesta = $verificarRespuesta->verificarPreguntaSeguridad($pregunta,$respuesta,$usuario);
			foreach ($respuesta as $fila) {
				$array['registro_encontrado']=$fila['respuesta'];
			}

			
			if (isset($array['registro_encontrado'])>0){
				$_SESSION['respuesta'] = '';
				return header("Location:".SERVERURL."cambiocontrasena/");
				die();
			}else{
				$respuesta = $verificarRespuesta->bloquearUsuario($usuario);
				$_SESSION['fallo'] = 'Respuesta incorrecta';
				return header("Location:".SERVERURL."rec-preguntas/");
				die();
			}

			
		}


		//Función para realizar el cambio de contraseña en el sistema
		public function modificarContrasena($datos){
			$contrasena_nueva=mainModel::limpiar_cadena($datos['contrasena_nueva']);
			$conf_contrasena_nueva=mainModel::limpiar_cadena($datos['conf_contrasena_nueva']);
			$array=array();

			//verificacion para revisar si el cambio de contraseña es por recuperación de contraseña o por primer ingreso al sistema
			if(isset($_SESSION['usuario_rec'])){
				$usuario=$_SESSION['usuario_rec'];
			}else if(isset($_SESSION['usuario_login'])){
				$usuario=$_SESSION['usuario_login'];
			}

			//se obtiene el valor del parametro de la fecha de vencimiento para los usuarios
			$parametroFechaVencimiento=new Usuario();
			$valorVencimiento=$parametroFechaVencimiento->diasVencimiento();
			foreach ($valorVencimiento as $fila) { 
				$FechaVencimiento=$fila['valor'];
			}	


			//se hace un select para obtener la contraseña y el correo del usuario de recuperacion o que ingresa por primera vez
			$cambioContrasena = new Usuario(); 
			$respuesta = $cambioContrasena->verificarContrasenaActual($usuario);
			foreach($respuesta as $fila){
				$array['contrasena']=$fila['contrasena'];
				$array['correo']=$fila['correo_electronico'];
			}

			//verificacion para revisar que la nueva contraseña sea distinta a la que ya está registrada
			$hash_contrasena=mainModel::encryption($contrasena_nueva);
			if(($hash_contrasena===$array['contrasena'])){
				$_SESSION['respuesta'] = 'Contraseña nueva igual a la actual';
					return header("Location:".SERVERURL."cambiocontrasena/");
				die();
			}
			
			//verificacion para revisar que la contraseña y la confirmacion de la contraseña sean iguales
			//de ser así se procede al cambio de contraseña y se envia un correo de confirmación con el usuario y contraseña
			if($contrasena_nueva!=$conf_contrasena_nueva){
				$_SESSION['respuesta'] = 'Contraseñas no coinciden';
					return header("Location:".SERVERURL."cambiocontrasena/");
				die();
			}else{
				$_SESSION['respuesta'] = 'Cambio de contraseña exitoso';
					/* $hash_contrasena=mainModel::encryption($contrasena_nueva); */
					$respuesta = $cambioContrasena->cambioContrasena($usuario,$hash_contrasena);
					$respuesta = $cambioContrasena->desbloquearUsuario($usuario);
					$respuesta = $cambioContrasena->actualizarFechaVencimiento($usuario,$FechaVencimiento);
					$envioCorreo = new Correo();
					$respuesta = $envioCorreo->CorreoCambioContrasena($array['correo'],$contrasena_nueva);
					return header("Location:".SERVERURL."cambiocontrasena/");
				die();
			}
					 
		}

			//funcion encargada de redirigir al login siempre que se detecte que no hay una sesion activa 
				public function forzarCierreSesionControlador(){
					session_unset();
					session_destroy();
					if(headers_sent()){
						return "<script> window.location.href='".SERVERURL."login/'; </script>";
					}else{
						return header("Location:".SERVERURL."login/");
					}
				}


			public function registrarUltimaConexion($id){
				$id_usuario=mainModel::limpiar_cadena($id);
				$registrar = new Usuario(); 
				$respuesta = $registrar->registrarUltimaConexionModelo($id_usuario);
			}
					 
	}



		
