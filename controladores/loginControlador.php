<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

require_once './modelos/loginModelo.php';
require_once './controladores/loginControlador.php';
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

	} 