<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['recetario_nuevo']) || isset($_POST['nombre_parametro_act']) || isset($_POST['id_parametro_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/recetarioControlador.php";
		$ins_recetario = new recetarioControlador();


		/*--------- Agregar una receta al recetario ---------*/
		if(isset($_POST['recetario_nuevo'])){
			echo $ins_recetario->agregarRecetario();
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