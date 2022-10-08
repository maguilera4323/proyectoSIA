<?php

require_once './modelos/loginModelo.php';
require_once "./controladores/VistasControlador.php";
require_once "./modelos/mainModel.php";

class loginControlador extends mainModel{
	//funcion para validar datos e iniciar sesion
	public function accesoUsuario($datos) {
		$usuario=mainModel::limpiar_cadena($datos['usuario']);
		$contrasena=mainModel::limpiar_cadena($datos['password']);
		$ingresos_erroneos=mainModel::limpiar_cadena($datos['contador']);

		$verificarDatos = new Usuario(); //se crea una instancia en el archivo modelo de Login
		$respuesta = $verificarDatos->accesoUsuario($usuario, $contrasena); //datos recibidos del archivo modelo de Login
			foreach ($respuesta as $fila) { //se recorre el arreglo recibido
				//datos guardados para ser usados posteriormenete en el sistema
				$array['nombre'] = $fila['nombre_usuario'];
				$array['usuario'] = $fila['usuario'];
				$array['estado'] = $fila['estado_usuario'];
			}

			//validacion en caso de que el estado del usuario sea Activo
			//y que tanto usuario como contraseña son correctos
			if (isset($array['nombre'])>0){
				switch ($array['estado']){
						case 'Activo':
							session_start();
							$_SESSION['usuario_login']=$array['usuario'];
							$_SESSION['nombre_usuario']=($array['nombre']);
							$_SESSION['estado']=$array['estado'];
							return header("Location:".SERVERURL."home/");
						break;
						case 'Inactivo':
							$_SESSION['respuesta'] = 'Usuario inactivo';//Creamos una nueva variable de sesion
							return header("Location:".SERVERURL."login/");
						break;
						case 'Bloqueado':
							$_SESSION['respuesta'] = 'Usuario bloqueado';//Creamos una nueva variable de sesion
							return header("Location:".SERVERURL."login/");
						break;
					}
					die();
            }else{
				//validacion cuando usuario o contraseña son incorrectos
				$ingresos_erroneos=mainModel::limpiar_cadena($datos['contador']);
 				/* $parametroIntentosValidos=new Usuario();
				$valorParametro=$verificarDatos->intentosValidos(); */

				//validacion para revisar si el usuario ingresado existe en el sistema y ver si está activo
				$query=$verificarDatos->verificarEstado($usuario);
					foreach ($query as $fila) { //se recorre el arreglo recibido
						//datos guardados para ser usados posteriormenete en el sistema
						$array['usuario'] = $fila['usuario'];
						$array['estado'] = $fila['estado_usuario'];
					}
					
					//Switch que valida si el usuario encontrado está activo
					//si no está activo o está bloqueado no se sigue la verificación para bloquearlo
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
								case 'Activo':
									if(($ingresos_erroneos>=2)){
										$respuesta = $verificarDatos->bloquearUsuario($usuario);
										$_SESSION['respuesta'] = 'Usuario bloqueado';
										return header("Location:".SERVERURL."login/");
									}else{
										$_SESSION['respuesta'] = 'Contraseña incorrecta';
										return header("Location:".SERVERURL."login/");
									break;
									}
								}  
						}else{
							$_SESSION['respuesta'] = 'Datos incorrectos';
							return header("Location:".SERVERURL."login/");
							die();
						}
					}
		}
				


		public function verificaUsuarioExistente($datos){
			$usuario=mainModel::limpiar_cadena($datos['usuario']);
			$metodo_rec=mainModel::limpiar_cadena($datos['metodo_recuperacion']);
			$array=array();

			$verificarUsuario = new Usuario(); //se crea una instancia en el archivo modelo de Login
			$respuesta = $verificarUsuario->verificaUsuarioExistente($usuario);
			foreach ($respuesta as $fila) { //se recorre el arreglo recibido
				//datos guardados para ser usados posteriormenete en el sistema
				$array['usuario'] = $fila['usuario'];
			}

			if (isset($array['usuario'])>0 && $metodo_rec=='Por medio de email'){
				session_start();
					$_SESSION['usuario_rec']=$array['usuario'];
					$_SESSION['fallo'] = '';
					echo $_SESSION['usuario_rec'];
					return header("Location:".SERVERURL."rec-correo/");
				die();
			}elseif (isset($array['usuario'])>0 && $metodo_rec=='Por preguntas de seguridad'){
				session_start();
					$_SESSION['usuario_rec']=$array['usuario'];
					$_SESSION['fallo'] = '';
					return header("Location:".SERVERURL."rec-preguntas/");
				die();
			}else{
				$_SESSION['respuesta'] = 'Usuario incorrecto';//Creamos una nueva variable de sesion
				return header("Location:".SERVERURL."olvido-contrasena/");
				die();
			}
		
		}


		public function verificaPreguntaSeguridad($datos){
			$pregunta=mainModel::limpiar_cadena($datos['pregunta']);
			$respuesta=mainModel::limpiar_cadena($datos['respuesta']);
			$usuario=$_SESSION['usuario_rec'];
			$array=array();

			$verificarRespuesta = new Usuario(); //se crea una instancia en el archivo modelo de Login
			$respuesta = $verificarRespuesta->verificarPreguntaSeguridad($pregunta,$respuesta,$usuario);
			foreach ($respuesta as $fila) { //se recorre el arreglo recibido
				//datos guardados para ser usados posteriormenete en el sistema
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


		public function modificarContrasena($datos){
			$contrasena_nueva=mainModel::limpiar_cadena($datos['contrasena_nueva']);
			$conf_contrasena_nueva=mainModel::limpiar_cadena($datos['conf_contrasena_nueva']);
			$usuario=$_SESSION['usuario_rec'];
			$array=array();

			$cambioContrasena = new Usuario(); //se crea una instancia en el archivo modelo de Login
			$respuesta = $cambioContrasena->verificarContrasenaActual($usuario);
			foreach($respuesta as $fila){
				$array['contrasena']=$fila['contrasena'];
			}
			
			if(($contrasena_nueva==$array['contrasena'])){
				$_SESSION['respuesta'] = 'Contraseña nueva igual a la actual';
					return header("Location:".SERVERURL."cambiocontrasena/");
				die();
			}
			
			if($contrasena_nueva!=$conf_contrasena_nueva){
				$_SESSION['respuesta'] = 'Contraseñas no coinciden';
					return header("Location:".SERVERURL."cambiocontrasena/");
				die();
			}else{
				$_SESSION['respuesta'] = 'Cambio de contraseña exitoso';
					$respuesta = $cambioContrasena->cambioContrasena($usuario,$contrasena_nueva);
					return header("Location:".SERVERURL."cambiocontrasena/");
				die();
			}
					 
		}


				public function forzarCierreSesionControlador(){
					session_unset();
					session_destroy();
					if(headers_sent()){
						return "<script> window.location.href='".SERVERURL."login/'; </script>";
					}else{
						return header("Location:".SERVERURL."login/");
					}
				}
			
}


		
