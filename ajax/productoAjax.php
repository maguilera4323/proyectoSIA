<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['nombre_producto_nuevo']) || isset($_POST['nombre_producto_actu']) || isset($_POST['id_producto_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/productoControlador.php";
		$ins_producto = new productoControlador();


		/*--------- Agregar un producto ---------*/
		if(isset($_POST['nombre_producto_nuevo'])){
			echo $ins_producto->agregar_producto_controlador();
			die();
		}
		
		if(isset($_POST['nombre_producto_actu']) ){
			echo $ins_producto->actualizar_producto_controlador();
			die();
		}
		
		if(isset($_POST['id_producto_del']) ){
			echo $ins_producto->eliminarProducto();
			die();
		}else{
			session_start();//se cambio de SPM  a SIA
			session_unset();//Vaciamos la sesion
			session_destroy();//destruimos la sesion
			header("Location: ".SERVERURL."login/");//lo redirigimos al login para que ingrese con su usuario
			exit();
		}
	}

	