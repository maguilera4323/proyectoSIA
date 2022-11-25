<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/proveedorModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/proveedorModelo.php";
	require_once "./pruebabitacora.php";
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
		
		/*== Verificando integridad de los datos ==*/
		if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ ]{1,30}",$Nombre)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"El Nombre no coincide con el formato solicitado",
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
		
		if(mainModel::verificar_datos("[0-9]{1,20}",$Telefono)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"El telefono no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		if(mainModel::verificar_datos("[a-z@_0-9.]{1,30}",$Correo)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"El Correo no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		if(mainModel::verificar_datos("[A-Za-zÑñ0-9 .,]{1,250}",$Direccion)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"La Dirección no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}
	
					
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
					"Alerta"=>"recargar",
					"Titulo"=>"Proveedor registrado",
					"Texto"=>"Los datos del proveedor han sido registrados con exito",
					"Tipo"=>"success"
				];

				
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar el proveedor",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d h:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Creación de Proveedor",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." creó un nuevo proveedor en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */


	/*--------- Controlador actualizar proveedor ---------*/
	public function actualizar_proveedor_controlador()
	{	
		$id_actualizar=mainModel::limpiar_cadena($_POST['id_actualizacion']);
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
			if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ ]{1,30}",$Nombre)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El Nombre no coincide con el formato solicitado",
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
			
			if(mainModel::verificar_datos("[0-9]{1,20}",$Telefono)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El telefono no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[a-z@_0-9.]{1,30}",$Correo)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El Correo no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[A-Za-zÑñ0-9 .,]{1,100}",$Direccion)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"La Dirección no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}
		
	
			/*== ACTUALIZAR PROVEEDOR ==*/
		$datos_proveedor_actu=
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
					"Alerta"=>"recargar",
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
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Modificación de proveedor",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." actualizó un proveedor en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */
	

	public function datosproveedorControlador($tipo,$id){
		$tipo=mainModel::limpiar_cadena($tipo);
		$id=mainModel::limpiar_cadena($id);

		return proveedorModelo::datos_proveedor_modelo($tipo,$id);
	}

	

		//funcion para eliminar un proveedor
		public function eliminarProveedor()
		{
			$id=mainModel::limpiar_cadena(($_POST['id_proveedor_del']));
			$Proveedor=mainModel::limpiar_cadena(($_POST['proveedor_del']));
			$array=array();
			$valor='';

		

		//verifica que el proveedor si exista en el sistema
		$check_proveedor=mainModel::ejecutar_consulta_simple("SELECT id_Proveedores FROM TBL_Proveedores
		WHERE id_Proveedores='$id'");
		if($check_proveedor->rowCount()<=0){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ha ocurrido un error",
				"Texto"=>"El Proveedor seleccionado no existe",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		
		$eliminarproveedor=proveedorModelo::eliminar_proveedor_modelo("borrar",$id);
			if($eliminarproveedor->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Proveedor Eliminado",
					"Texto"=>"El Proveedor fue eliminado del sistema",
					"Tipo"=>"success"
				];

				echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Proveedor eliminado",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." eliminó un proveedor del sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora);
			
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ha ocurrido un error",
					"Texto"=>"El proveedor no pudo ser borrado",
					"Tipo"=>"error"
				];echo json_encode($alerta);
			}
			
			exit();

			
	}
}