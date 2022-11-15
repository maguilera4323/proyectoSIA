<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if()
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/productoControlador.php";
		$ins_producto = new productoControlador();
        
	}else{
        session_start();//se cambio de SPM  a SIA
        session_unset();//Vaciamos la sesion
        session_destroy();//destruimos la sesion
        header("Location: ".SERVERURL."login/");//lo redirigimos al login para que ingrese con su usuario
        exit();
    }

	