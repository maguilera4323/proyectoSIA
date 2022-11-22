<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['nombre_cliente_nuevo']) || isset($_POST['nombre_cliente_actu']) || isset($_POST['id_cliente_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/clienteControlador.php";
		$ins_cliente = new clienteControlador();


		/*--------- Agregar un proveedor ---------*/
		if(isset($_POST['nombre_cliente_nuevo'])){
			echo $ins_cliente->agregar_cliente_controlador();
			die();
		}
		
		if(isset($_POST['nombre_cliente_actu']) ){
			echo $ins_proveedor->actualizar_cliente_controlador();
			die();
		}
		
		if(isset($_POST['id_cliente_del']) ){
			echo $ins_proveedor->eliminarCliente();
			die();
		}else{
			session_start();//se cambio de SPM  a SIA
			session_unset();//Vaciamos la sesion
			session_destroy();//destruimos la sesion
			header("Location: ".SERVERURL."login/");//lo redirigimos al login para que ingrese con su usuario
			exit();
		}
	}

	