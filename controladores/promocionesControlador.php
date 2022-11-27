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
					"Titulo"=>" Promocion registrada",
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
				"accion" => "Agregar Promocion",
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


			

	
			/*== ACTUALIZAR PROMOCIONES ==*/
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
					"Titulo"=>" Promoción registrada",
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
				"accion" => "Agregar Promocioón",
				"descripcion" => "Se agrego una nueva promoción en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora);  
	} /* Fin controlador */
	
	public function eliminarPromociones()
	{
		$id=mainModel::limpiar_cadena(($_POST['id_promociones_del']));
		$Cliente=mainModel::limpiar_cadena(($_POST['promocion_del']));
		$array=array();
		$valor='';

	

	//verifica que el cliente si exista en el sistema
	$check_promo=mainModel::ejecutar_consulta_simple("SELECT id_promociones FROM TBL_promociones
	WHERE id_promociones='$id'");
	if($check_promo->rowCount()<=0){
		$alerta=[
			"Alerta"=>"simple",
			"Titulo"=>"Ha ocurrido un error",
			"Texto"=>"La promocion seleccionado no existe",
			"Tipo"=>"error"
		];
		echo json_encode($alerta);
		exit();
	}

	
	$eliminarpromocion=promocionesModelo::eliminar_promociones_modelo("borrar",$id);
		if($eliminarpromocion->rowCount()==1){
			$alerta=[
				"Alerta"=>"recargar",
				"Titulo"=>"Promoción Borrada",
				"Texto"=>"La Promocion fue borrada",
				"Tipo"=>"success"
			];
		}else{
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ha ocurrido un error",
				"Texto"=>"La Promocion no pudo ser borrada",
				"Tipo"=>"error"
			];
		}
		echo json_encode($alerta);
	$datos_bitacora = [
		"id_objeto" => 0,
		"fecha" => date('Y-m-d H:i:s'),
		"id_usuario" => $_SESSION['id_login'],
		"accion" => "Promocion eliminado",
		"descripcion" => "El usuario ".$_SESSION['usuario_login']." eliminó una promocion del sistema"
	];
	Bitacora::guardar_bitacora($datos_bitacora);
		exit();

		
}
}