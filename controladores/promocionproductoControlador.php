<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/promocionproductoModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/promocionproductoModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}


class promocionproductoControlador extends promocionproductoModelo
{

	/*--------- Controlador agregar promocionproducto---------*/
	public function agregarPromocionproducto()
	{
		$Id_promocion=mainModel::limpiar_cadena(strtoupper($_POST['promocionproducto_nuevo']));
		$Id_producto=mainModel::limpiar_cadena($_POST['Id_producto_nuevo']);
		$cantidad=mainModel::limpiar_cadena($_POST['cant_promocionproducto_nuevo']);
	

		//verificar datos ingresados
		if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ_0-9]{1,40}",$Id_promocion)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"Los datos de la promocion de productos no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		if(mainModel::verificar_datos("[A-Za-zÑñ0-9]{1,40}",$Id_producto)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"Los datos de la promocion de productos no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		if(mainModel::verificar_datos("[0-9.]{1,40}",$cantidad)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"Los datos de la promocion de productos no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

			$datos_promocionproducto_reg=[
				"id_promociones"=>$Id_promocion,
				"id_producto"=>$Id_producto,
				"cantidad"=>$cantidad,
			
			];

			$agregar_promocionproducto=promocionproductoModelo::agregar_promocionproducto_modelo($datos_promocionproducto_reg);

			if($agregar_promocionproducto->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Promocion de producto Registrada",
					"Texto"=>"Los datos de la Promocion de producto han sido registrados con exito",
					"Tipo"=>"success"
				];

				
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar la Promocion de producto",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Creación de Receta",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." creó una nueva Promocion de productoen el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */


	/*--------- Controlador actualizar promocionproducto ---------*/
	public function actualizarPromocionproducto()
	{	
		$Id_promocion=mainModel::limpiar_cadena(strtoupper($_POST['promocionproducto_act']));
		$Id_producto=mainModel::limpiar_cadena($_POST['Id_producto_act']);
		$cantidad=mainModel::limpiar_cadena($_POST['cantidad_act']);
		$id_actualizar=mainModel::limpiar_cadena($_POST['id_actualizacion']);
		

		//verificar datos ingresados
		if(mainModel::verificar_datos("[0-9.]{1,40}",$cantidad)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"Los datos de la promocion del producto no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}


			$datos_promocionproducto_act=[
				"id_promociones"=>$Id_promocion,
				"id_producto"=>$Id_producto,
				"cantidad"=>$cantidad,
			];

			$actualizar_promocionproducto=promocionproductoModelo::actualizar_promocionproducto_modelo($datos_promocionproducto_act,$id_actualizar);

			if($actualizar_promocionproducto->rowCount()==1)
			{
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Promocion de producto Actualizada",
					"Texto"=>"Promocion de producto actualizada exitosamente",
					"Tipo"=>"success"
				];
			}else
			{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido actualizar la promocion de producto",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Modificación de Receta",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." actualizó una Promocion de producto del sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */
	

	
		//funcion para eliminar un promocionproducto
		public function eliminarPromocionproducto()
		{
			$id=mainModel::limpiar_cadena(($_POST['promocionproducto_del']));

		//verifica que el promocionproducto si exista en el sistema
		$check_promocionproducto=mainModel::ejecutar_consulta_simple("SELECT id_promociones_productos FROM TBL_promociones_productos
		WHERE id_promociones_productos='$id'");
		if($check_promocionproducto->rowCount()<=0){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ha ocurrido un error",
				"Texto"=>"La promocion de producto seleccionada no existe",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		
		$eliminarpromocionproducto=promocionproductoModelo::eliminar_promocionproducto_modelo($id);
			if($eliminarpromocionproducto->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Recetario Eliminado",
					"Texto"=>"La promocion de producto fue eliminada del sistema",
					"Tipo"=>"success"
				];
                echo json_encode($alerta);

                $datos_bitacora = [
                    "id_objeto" => 0,
                    "fecha" => date('Y-m-d H:i:s'),
                    "id_usuario" => $_SESSION['id_login'],
                    "accion" => "Receta eliminada",
                    "descripcion" => "El usuario ".$_SESSION['usuario_login']." eliminó una promocion de producto del sistema"
                ];
                Bitacora::guardar_bitacora($datos_bitacora);
                exit();
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ha ocurrido un error",
					"Texto"=>"La promocion de producto no pudo ser borrada",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);
			exit();	
	}
}