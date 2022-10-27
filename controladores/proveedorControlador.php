<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/proveedorModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/proveedorModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}


class proveedorControlador extends proveedorModelo
{

	/*--------- Controlador agregar proveedor ---------*/
	public function agregar_proveedor_controlador()
	{
		$Nombre=mainModel::limpiar_cadena(strtoupper($_POST['nombre_proveedor_nuevo']));
		$Rtn=mainModel::limpiar_cadena(strtoupper($_POST['rtn_proveedor_nuevo']));
		$Telefono=mainModel::limpiar_cadena($_POST['telefono_proveedor_nuevo']);
		$Correo=mainModel::limpiar_cadena($_POST['correo_proveedor_nuevo']);
		$Direccion=mainModel::limpiar_cadena($_POST['direccion_proveedor_nuevo']);
		
					
			/*== AGREGAR PROVEEDOR ==*/
			$datos_proveedor_reg=[
				"nombre"=>$Nombre,
				"rtn"=>$Rtn,
				"telefono"=>$Telefono,
				"correo"=>$Correo,
				"direccion"=>$Direccion
			];

			$agregar_proveedor=proveedorModelo::agregar_proveedor_modelo($datos_proveedor_reg);

			if($agregar_proveedor->rowCount()==1){
				$alerta=[
					"Alerta"=>"limpiar",
					"Titulo"=>"Proveedor registrado",
					"Texto"=>"Los datos del proveedor han sido registrados con exito",
					"Tipo"=>"success"
				];

				
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar el Proveedor",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d h:i:s'),
				"id_Proveedores" => $_SESSION['id_login'],
				"accion" => "Creación de Proveedor",
				"descripcion" => "Se creó un nuevo proveedor en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */


	/*--------- Controlador actualizar usuario ---------*/
	public function actualizar_proveedor_controlador()
	{	
		$Nombre=mainModel::limpiar_cadena($_POST['nombre_proveedor_actu']);
		$Rtn=mainModel::limpiar_cadena($_POST['rtn_proveedor_actu']);
		$Telefono=mainModel::limpiar_cadena($_POST['telefono_proveedor_actu']);
		$Correo=mainModel::limpiar_cadena($_POST['correo_proveedor_actu']);
		$Direccion=mainModel::limpiar_cadena($_POST['direccion_proveedor_actu']);
		
		if($Nombre=="" || $Rtn=="" || $Telefono=="" || $Correo=="" || $Direccion==""){
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
			if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ]{1,30}",$Nombre)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El NOMBRE no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[0-9]{1,14}",$Rtn)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El RTN no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}
			
			if(mainModel::verificar_datos("[0-9]{1,14}",$Telefono)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El RTN no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}
		

	
			/*== ACTUALIZAR PROVEEDOR ==*/
		$datos_usuario_actu=
			[
				"nombre"=>$Nombre,
				"rtn"=>$Rtn,
				"telefono"=>$Telefono,
				"correo"=>$Correo,
				"direccion"=>$Direccion,
						
			];

			$actualizar_proveedor=proveedorModelo::actualizar_proveedor_modelo($datos_proveedor_actu,$id_actualizar);

			if($actualizar_proveedor->rowCount()==1)
			{
				$alerta=[
					"Alerta"=>"limpiar",
					"Titulo"=>"Proveedor Actualizado",
					"Texto"=>"Proveedor actualizado exitosamente",
					"Tipo"=>"success"
				];
			}else
			{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido actualizar el proveedor",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d h:i:s'),
				"id_Proveedores" => $_SESSION['id_login'],
				"accion" => "Modificación de proveedor",
				"descripcion" => "Se actualizó un proveedor en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */
	

	public function datosproveedorControlador($tipo,$id){
		$tipo=mainModel::limpiar_cadena($tipo);
		$id=mainModel::limpiar_cadena($id);

		return proveedorModelo::datos_proveedor_modelo($tipo,$id);
	}

	

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