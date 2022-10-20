<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['usuario_reg']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/usuarioControlador.php";
		$ins_usuario = new usuarioControlador();


		/*--------- Agregar un usuario ---------*/
		if(isset($_POST['usuario_reg'])){
			echo $ins_usuario->agregar_usuario_controlador();
			die();
		} else{
			session_start();//se cambio de SPM  a SIA
			session_unset();//Vaciamos la sesion
			session_destroy();//destruimos la sesion
			header("Location: ".SERVERURL."login/");//lo redirigimos al login para que ingrese con su usuario
			exit();
		}
	}


/* /*---------/-/-/-/-/-/-/-/-/-/-/-/- Actualizar un usuario /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/---------*/


	if(isset($_POST['usuario_actu']))
	{ 
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/usuarioControlador.php";
		$ins_usuario = new usuarioControlador();

		/*--------- Agregar un usuario ---------*/
		 if(isset($_POST['usuario_actu']) )
		{
			echo $ins_usuario->actualizar_usuario_controlador();
			die();
		}		
	}else
	{ 
		session_start();//se cambio de SPM  a SIA
		session_unset();//Vaciamos la sesion
		session_destroy();//destruimos la sesion
		header("Location: ".SERVERURL."login/");//lo redirigimos al login para que ingrese con su usuario
		exit();
	} 