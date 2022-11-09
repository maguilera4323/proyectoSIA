<?php
	$peticionAjax=true;
	require_once "../config/APP.php";

	if(isset($_POST['nombre_pregunta_nuevo']) || isset($_POST['nombre_pregunta_act']) || isset($_POST['id_pregunta_del']))
	{
		/*--------- Instancia al controlador ---------*/
		require_once "../controladores/preguntasControlador.php";
		$ins_pregunta = new preguntasControlador();


		/*--------- Agregar una pregunta ---------*/
		if(isset($_POST['nombre_pregunta_nuevo'])){
			echo $ins_pregunta->agregarPregunta();
			die();
		}
		
		/*--------- Actualizar una pregunta ---------*/
		if(isset($_POST['nombre_pregunta_act']) ){
			echo $ins_pregunta->actualizarPregunta();
			die();
		}
		
		/*--------- Eliminar una pregunta ---------*/
		if(isset($_POST['id_pregunta_del']) ){
			echo $ins_pregunta->eliminarPregunta();
			die();
		}
	}