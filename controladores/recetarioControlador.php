<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/recetarioModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/recetarioModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}


class recetarioControlador extends recetarioModelo
{

	/*--------- Controlador agregar recetario---------*/
	public function agregarRecetario()
	{
		$Id_producto=mainModel::limpiar_cadena(strtoupper($_POST['recetario_nuevo']));
		$Id_insumo=mainModel::limpiar_cadena($_POST['Id_insumo_nuevo']);
		$cant_insumo=mainModel::limpiar_cadena($_POST['cant_insumo_nuevo']);
	

		//verificar datos ingresados
		if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ_0-9]{1,40}",$Id_producto)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"Los datos de la receta no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		if(mainModel::verificar_datos("[A-Za-zÑñ0-9]{1,40}",$Id_insumo)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"Los datos de la receta no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		if(mainModel::verificar_datos("[0-9.]{1,40}",$cant_insumo)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"Los datos de la receta no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

			$datos_recetario_reg=[
				"id_producto"=>$Id_producto,
				"id_insumo"=>$Id_insumo,
				"cant_insumo"=>$cant_insumo,
			
			];

			$agregar_recetario=recetarioModelo::agregar_recetario_modelo($datos_recetario_reg);

			if($agregar_recetario->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Receta Registrada",
					"Texto"=>"Los datos de la receta han sido registrados con exito",
					"Tipo"=>"success"
				];

				
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar la receta",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Creación de Receta",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." creó una nueva receta en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */


	/*--------- Controlador actualizar recetario ---------*/
	public function actualizarRecetario()
	{	
		$Id_producto=mainModel::limpiar_cadena(strtoupper($_POST['recetario_act']));
		$Id_insumo=mainModel::limpiar_cadena($_POST['Id_insumo_act']);
		$cant_insumo=mainModel::limpiar_cadena($_POST['cant_insumo_act']);
		$id_actualizar=mainModel::limpiar_cadena($_POST['id_actualizacion']);
		

		//verificar datos ingresados
		if(mainModel::verificar_datos("[0-9.]{1,40}",$cant_insumo)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"Los datos de la receta no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}


			$datos_recetario_act=[
				"id_producto"=>$Id_producto,
				"id_insumo"=>$Id_insumo,
				"cant_insumo"=>$cant_insumo,
			];

			$actualizar_recetario=recetarioModelo::actualizar_recetario_modelo($datos_recetario_act,$id_actualizar);

			if($actualizar_recetario->rowCount()==1)
			{
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Receta Actualizada",
					"Texto"=>"Receta actualizada exitosamente",
					"Tipo"=>"success"
				];
			}else
			{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido actualizar la Receta",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Modificación de Receta",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." actualizó una Receta del sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */
	

	
		//funcion para eliminar un recetario
		public function eliminarRecetario()
		{
			$id=mainModel::limpiar_cadena(($_POST['recetario_del']));

		//verifica que el recetario si exista en el sistema
		$check_recetario=mainModel::ejecutar_consulta_simple("SELECT id_recetario FROM TBL_recetario
		WHERE id_recetario='$id'");
		if($check_recetario->rowCount()<=0){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ha ocurrido un error",
				"Texto"=>"La receta seleccionada no existe",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		
		$eliminarrecetario=recetarioModelo::eliminar_recetario_modelo($id);
			if($eliminarrecetario->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Recetario Eliminado",
					"Texto"=>"La receta fue eliminada del sistema",
					"Tipo"=>"success"
				];
                echo json_encode($alerta);

                $datos_bitacora = [
                    "id_objeto" => 0,
                    "fecha" => date('Y-m-d H:i:s'),
                    "id_usuario" => $_SESSION['id_login'],
                    "accion" => "Receta eliminada",
                    "descripcion" => "El usuario ".$_SESSION['usuario_login']." eliminó una receta del sistema"
                ];
                Bitacora::guardar_bitacora($datos_bitacora);
                exit();
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ha ocurrido un error",
					"Texto"=>"La Receta no pudo ser borrada",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);
			exit();	
	}
}