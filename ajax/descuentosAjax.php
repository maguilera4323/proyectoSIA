<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['descuentos_nuevo']) || isset($_POST['descuentos_actu']) || isset($_POST['id_descuentos_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/descuentosControlador.php";
		$ins_descuentos = new descuentosControlador();


		/*--------- Registrar un Descuento ---------*/
		if(isset($_POST['descuentos_nuevo'])){
			echo $ins_descuentos->agregar_descuentos_controlador();
			die();
		}
		
		if(isset($_POST['descuentos_actu']) ){
			echo $ins_descuentos->actualizar_descuentos_controlador();
			die();
		}
		
		if(isset($_POST['id_descuentos_del']) ){
			echo $ins_descuentos->eliminar_descuentos();
			die();
		}else{
			session_start();//se cambio de SPM  a SIA
			session_unset();//Vaciamos la sesion
			session_destroy();//destruimos la sesion
			header("Location: ".SERVERURL."login/");//lo redirigimos al login para que ingrese con su usuario
			exit();
		}
	}

	