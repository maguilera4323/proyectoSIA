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
						$_SESSION['fallo_login'] = 'Usuario inactivo';//Creamos una nueva variable de sesion
    					return header("Location:".SERVERURL."login/");
					break;
					case 'Bloqueado':
						$_SESSION['fallo_login'] = 'Usuario bloqueado';//Creamos una nueva variable de sesion
    					return header("Location:".SERVERURL."login/");
					break;
				}
				die();
            }else{
				//validacion cuando usuario o contraseña son incorrectos
				$ingresos_erroneos=mainModel::limpiar_cadena($datos['contador']);
				/* $parametroIntentosValidos=new Usuario();
				$valorParametro=$verificarDatos->intentosValidos(); */
	
				if($ingresos_erroneos>=3){
					$respuesta = $verificarDatos->bloquearUsuario($usuario);
					$_SESSION['fallo_login'] = 'Usuario bloqueado';//Creamos una nueva variable de sesion
    				return header("Location:".SERVERURL."login/");
				die();
				} 
				$_SESSION['fallo_login'] = 'Datos incorrectos';//Creamos una nueva variable de sesion
				return header("Location:".SERVERURL."login/");
				die();
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
				echo $_SESSION['usuario_rec'];
				return header("Location:".SERVERURL."rec-correo/");
				die();
			}elseif (isset($array['usuario'])>0 && $metodo_rec=='Por preguntas de seguridad'){
				session_start();
				$_SESSION['usuario_rec']=$array['usuario'];
				return header("Location:".SERVERURL."rec-preguntas/");
				die();
			}else{
				$_SESSION['fallo_login'] = 'Datos incorrectos';//Creamos una nueva variable de sesion
				return header("Location:".SERVERURL."olvido-contrasena/");
				die();
			}
		
		}


		public function verificaPregunta($datos){
			$pregunta=mainModel::limpiar_cadena($datos['pregunta']);
			$respuesta=mainModel::limpiar_cadena($datos['respuesta']);
			$usuario=$_SESSION['usuario_rec'];
			$array=array();

			$verificarRespuesta = new Usuario(); //se crea una instancia en el archivo modelo de Login
			$respuesta = $verificarRespuesta->verificaPregunta($pregunta,$respuesta,$usuario);
			foreach ($respuesta as $fila) { //se recorre el arreglo recibido
				//datos guardados para ser usados posteriormenete en el sistema
				$array['registro_encontrado']=$fila['registro_encontrado'];
			}

			if ($array['registro_encontrado']>0){
				echo 'Si funciona';
		
			}else{
				echo 'Houston, tenemos un problema';
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
