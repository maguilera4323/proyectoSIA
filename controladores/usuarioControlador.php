<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/usuarioModelo.php";
}else{
	require_once "./modelos/usuarioModelo.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}
/* require_once "../pruebabitacora.php"; */

class usuarioControlador extends usuarioModelo
{

	/*--------- Controlador agregar usuario ---------*/
	public function agregar_usuario_controlador()
	{
		$Usuario=mainModel::limpiar_cadena($_POST['usuario_reg']);
		$Nombre=mainModel::limpiar_cadena($_POST['nombre_usuario_reg']);
		$Estado=4;
		$Correo=mainModel::limpiar_cadena($_POST['correo_electronico_reg']);
		$Contraseña=mainModel::limpiar_cadena($_POST['contrasena_reg']);
		$Ingreso=mainModel::limpiar_cadena($_POST['primer_ingreso_reg']);
		$fcha = date("Y-m-d");
		$Vencimiento=date("Y-m-d",strtotime($fcha."+ 360 days"));
		$creado=mainModel::limpiar_cadena($_POST['usuario_creacion']);
		$Creacion=date('y-m-d h:i:s');
		$privilegio=mainModel::limpiar_cadena($_POST['id_rol']);


		/*== comprobar campos vacios ==*/
		if($Usuario=="" || $Nombre=="" || $Correo=="" || $Contraseña==""){
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
							"Texto"=>"El correo ingresado ya se encuentra registrado en el sistema",
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

			/*== Comprobando privilegio ==*/
			if(!$privilegio){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"Seleccione un rol",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			/*== AGREGAR USUARIOS ==*/
			$datos_usuario_reg=[
				"usu"=>$Usuario,
				"nombre"=>$Nombre,
				"estado"=>$Estado,
				"contrase"=>$clave,//$Contraseña,
				"rol"=>$privilegio,
				"ingreso"=>$Ingreso,
				"vencimiento"=>$Vencimiento,
				"correo"=>$Correo,
				"creador"=>$creado,
				"fecha_crea"=>$Creacion
			];

			$agregar_usuario=usuarioModelo::agregar_usuario_modelo($datos_usuario_reg);

			if($agregar_usuario->rowCount()==1){
				$alerta=[
					"Alerta"=>"limpiar",
					"Titulo"=>"Usuario registrado",
					"Texto"=>"Los datos del usuario han sido registrados con exito",
					"Tipo"=>"success"
				];

				/* $envioCorreo = new Correo();
				$respuesta = $envioCorreo->CorreoCreacionUsuario($Correo,$Usuario,$Contraseña); */
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar el usuario",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			/* $datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d h:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Creación de usuario",
				"descripcion" => "Se creó un nuevo usuario en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); */
	} /* Fin controlador */


	/*--------- Controlador actualizar usuario ---------*/
	public function actualizar_usuario_controlador()
	{	
		$Usuario=mainModel::limpiar_cadena($_POST['usuario_actu']);
		$Nombre=mainModel::limpiar_cadena($_POST['nombre_usuario_actu']);
		$Estado=mainModel::limpiar_cadena($_POST['estado_actu']);
		$Correo=mainModel::limpiar_cadena($_POST['correo_electronico_actu']);
		$Ingreso=mainModel::limpiar_cadena($_POST['primer_ingreso_actu']);
		$Contraseña=mainModel::limpiar_cadena($_POST['contrasena_actu']);
		$Modificacion=date('y-m-d h:i:s');
		$Modificado=mainModel::limpiar_cadena($_POST['usuario_modificacion']);
		$privilegio=mainModel::limpiar_cadena($_POST['id_rol_actu']);
		$id_actualizar=mainModel::limpiar_cadena($_POST['id_actualizacion']); 

		if($Usuario=="" || $Nombre=="" || $Correo=="" || $Contraseña==""){
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
			
		if($Usuario=='ADMIN' && $Estado!=1){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"El usuario Admin no puede ser inactivado o borrado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		if($Usuario=='ADMIN' && $privilegio!=1){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"El usuario Admin no puede tener otro rol diferente de Admin Sistema",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

			/*== ACTUALIZAR USUARIOS ==*/
		$datos_usuario_actu=
			[
				"usua"=>$Usuario,
				"nombrea"=>$Nombre,
				"correoa"=>$Correo,
				"estadoa"=>$Estado,
				"ingresoa"=>$Ingreso,	
				"contrasea"=>$Contraseña,
				"fecha_modif"=>$Modificacion,
				"modificador"=>$Modificado,
				"rola"=>$privilegio,		
			];

			$actualizar_usuario=usuarioModelo::actualizar_usuario_modelo($datos_usuario_actu,$id_actualizar);

			if($actualizar_usuario->rowCount()==1)
			{
				$alerta=[
					"Alerta"=>"limpiar",
					"Titulo"=>"Usuario Actualizado",
					"Texto"=>"Usuario actualizado exitosamente",
					"Tipo"=>"success"
				];
			}else
			{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido actualizar el usuario",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

/* 			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d h:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Actualización de usuario",
				"descripcion" => "Se actualizaron los datos de un usuario en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); */
	} /* Fin controlador */
	
	public function datosUsuarioControlador($tipo,$id){
		$tipo=mainModel::limpiar_cadena($tipo);
		$id=mainModel::limpiar_cadena($id);

		return usuarioModelo::datos_usuario_modelo($tipo,$id);
	}


}