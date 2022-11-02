<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['nombre_insumo_nuevo']) || isset($_POST['nombre_insumo_act']) || isset($_POST['id_insumo_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/insumoControlador.php";
		$ins_insumo = new insumoControlador();


		/*--------- Agregar un proveedor ---------*/
		if(isset($_POST['nombre_insumo_nuevo'])){
			echo $ins_insumo->agregarInsumo();
			die();
		}
		
		if(isset($_POST['nombre_insumo_act']) ){
			echo $ins_insumo->actualizarInsumo();
			die();
		}
		
		if(isset($_POST['id_insumo_del']) ){
			echo $ins_insumo->eliminarInsumo();
			die();
		}else{
			session_start();//se cambio de SPM  a SIA
			session_unset();//Vaciamos la sesion
			session_destroy();//destruimos la sesion
			header("Location: ".SERVERURL."login/");//lo redirigimos al login para que ingrese con su usuario
			exit();
		}
	}