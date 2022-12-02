<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['promocionproducto_nuevo']) || isset($_POST['promocionproducto_act']) || isset($_POST['promocionproducto_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/promocionproductoControlador.php";
		$ins_promocionproducto = new promocionproductoControlador();


		/*--------- Agregar un promocionproducto  ---------*/
		if(isset($_POST['promocionproducto_nuevo'])){
			echo $ins_promocionproducto->agregarPromocionproducto();
			die();
		}
		
		/*--------- Actualizar un promocionproducto  ---------*/
		if(isset($_POST['promocionproducto_act']) ){
			echo $ins_promocionproducto->actualizarPromocionproducto();
			die();
		}
		
		/*--------- Eliminar un promocionproducto ---------*/
		if(isset($_POST['promocionproducto_del']) ){
			echo $ins_promocionproducto->eliminarPromocionproducto();
			die();
		}
	}