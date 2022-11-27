<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/promocionesModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/promocionesModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}


class promocionesControlador extends promocionesModelo
{

	/*--------- Controlador agregar promociones ---------*/
	public function agregar_promociones_controlador()
	{
		$Nombre_promo=mainModel::limpiar_cadena(strtoupper($_POST['nombre_promo_nuevo']));
		$Fecha_inicio=mainModel::limpiar_cadena(strtoupper($_POST['fecha_inicio_nuevo']));
		$Fecha_fin=mainModel::limpiar_cadena($_POST['fecha_final_nuevo']);
		$Estado_promo=mainModel::limpiar_cadena($_POST['estado_promo_nuevo']);
		$Precio_promo=mainModel::limpiar_cadena($_POST['precio_promo_nuevo']);
 
					
			/*== AGREGAR PROMOCION ==*/
			$datos_promocion_reg=[
				"promo"=>$Nombre_promo,
				"inipromo"=>$Fecha_inicio,
				"finpromo"=>$Fecha_fin,
				"estadopromo"=>$Estado_promo,
				"preciopromo"=>$Precio_promo,
			];

			$agregar_promocion=promocionesModelo::agregar_promociones_modelo($datos_promocion_reg);

			if($agregar_promocion->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>" Tipo Producto registrado",
					"Texto"=>"La promocion ha sido agregada con exito",
					"Tipo"=>"success"
				];

				
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido agregar la promocion",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d h:i:s'),
				"id_tipo_producto" => $_SESSION['id_login'],
				"accion" => "Agregar Tipo de Producto",
				"descripcion" => "Se agrego una nueva promoción en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */


	/*--------- Controlador actualizar promociones ---------*/
	public function actualizar_promociones_controlador()
	{	
		$id_actualizar=mainModel::limpiar_cadena($_POST['id_actualizacion']);
		$Nombre_promo=mainModel::limpiar_cadena(strtoupper($_POST['nombre_promo_actu']));
		$Fecha_inicio=mainModel::limpiar_cadena(strtoupper($_POST['fecha_inicio_actu']));
		$Fecha_fin=mainModel::limpiar_cadena($_POST['fecha_fin_actu']);
		$Estado_promo=mainModel::limpiar_cadena($_POST['estado_promo_actu']);
		$Precio_promo=mainModel::limpiar_cadena($_POST['precio_promo_actu']);
		
		if($Nombre_promo=="" || $Fecha_inicio=="" || $Fecha_fin=="" || $Estado_promo=="" || $Precio_promo==""){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"No se han llenado todos los campos que son obligatorios",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}


			

	
			/*== ACTUALIZAR TIPO PRODUCTO ==*/
			$datos_promocion_actu=[
				"promo"=>$Nombre_promo,
				"inipromo"=>$Fecha_inicio,
				"finpromo"=>$Fecha_fin,
				"estadopromo"=>$Estado_promo,
				"preciopromo"=>$Precio_promo,
			];

			$actualizar_promocion=promocionesModelo::actualizar_promociones_modelo($datos_promocion_actu,$id_actualizar);

			if($actualizar_promocion->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>" Tipo Producto registrado",
					"Texto"=>"La promocion ha sido actualizada con exito",
					"Tipo"=>"success"
				];

				
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido actualizar la promocion",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d h:i:s'),
				"id_tipo_producto" => $_SESSION['id_login'],
				"accion" => "Agregar Tipo de Producto",
				"descripcion" => "Se agrego una nueva promoción en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora);  
	} /* Fin controlador */
	

	public function datosTipoproductoControlador($tipo,$id){
		$tipo=mainModel::limpiar_cadena($tipo);
		$id=mainModel::limpiar_cadena($id);

		return TipoproductoModelo::datos_Tipo_producto_modelo($tipo,$id);
	}

	

		//funcion para eliminar un Tipo de producto
		public function eliminarPromociones()
		{
			$id=mainModel::limpiar_cadena(($_POST['id_tipo_producto_del']));
			$Tipo_producto=mainModel::limpiar_cadena(($_POST['tipo_producto_del']));
			$array=array();
			$valor='';

		

		//verifica que el usuario si exista en el sistema
		$check_proveedor=mainModel::ejecutar_consulta_simple("SELECT id_tipo_producto FROM TBL_tipo_producto
		WHERE id_tipo_Producto='$id'");
		if($check_Tipo_producto->rowCount()<=0){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ha ocurrido un error",
				"Texto"=>"El Tipo de Producto seleccionado no existe",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		
		$eliminarTipoproducto=TipoproductoModelo::eliminarPromociones("borrar",$id);
			if($eliminarTipoproducto->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Usuario Borrado",
					"Texto"=>"El Tipo de Producto fue borrado",
					"Tipo"=>"success"
				];
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ha ocurrido un error",
					"Texto"=>"El Tipo de Producto no pudo ser borrado",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);
		$datos_bitacora = [
			"id_objeto" => 0,
			"fecha" => date('Y-m-d H:i:s'),
			"id_tipo_producto" => $_SESSION['id_login'],
			"accion" => "Usuario inactivado",
			"descripcion" => "El usuario ".$_SESSION['usuario_login']." inactivó un usuario del sistema"
		];
		Bitacora::guardar_bitacora($datos_bitacora);
			exit();

			
	}
}