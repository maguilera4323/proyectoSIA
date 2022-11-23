<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/clienteModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/clienteModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}


class clienteControlador extends clienteModelo
{

	/*--------- Controlador agregar cliente ---------*/
	public function agregar_cliente_controlador()
	{
		$Nombre=mainModel::limpiar_cadena(strtoupper($_POST['nombre_cliente_nuevo']));
		$Dni=mainModel::limpiar_cadena(strtoupper($_POST['dni_cliente']));
		$Rtn=mainModel::limpiar_cadena($_POST['rtn_cliente']);
		$telefono=mainModel::limpiar_cadena($_POST['telefono_nuevo']);
		

		if($Nombre=="" || $Dni=="" || $Rtn=="" || $telefono=="" ){
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
					"Texto"=>"El NOMBRE no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[0-9 -]{1,14}",$Rtn)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El RTN no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[0-9 -]{1,14}",$Dni)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El DNI no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[0-9 -]{1,20}",$telefono)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El TELEFONO no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

					
			/*== AGREGAR CLIENTE ==*/
			$datos_cliente_reg=[
				"nombre"=>$Nombre,
				"dni"=>$Dni,
				"rtn"=>$Rtn,	
				"tel"=>$telefono,
			];

			$agregar_cliente=clienteModelo::agregar_cliente_modelo($datos_cliente_reg);

			if($agregar_cliente->rowCount()==1){
				$alerta=[
					"Alerta"=>"limpiar",
					"Titulo"=>"Cliente registrado",
					"Texto"=>"Los datos del cliente han sido registrados con exito",
					"Tipo"=>"success"
				];

				
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar el Cliente",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d h:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Creación de Cliente",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." creó un nuevo cliente en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */


	/*--------- Controlador actualizar proveedor ---------*/
	public function actualizar_cliente_controlador()
	{	
		$id_actualizar=mainModel::limpiar_cadena($_POST['id_actualizacion']);
		$Nombre=mainModel::limpiar_cadena(strtoupper($_POST['nombre_cliente_actu']));
		$Dni=mainModel::limpiar_cadena(strtoupper($_POST['dni_cliente_actu']));
		$Rtn=mainModel::limpiar_cadena($_POST['rtn_cliente_actu']);
		$telefono=mainModel::limpiar_cadena($_POST['telefono_actu']);
		
		if($Nombre=="" || $Dni=="" || $Rtn=="" || $telefono=="" ){
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
					"Texto"=>"El NOMBRE no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[0-9 -]{1,14}",$Rtn)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El RTN no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[0-9 -]{1,14}",$Dni)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El DNI no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[0-9 -]{1,20}",$telefono)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El TELEFONO no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}
			
	
	
			/*== ACTUALIZAR cliente ==*/
		$datos_cliente_actu=
			[
				"nombre"=>$Nombre,
				"dni"=>$Dni,
				"rtn"=>$Rtn,	
				"tel"=>$telefono,
						
			];

			$actualizar_cliente=clienteModelo::actualizar_cliente_modelo($datos_cliente_actu,$id_actualizar);

			if($actualizar_cliente->rowCount()==1)
			{
				$alerta=[
					"Alerta"=>"limpiar",
					"Titulo"=>"Cliente Actualizado",
					"Texto"=>"CLiente actualizado exitosamente",
					"Tipo"=>"success"
				];
			}else
			{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido actualizar el Cliente",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d h:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Modificación de cliente",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." actualizó un cliente en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */
	

	public function datosclienteControlador($tipo,$id){
		$tipo=mainModel::limpiar_cadena($tipo);
		$id=mainModel::limpiar_cadena($id);

		return clienteModelo::datos_cliente_modelo($tipo,$id);
	}

	

		//funcion para eliminar un cliente
		public function eliminarCliente()
		{
			$id=mainModel::limpiar_cadena(($_POST['id_cliente_del']));
			$Cliente=mainModel::limpiar_cadena(($_POST['cliente_del']));
			$array=array();
			$valor='';

		

		//verifica que el cliente si exista en el sistema
		$check_cliente=mainModel::ejecutar_consulta_simple("SELECT id_clientes FROM TBL_Cliente
		WHERE id_cliente='$id'");
		if($check_cliente->rowCount()<=0){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ha ocurrido un error",
				"Texto"=>"El Proveedor seleccionado no existe",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		
		$eliminarcliente=clienteModelo::eliminar_cliente_modelo("borrar",$id);
			if($eliminarcliente->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Usuario Borrado",
					"Texto"=>"El Proveedor fue borrado",
					"Tipo"=>"success"
				];
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ha ocurrido un error",
					"Texto"=>"El proveedor no pudo ser borrado",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);
		$datos_bitacora = [
			"id_objeto" => 0,
			"fecha" => date('Y-m-d H:i:s'),
			"id_usuario" => $_SESSION['id_login'],
			"accion" => "Proveedor eliminado",
			"descripcion" => "El usuario ".$_SESSION['usuario_login']." eliminó un cliente del sistema"
		];
		Bitacora::guardar_bitacora($datos_bitacora);
			exit();

			
	}
}