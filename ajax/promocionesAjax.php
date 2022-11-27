<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['nombre_promocion_nuevo']) || isset($_POST['nombre_promocion_actu']) || isset($_POST['id_promocion_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/promocionesControlador.php";
		$ins_promociones = new promocionesControlador();


		/*--------- Agregar una promocion ---------*/
		if(isset($_POST['nombre_promocion_nuevo'])){
			echo $ins_promociones->agregar_promociones_controlador();
			die();
		}
		
		if(isset($_POST['nombre_promocion_actu']) ){
			echo $ins_promociones->actualizar_promociones_controlador();
			die();
		}
		
		if(isset($_POST['id_promocion_del']) ){
			echo $ins_promociones->eliminarPromociones();
			die();
		}
	}

	