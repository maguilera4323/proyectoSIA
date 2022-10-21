<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['usuario_autoreg']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/autoregistroControlador.php";
		$ins_usuario = new autoregistroControlador();

		// 
		if(isset($_POST['usuario_autoreg'])){
			echo $ins_usuario->autoregistro_controlador();
			die();
		} else{
			session_start();//se cambio de SPM  a SIA
			session_unset();//Vaciamos la sesion
			session_destroy();//destruimos la sesion
			header("Location: ".SERVERURL."login/");//lo redirigimos al login para que ingrese con su usuario
			exit();
		}
		
	}