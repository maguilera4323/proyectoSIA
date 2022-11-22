<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['nombre_proveedor_nuevo']) || isset($_POST['nombre_proveedor_actu']) || isset($_POST['id_proveedor_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/proveedorControlador.php";
		$ins_proveedor = new proveedorControlador();


		/*--------- Agregar un proveedor ---------*/
		if(isset($_POST['nombre_proveedor_nuevo'])){
			echo $ins_proveedor->agregar_proveedor_controlador();
			die();
		}
		
		if(isset($_POST['nombre_proveedor_actu']) ){
			echo $ins_proveedor->actualizar_proveedor_controlador();
			die();
		}
		
		if(isset($_POST['id_proveedor_del']) ){
			echo $ins_proveedor->eliminarProveedor();
			die();
		}else{
			session_start();//se cambio de SPM  a SIA
			session_unset();//Vaciamos la sesion
			session_destroy();//destruimos la sesion
			header("Location: ".SERVERURL."login/");//lo redirigimos al login para que ingrese con su usuario
			exit();
		}
	}

	