<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['usuario_dni_reg'])){

		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/usuarioControlador.php";
		$ins_usuario = new usuarioControlador();


		/*--------- Agregar un usuario ---------*/
		if(isset($_POST['usuario_dni_reg']) && isset($_POST['usuario_nombre_reg'])){
			echo $ins_usuario->agregar_usuario_controlador();
		}

		
	}else{
		session_start(['name'=>'SPM']);
		session_unset();
		session_destroy();
		header("Location: ".SERVERURL."login/");
		exit();
	}