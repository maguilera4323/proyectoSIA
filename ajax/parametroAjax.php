<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['nombre_parametro_nuevo']) || isset($_POST['nombre_parametro_act']) || isset($_POST['id_parametro_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/parametroControlador.php";
		$ins_parametro = new parametroControlador();


		/*--------- Agregar un parametro ---------*/
		if(isset($_POST['nombre_parametro_nuevo'])){
			echo $ins_parametro->agregarParametro();
			die();
		}
		
		/*--------- Actualizar un parametro ---------*/
		if(isset($_POST['nombre_parametro_act']) ){
			echo $ins_parametro->actualizarParametro();
			die();
		}
		
		/*--------- Eliminar un parametro ---------*/
		if(isset($_POST['id_parametro_del']) ){
			echo $ins_parametro->eliminarParametro();
			die();
		}
	}