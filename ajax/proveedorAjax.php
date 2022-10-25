<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['nombre_proveedor_nuevo']) || isset($_POST['usuario_actu']) || isset($_POST['id_usuario_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/proveedorControlador.php";
		$ins_proveedor = new proveedorControlador();


		/*--------- Agregar un usuario ---------*/
		if(isset($_POST['nombre_proveedor_nuevo'])){
			echo $ins_proveedor->agregar_proveedor_controlador();
			die();
		}
		
		if(isset($_POST['usuario_actu']) ){
			echo $ins_usuario->actualizar_usuario_controlador();
			die();
		}
		
		if(isset($_POST['id_usuario_del']) ){
			echo $ins_usuario->eliminarUsuario();
			die();
		}else{
			session_start();//se cambio de SPM  a SIA
			session_unset();//Vaciamos la sesion
			session_destroy();//destruimos la sesion
			header("Location: ".SERVERURL."login/");//lo redirigimos al login para que ingrese con su usuario
			exit();
		}
	}

	