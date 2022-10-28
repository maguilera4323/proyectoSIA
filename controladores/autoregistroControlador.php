<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/autoregistroModelo.php";
	require_once "../modelos/loginModelo.php";
}else{
	require_once "./modelos/autoregistroModelo.php";
	require_once "./modelos/loginModelo.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}

class autoregistroControlador extends autoregistroModelo
{
    // controlador para el autoregistro del usuario
    public function autoregistro_controlador()
    {
        $Usuario=mainModel::limpiar_cadena($_POST['usuario_autoreg']);
		$Nombre=mainModel::limpiar_cadena($_POST['nameusuario_autoreg']);
		$Correo=mainModel::limpiar_cadena($_POST['correo_electronico_autoreg']);
		$Contraseña=mainModel::limpiar_cadena($_POST['contrasena_autoreg']);
		$Rol=4;
		$fcha = date("Y-m-d");
		$Vencimiento=date("Y-m-d",strtotime($fcha."+ 360 days"));
		$Estado=1;
		$creado=mainModel::limpiar_cadena($_POST['usuario_autoreg']);
		$Creacion=date('y-m-d H:i:s');

        // comprobación de campos vacios
        if($Usuario=="" || $Nombre=="" || $Correo=="" || $Contraseña=="" ){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"No se han llenado todos los campos que son obligatorios",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

        /*== Verificando integridad de los datos ==*/
			if(mainModel::verificar_datos("[A-Z]{1,15}",$Usuario)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El USUARIO no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,20}",$Nombre)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El NOMBRE no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			/*== Comprobando email ==*/
			if($Correo!=""){
				if(filter_var($Correo,FILTER_VALIDATE_EMAIL)){
					$check_correo=mainModel::ejecutar_consulta_simple("SELECT correo_electronico FROM TBL_usuarios WHERE correo_electronico='$Correo'");
					if($check_correo->rowCount()>0){
						$alerta=[
							"Alerta"=>"simple",
							"Titulo"=>"Ocurrió un error inesperado",
							"Texto"=>"El Correo ingresado ya se encuentra registrado en el sistema",
							"Tipo"=>"error"
						];
						echo json_encode($alerta);
						exit();
					}
				}else{
					$alerta=[
						"Alerta"=>"simple",
						"Titulo"=>"Ocurrió un error inesperado",
						"Texto"=>"Ha ingresado un correo no valido",
						"Tipo"=>"error"
					];
					echo json_encode($alerta);
					exit();
				}
			}

			/*== Comprobando CLAVE ==*/

			 if(mainModel::verificar_datos("[a-zA-Z0-9$@.-]{7,100}",$Contraseña) ){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"Las CLAVES no coinciden con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			} 



			/*== Comprobando usuario ==*/
			$check_user=mainModel::ejecutar_consulta_simple("SELECT usuario FROM TBL_usuarios WHERE usuario='$Usuario'");
			if($check_user->rowCount()>0){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El NOMBRE DE USUARIO ingresado ya se encuentra registrado en el sistema",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if($Contraseña=""){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"Usted no ha ingresado una contraseña o no ha respetado los parametros de validacion",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}else{
				$clave=mainModel::encryption($Contraseña);
			}

			$_SESSION['usuario']=$Usuario;

            /*== AGREGAR USUARIOS ==*/
			$datos_usuario_reg=[
				"usu"=>$Usuario,
				"nombre"=>$Nombre,
				"estado"=>$Estado,
				"contrase"=>$clave,//$Contraseña,
				"vencimiento"=>$Vencimiento,
				"correo"=>$Correo,
				"rol"=>$Rol,
				"creador"=>$creado,
				"fecha_crea"=>$Creacion
			];

			$agregar_usuario=autoregistroModelo::autoregistro_modelo($datos_usuario_reg);
			$cambioContrasena=new Usuario();
			$respuesta = $cambioContrasena->cambioContrasena($Usuario,$clave);

			if($agregar_usuario->rowCount()==1){
				$alerta=[
					"Alerta"=>"limpiar",
					"Titulo"=>"Usuario registrado",
					"Texto"=>"Los datos del usuario han sido registrados con exito",
					"Tipo"=>"success"
				];
			
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar el usuario",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);
	
			return header("Location:".SERVERURL."preguntasusuario/");
    }
}    /* Fin controlador */
