<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['objeto_nuevo']) || isset($_POST['objeto_act']) || isset($_POST['id_objeto_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/objetoControlador.php";
		$ins_objeto = new objetoControlador();


		if(isset($_POST['objeto_nuevo'])){
			echo $ins_objeto->agregarObjeto();
			die();
		}
		
		if(isset($_POST['objeto_act']) ){
			echo $ins_objeto->actualizarObjeto();
			die();
		}
		
		if(isset($_POST['id_objeto_del']) ){
			echo $ins_objeto->eliminarObjeto();
			die();
		}
	}