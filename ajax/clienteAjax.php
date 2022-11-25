<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['nombre_cliente_nuevo']) || isset($_POST['nombre_cliente_actu']) || isset($_POST['id_cliente_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/clienteControlador.php";
		$ins_cliente = new clienteControlador();

		if(isset($_POST['nombre_cliente_nuevo'])){
			echo $ins_cliente->agregar_cliente_controlador();
			die();
		}
		
		if(isset($_POST['nombre_cliente_actu']) ){
			echo $ins_cliente->actualizar_cliente_controlador();
			die();
		}
		
		if(isset($_POST['id_cliente_del']) ){
			echo $ins_cliente->eliminarCliente();
			die();
		}
	}

	