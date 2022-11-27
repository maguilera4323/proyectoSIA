<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['nombre_promo_nuevo']) || isset($_POST['nombre_promo_actu']) || isset($_POST['id_promociones_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/promocionesControlador.php";
		$ins_promociones = new promocionesControlador();


		/*--------- Agregar una promocion ---------*/
		if(isset($_POST['nombre_promo_nuevo'])){
			echo $ins_promociones->agregar_promociones_controlador();
			die();
		}
		
		if(isset($_POST['nombre_promo_actu']) ){
			echo $ins_promociones->actualizar_promociones_controlador();
			die();
		}
		
		if(isset($_POST['id_promociones_del']) ){
			echo $ins_promociones->eliminarPromociones();
			die();
		}
	}

	