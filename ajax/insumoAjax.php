<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['nombre_insumo_nuevo']) || isset($_POST['nombre_insumo_act']) || isset($_POST['id_insumo_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/insumoControlador.php";
		$ins_insumo = new insumoControlador();

		if(isset($_POST['nombre_insumo_nuevo'])){
			echo $ins_insumo->agregarInsumo();
			die();
		}
		
		if(isset($_POST['nombre_insumo_act']) ){
			echo $ins_insumo->actualizarInsumo();
			die();
		}
		
		if(isset($_POST['id_insumo_del']) ){
			echo $ins_insumo->eliminarInsumo();
			die();
		}
	}