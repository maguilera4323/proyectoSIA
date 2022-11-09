<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/preguntasModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/preguntasModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}


class preguntasControlador extends preguntasModelo
{

	/*--------- Controlador agregar pregunta ---------*/
	public function agregarPregunta()
	{
		$nom_pregunta=mainModel::limpiar_cadena(strtoupper($_POST['nombre_pregunta_nuevo']));
		$creado=$_SESSION['usuario_login'];
		$fec_creacion=date('y-m-d H:i:s');

			$datos_pregunta_reg=[
				"nombre"=>$nom_pregunta,
				"creado"=>$creado,
				"fecha_crea"=>$fec_creacion
			];

			$agregar_pregunta=preguntasModelo::agregar_pregunta_modelo($datos_pregunta_reg);

			if($agregar_pregunta->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Pregunta Registrada",
					"Texto"=>"Los datos de la pregunta han sido registrados con exito",
					"Tipo"=>"success"
				];

				
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar la pregunta",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Creación de Pregunta",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." creó una nueva pregunta en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */


	/*--------- Controlador actualizar pregunta ---------*/
	public function actualizarPregunta()
	{	
		$nom_pregunta=mainModel::limpiar_cadena(strtoupper($_POST['nombre_pregunta_act']));
		$modificado=$_SESSION['usuario_login'];
		$fec_modificacion=date('y-m-d H:i:s');
		$id_actualizar=mainModel::limpiar_cadena($_POST['id_actualizacion']);
		
		/* if($Nombre=="" || $Rtn=="" || $Telefono=="" || $Correo=="" || $Direccion==""){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"No se han llenado todos los campos que son obligatorios",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		} */


			/* 
			if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ ]{1,30}",$Nombre)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El NOMBRE no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[0-9]{1,14}",$Rtn)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El RTN no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}
			
			if(mainModel::verificar_datos("[0-9]{1,20}",$Telefono)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El TELEFONO no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[a-z@_0-9.]{1,30}",$Correo)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El CORREO no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[A-Za-zÑñ0-9 .,]{1,100}",$Direccion)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"La DIRECCION no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			} */
			$datos_pregunta_act=[
				"nombre"=>$nom_pregunta,
				"modif"=>$modificado,
				"fecha_modif"=>$fec_modificacion
			];

			$actualizar_pregunta=preguntasModelo::actualizar_pregunta_modelo($datos_pregunta_act,$id_actualizar);

			if($actualizar_pregunta->rowCount()==1)
			{
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Pregunta Actualizada",
					"Texto"=>"Pregunta actualizada exitosamente",
					"Tipo"=>"success"
				];
			}else
			{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido actualizar la pregunta",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Modificación de Pregunta",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." actualizó una pregunta del sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */
	

	
		//funcion para eliminar una pregunta

		public function eliminarPregunta()
		{
			$id=mainModel::limpiar_cadena(($_POST['id_pregunta_del']));

		//verifica que la pregunta si exista en el sistema
		$check_pregunta=mainModel::ejecutar_consulta_simple("SELECT id_pregunta FROM TBL_preguntas
		WHERE id_pregunta='$id'");
		if($check_pregunta->rowCount()<=0){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ha ocurrido un error",
				"Texto"=>"La pregunta seleccionada no existe",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		
		$eliminarpregunta=preguntasModelo::eliminar_pregunta_modelo($id);
			if($eliminarpregunta->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Pregunta Borrada",
					"Texto"=>"La pregunta fue borrada del sistema",
					"Tipo"=>"success"
				];
                echo json_encode($alerta);

                $datos_bitacora = [
                    "id_objeto" => 0,
                    "fecha" => date('Y-m-d H:i:s'),
                    "id_usuario" => $_SESSION['id_login'],
                    "accion" => "Pregunta eliminada",
                    "descripcion" => "El usuario ".$_SESSION['usuario_login']." eliminó una pregunta del sistema"
                ];
                Bitacora::guardar_bitacora($datos_bitacora);
                exit();
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ha ocurrido un error",
					"Texto"=>"La pregunta no pudo ser borrada",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);
			exit();	
	}
}