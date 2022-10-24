<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/usuarioModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/usuarioModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}


class usuarioControlador extends usuarioModelo
{

	/*--------- Controlador agregar usuario ---------*/
	public function agregar_usuario_controlador()
	{
		$Usuario=mainModel::limpiar_cadena(strtoupper($_POST['usuario_reg']));
		$Nombre=mainModel::limpiar_cadena(strtoupper($_POST['nombre_usuario_reg']));
		$Estado=4;
		$Correo=mainModel::limpiar_cadena($_POST['correo_electronico_reg']);
		$Contraseña=mainModel::limpiar_cadena($_POST['contrasena_reg']);
		$Confirmar_contr=mainModel::limpiar_cadena($_POST['conf_contrasena_reg']);
		$Ingreso=0;
		$fcha = date("Y-m-d");
		$Vencimiento=date("Y-m-d",strtotime($fcha."+ 360 days"));
		$creado=mainModel::limpiar_cadena($_POST['usuario_creacion']);
		$Creacion=date('y-m-d H:i:s');
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
					"Texto"=>"El usuario no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[A-ZÑ ]{1,20}",$Nombre)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El nombre no coincide con el formato solicitado",
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
					"Texto"=>"La clave no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			} 

			if($Contraseña!=$Confirmar_contr){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"Las contraseñas no coinciden. Ingreselas nuevamente.",
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
					"Texto"=>"El usuario ingresado ya se encuentra registrado en el sistema",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if($Contraseña!=$Confirmar_contr){
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
				return header("Location:".SERVERURL."user-list/");

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

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d h:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Creación de usuario",
				"descripcion" => "Se creó un nuevo usuario en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */


	/*--------- Controlador actualizar usuario ---------*/
	public function actualizar_usuario_controlador()
	{	
		$Usuario=mainModel::limpiar_cadena($_POST['usuario_actu']);
		$Nombre=mainModel::limpiar_cadena($_POST['nombre_usuario_actu']);
		$Estado=mainModel::limpiar_cadena($_POST['estado_actu']);
		$Correo=mainModel::limpiar_cadena($_POST['correo_electronico_actu']);
		$Modificacion=date('y-m-d H:i:s');
		$Modificado=mainModel::limpiar_cadena($_POST['usuario_modificacion']);
		$privilegio=mainModel::limpiar_cadena($_POST['id_rol_actu']);
		$id_actualizar=mainModel::limpiar_cadena($_POST['id_actualizacion']); 

		if($Usuario=="" || $Nombre=="" || $Correo==""){
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
				"Texto"=>"El usuario Admin no puede tener un estado diferente de Activo",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		if($Usuario=='ADMIN' && $privilegio!=1){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"El usuario ADMIN no puede tener otro rol diferente de Admin Sistema",
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

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d h:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Modificación de usuario",
				"descripcion" => "Se actualizó un usuario en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */
	

	public function datosUsuarioControlador($tipo,$id){
		$tipo=mainModel::limpiar_cadena($tipo);
		$id=mainModel::limpiar_cadena($id);

		return usuarioModelo::datos_usuario_modelo($tipo,$id);
	}

	//funcion para eliminar o inactivar un usuario
	public function eliminarUsuario(){
		$id=mainModel::limpiar_cadena(($_POST['id_usuario_del']));
		$Usuario=mainModel::limpiar_cadena(($_POST['usuario_del']));
		$array=array();
		$valor='';

		//se verifica que el usuario a bloquear o inactivar no sea el usuario administrador
		if($Usuario=="ADMIN"){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"El usuario ADMIN no puede ser eliminado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		//verifica que el usuario si exista en el sistema
		$check_usuario=mainModel::ejecutar_consulta_simple("SELECT id_usuario FROM TBL_usuarios 
		WHERE id_usuario='$id'");
		if($check_usuario->rowCount()<=0){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ha ocurrido un error",
				"Texto"=>"El usuario seleccionado no existe",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		//se verifica el valor del primer ingreso debido a que un usuario que ha sido creado y no ha ingresado al sistema
		//aun no ha configurado sus preguntas de seguridad
		$verificarPrimerIngreso=mainModel::ejecutar_consulta_simple("SELECT * FROM TBL_usuarios 
		WHERE id_usuario='$id'");
		foreach($verificarPrimerIngreso as $fila){
			$array['valor']=$fila['primer_ingreso'];
		}

		//si el usuario si ha ingresado al sistema se procede a inactivar para evitar errores de la bd
		if($array['valor']==1){
			$eliminarUsuario=usuarioModelo::eliminar_usuario_modelo("inactivar",$id);
				if($eliminarUsuario->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Usuario inactivado",
					"Texto"=>"El usuario fue inactivado, ya que existen registros conectados con el mismo.",
					"Tipo"=>"success"
				];
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ha ocurrido un error",
					"Texto"=>"El usuario no pudo ser inactivado",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);
			exit();

			//si el usuario no ha ingresado al sistema por primera vez se elimina el registro
		}else if($array['valor']==0){
			$eliminarUsuario=usuarioModelo::eliminar_usuario_modelo("eliminar",$id);
				if($eliminarUsuario->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Usuario eliminado",
					"Texto"=>"El usuario fue eliminado del sistema",
					"Tipo"=>"success"
				];
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ha ocurrido un error",
					"Texto"=>"El usuario no pudo ser eliminado",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);
			exit();
		}
	}


}