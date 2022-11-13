<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['tipo_producto_nuevo']) || isset($_POST['tipo_producto_actu']) || isset($_POST['id_tipo_producto_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/TipoproductoControlador.php";
		$ins_Tipoproducto = new TipoproductoControlador();


		/*--------- Agregar un tipo de producto ---------*/
		if(isset($_POST['tipo_producto_nuevo'])){
			echo $ins_pTiporoducto->agregar_Tipo_producto_controlador();
			die();
		}
		
		if(isset($_POST['tipo_producto_actu']) ){
			echo $ins_Tipoproducto->actualizar_Tipo_producto_controlador();
			die();
		}
		
		if(isset($_POST['id_tipo_producto_del']) ){
			echo $ins_Tipoproducto->eliminar_Tipo_Producto();
			die();
		}else{
			session_start();//se cambio de SPM  a SIA
			session_unset();//Vaciamos la sesion
			session_destroy();//destruimos la sesion
			header("Location: ".SERVERURL."login/");//lo redirigimos al login para que ingrese con su usuario
			exit();
		}
	}

	