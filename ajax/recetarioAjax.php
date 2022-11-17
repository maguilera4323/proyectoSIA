<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['recetario_nuevo']) || isset($_POST['recetario_act']) || isset($_POST['recetario_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/recetarioControlador.php";
		$ins_recetario = new recetarioControlador();


		/*--------- Agregar una receta al recetario ---------*/
		if(isset($_POST['recetario_nuevo'])){
			echo $ins_recetario->agregarRecetario();
			die();
		}
		
		/*--------- Actualizar un recetario ---------*/
		if(isset($_POST['recetario_act']) ){
			echo $ins_recetario->actualizarRecetario();
			die();
		}
		
		/*--------- Eliminar un recetario ---------*/
		if(isset($_POST['recetario_del']) ){
			echo $ins_recetario->eliminarRecetario();
			die();
		}
	}