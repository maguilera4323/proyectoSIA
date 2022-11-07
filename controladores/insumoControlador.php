<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/insumoModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/insumoModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}


class insumoControlador extends insumoModelo
{

	/*--------- Controlador agregar proveedor ---------*/
	public function agregarInsumo()
	{
		$nombre=mainModel::limpiar_cadena(strtoupper($_POST['nombre_insumo_nuevo']));
		$categoria=mainModel::limpiar_cadena($_POST['categoria_insumo_nuevo']);
		$cantmaxima=mainModel::limpiar_cadena($_POST['cantidadmax_insumo_nuevo']);
		$cantminima=mainModel::limpiar_cadena($_POST['cantidadmin_insumo_nuevo']);
		$unidad_medida=mainModel::limpiar_cadena($_POST['unidad_insumo_nuevo']);

		if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ ]{1,30}",$nombre)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"El nombre no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		if(mainModel::verificar_datos("[0-9]{1,10}",$cantmaxima)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"Ingrese una cantidad máxima válida",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		if(mainModel::verificar_datos("[0-9]{1,10}",$cantminima)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"Ingrese una cantidad mínima válida",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		if($cantminima>=$cantmaxima){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"La cantidad mínima debe ser menor que la cantidad máxima",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}
		
			$datos_insumo_reg=[
				"nombre"=>$nombre,
				"cat"=>$categoria,
				"cantmax"=>$cantmaxima,
				"cantmin"=>$cantminima,
				"unidad"=>$unidad_medida
			];

			$agregar_insumo=insumoModelo::agregar_insumo_modelo($datos_insumo_reg);

			if($agregar_insumo->rowCount()==1){
				$alerta=[
					"Alerta"=>"limpiar",
					"Titulo"=>"Insumo Registrado",
					"Texto"=>"Los datos del insumo han sido registrados con exito",
					"Tipo"=>"success"
				];

				
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar el insumo",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Creación de Insumo",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." creó un nuevo insumo en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */


	/*--------- Controlador actualizar usuario ---------*/
	public function actualizarInsumo()
	{	
		$nombre=mainModel::limpiar_cadena(strtoupper($_POST['nombre_insumo_act']));
		$categoria=mainModel::limpiar_cadena($_POST['categoria_insumo_act']);
		$cantmaxima=mainModel::limpiar_cadena($_POST['cantidadmax_insumo_act']);
		$cantminima=mainModel::limpiar_cadena($_POST['cantidadmin_insumo_act']);
		$unidad_medida=mainModel::limpiar_cadena($_POST['unidad_insumo_act']);
        $id_actualizar=mainModel::limpiar_cadena($_POST['id_actualizacion']);

		if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ ]{1,30}",$nombre)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"El nombre no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		if(mainModel::verificar_datos("[0-9]{1,10}",$cantmaxima)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"Ingrese una cantidad máxima válida",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		if(mainModel::verificar_datos("[0-9]{1,10}",$cantminima)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"Ingrese una cantidad mínima válida",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		if($cantminima>=$cantmaxima){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"La cantidad mínima debe ser menor que la cantidad máxima",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

           $datos_insumo_act=[
				"nombre"=>$nombre,
				"cat"=>$categoria,
				"cantmax"=>$cantmaxima,
				"cantmin"=>$cantminima,
				"unidad"=>$unidad_medida
			];

			$actualizar_insumo=insumoModelo::actualizar_insumo_modelo($datos_insumo_act,$id_actualizar);

			if($actualizar_insumo->rowCount()==1)
			{
				$alerta=[
					"Alerta"=>"limpiar",
					"Titulo"=>"Insumo Actualizado",
					"Texto"=>"Insumo actualizado exitosamente",
					"Tipo"=>"success"
				];
			}else
			{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido actualizar el insumo",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Modificación de insumo",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." actualizó un insumo en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */
	

	public function datosInsumoControlador($tipo,$id){
		$tipo=mainModel::limpiar_cadena($tipo);
		$id=mainModel::limpiar_cadena($id);

		return insumoModelo::datos_insumo_modelo($tipo,$id);
	}

	

		//funcion para eliminar un proveedor
		public function eliminarInsumo()
		{
			$id=mainModel::limpiar_cadena(($_POST['id_insumo_del']));
			$array=array();
			$valor='';

		//verifica que el insumo si exista en el sistema
		$check_insumo=mainModel::ejecutar_consulta_simple("SELECT id_insumos FROM TBL_insumos
		WHERE id_insumos='$id'");
		if($check_insumo->rowCount()<=0){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ha ocurrido un error",
				"Texto"=>"El insumo seleccionado no existe",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		
		$eliminarinsumo=insumoModelo::eliminar_insumo_modelo($id);
			if($eliminarinsumo->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Insumo Borrado",
					"Texto"=>"El insumo fue borrado del sistema",
					"Tipo"=>"success"
				];
                echo json_encode($alerta);

                $datos_bitacora = [
                    "id_objeto" => 0,
                    "fecha" => date('Y-m-d H:i:s'),
                    "id_usuario" => $_SESSION['id_login'],
                    "accion" => "Insumo eliminado",
                    "descripcion" => "El usuario ".$_SESSION['usuario_login']." eliminó un insumo del sistema"
                ];
                Bitacora::guardar_bitacora($datos_bitacora);
                exit();
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ha ocurrido un error",
					"Texto"=>"El insumo no pudo ser borrado",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);
			exit();	
	}
}