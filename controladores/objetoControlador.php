<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/objetoModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/objetoModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}


class objetoControlador extends objetoModelo
{

	public function agregarObjeto(){
		$nom_objeto=mainModel::limpiar_cadena(strtoupper($_POST['objeto_nuevo']));
		$descripcion=mainModel::limpiar_cadena($_POST['desc_objeto_nuevo']);
		$tipo=mainModel::limpiar_cadena($_POST['tipo_objeto_nuevo']);
		$creado=$_SESSION['usuario_login'];
		$fec_creacion=date('y-m-d H:i:s');

		//verificar datos ingresados
		if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ ]{1,40}",$nom_objeto)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"El nombre del objeto no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		$check_objeto=mainModel::ejecutar_consulta_simple("SELECT objeto FROM TBL_objetos WHERE objeto='$nom_objeto'");
			if($check_objeto->rowCount()>0){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El objeto ingresado ya se encuentra registrado en el sistema",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			$datos_objeto_reg=[
				"nombre"=>$nom_objeto,
				"desc"=>$descripcion,
				"tipo"=>$tipo,
				"creado"=>$creado,
				"fecha_crea"=>$fec_creacion
			];

			$agregar_objeto=objetoModelo::agregar_objeto_modelo($datos_objeto_reg);

			if($agregar_objeto->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Objeto Registrado",
					"Texto"=>"Los datos del objeto han sido registrados con exito",
					"Tipo"=>"success"
				];

				
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar el objeto",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Creación de Objeto",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." creó un nuevo objeto en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	}


	public function actualizarObjeto(){	
		$nom_objeto=mainModel::limpiar_cadena(strtoupper($_POST['objeto_act']));
		$descripcion=mainModel::limpiar_cadena($_POST['desc_objeto_act']);
		$tipo=mainModel::limpiar_cadena($_POST['tipo_objeto_act']);
		$modificado=$_SESSION['usuario_login'];
		$fec_modificacion=date('y-m-d H:i:s');
		$id_actualizar=mainModel::limpiar_cadena($_POST['id_actualizacion']);
		
		//verificar datos ingresados
		if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ ]{1,40}",$nom_objeto)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"El nombre del objeto no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		$check_objeto=mainModel::ejecutar_consulta_simple("SELECT objeto FROM TBL_objetos WHERE objeto='$nom_objeto'");
			if($check_objeto->rowCount()>0){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El objeto ingresado ya se encuentra registrado en el sistema",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}
			
			$datos_objeto_act=[
				"nombre"=>$nom_objeto,
				"desc"=>$descripcion,
				"tipo"=>$tipo,
				"modif"=>$modificado,
				"fecha_modif"=>$fec_modificacion
			];

			$actualizar_objeto=objetoModelo::actualizar_objeto_modelo($datos_objeto_act,$id_actualizar);

			if($actualizar_objeto->rowCount()==1)
			{
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Objeto Actualizado",
					"Texto"=>"Objeto actualizado exitosamente",
					"Tipo"=>"success"
				];
			}else
			{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido actualizar el objeto",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Modificación de objeto",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." actualizó un objeto del sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	}

	

		//funcion para eliminar un proveedor
		public function eliminarObjeto()
		{
			$id=mainModel::limpiar_cadena(($_POST['id_objeto_del']));
			$array=array();
			$valor='';

		//verifica que el insumo si exista en el sistema
		$check_objeto=mainModel::ejecutar_consulta_simple("SELECT id_objeto FROM TBL_objetos
		WHERE id_objeto='$id'");
		if($check_objeto->rowCount()<=0){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ha ocurrido un error",
				"Texto"=>"El objeto seleccionado no existe",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		
		$eliminarobjeto=objetoModelo::eliminar_objeto_modelo($id);
			if($eliminarobjeto->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Objeto Borrado",
					"Texto"=>"El objeto fue borrado del sistema",
					"Tipo"=>"success"
				];
                echo json_encode($alerta);

                $datos_bitacora = [
                    "id_objeto" => 0,
                    "fecha" => date('Y-m-d H:i:s'),
                    "id_usuario" => $_SESSION['id_login'],
                    "accion" => "Objeto eliminado",
                    "descripcion" => "El usuario ".$_SESSION['usuario_login']." eliminó un objeto del sistema"
                ];
                Bitacora::guardar_bitacora($datos_bitacora);
                exit();
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ha ocurrido un error",
					"Texto"=>"El objeto no pudo ser borrado",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);
			exit();	
	}
}