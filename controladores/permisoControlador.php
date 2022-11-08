<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/permisoModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/permisoModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}


class permisoControlador extends permisoModelo
{

	/*--------- Controlador agregar proveedor ---------*/
	public function agregarPermiso()
	{
		$nom_rol=mainModel::limpiar_cadena(strtoupper($_POST['rol_nuevo']));
		$nom_objeto=mainModel::limpiar_cadena(strtoupper($_POST['objeto_nuevo']));
		if(!isset($_POST['insertar_permiso'])){
			$insertar_permiso=0;
		}else{
			$insertar_permiso=mainModel::limpiar_cadena($_POST['insertar_permiso']);
		}
		if(!isset($_POST['actualizar_permiso'])){
			$actualizar_permiso=0;
		}else{
			$actualizar_permiso=mainModel::limpiar_cadena($_POST['actualizar_permiso']);
		}
		if(!isset($_POST['eliminar_permiso'])){
			$eliminar_permiso=0;
		}else{
			$eliminar_permiso=mainModel::limpiar_cadena($_POST['eliminar_permiso']);
		}
		if(!isset($_POST['consultar_permiso'])){
			$consultar_permiso=0;
		}else{
			$consultar_permiso=mainModel::limpiar_cadena($_POST['consultar_permiso']);
		}
		$creado=$_SESSION['usuario_login'];
		$fec_creacion=date('y-m-d H:i:s');

			$datos_permiso_reg=[
				"nombrerol"=>$nom_rol,
				"nombreobjeto"=>$nom_objeto,
				"ins"=>$insertar_permiso,
				"act"=>$actualizar_permiso,
				"eli"=>$eliminar_permiso,
				"cons"=>$consultar_permiso,
				"creado"=>$creado,
				"fecha_crea"=>$fec_creacion
			];

			$agregar_permiso=permisoModelo::agregar_permiso_modelo($datos_permiso_reg);

			if($agregar_permiso->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"permiso Registrado",
					"Texto"=>"Los datos del permiso han sido registrados con exito",
					"Tipo"=>"success"
				];

				
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar el permiso",
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
	} /* Fin controlador */


	/*--------- Controlador actualizar usuario ---------*/
	public function actualizarObjeto()
	{	
		$nom_objeto=mainModel::limpiar_cadena(strtoupper($_POST['objeto_act']));
		$descripcion=mainModel::limpiar_cadena($_POST['desc_objeto_act']);
		$tipo=mainModel::limpiar_cadena($_POST['tipo_objeto_act']);
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
	} /* Fin controlador */
	

	public function datosObjetoControlador($id){
		$id=mainModel::limpiar_cadena($id);
		return objetoModelo::datos_objeto_modelo($id);
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