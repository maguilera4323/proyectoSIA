<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/rolModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/rolModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}


class rolControlador extends rolModelo
{

	public function agregarRol()
	{
		$nom_rol=mainModel::limpiar_cadena(strtoupper($_POST['nombre_rol_nuevo']));
		$descripcion=mainModel::limpiar_cadena($_POST['desc_rol_nuevo']);
		$creado=$_SESSION['usuario_login'];
		$fec_creacion=date('y-m-d H:i:s');

		//verificar datos ingresados
		if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ ]{1,50}",$nom_rol)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"El nombre del rol no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		$check_rol=mainModel::ejecutar_consulta_simple("SELECT rol FROM TBL_ms_roles WHERE rol='$nom_rol'");
			if($check_rol->rowCount()>0){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El rol ingresado ya se encuentra registrado en el sistema",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			$datos_rol_reg=[
				"nombre"=>$nom_rol,
				"desc"=>$descripcion,
				"creado"=>$creado,
				"fecha_crea"=>$fec_creacion
			];

			$agregar_rol=rolModelo::agregar_rol_modelo($datos_rol_reg);

			if($agregar_rol->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Rol Registrado",
					"Texto"=>"Los datos del rol han sido registrados con exito",
					"Tipo"=>"success"
				];

				
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar el rol",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Creación de Rol",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." creó un nuevo rol en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */


	public function actualizarRol()
	{	
		$nom_rol=mainModel::limpiar_cadena(strtoupper($_POST['nombre_rol_act']));
		$descripcion=mainModel::limpiar_cadena($_POST['desc_rol_act']);
		$modificado=$_SESSION['usuario_login'];
		$fec_modificacion=date('y-m-d H:i:s');
		$id_actualizar=mainModel::limpiar_cadena($_POST['id_actualizacion']);
		
		//verificar datos ingresados
		if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ ]{1,50}",$nom_rol)){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"El nombre del rol no coincide con el formato solicitado",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

			$datos_rol_act=[
				"nombre"=>$nom_rol,
				"desc"=>$descripcion,
				"modif"=>$modificado,
				"fecha_modif"=>$fec_modificacion
			];

			$actualizar_rol=rolModelo::actualizar_rol_modelo($datos_rol_act,$id_actualizar);

			if($actualizar_rol->rowCount()==1)
			{
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Rol Actualizado",
					"Texto"=>"Rol actualizado exitosamente",
					"Tipo"=>"success"
				];
			}else
			{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido actualizar el rol",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Modificación de rol",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." actualizó un rol del sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */

	

		public function eliminarRol(){
		$id=mainModel::limpiar_cadena(($_POST['id_rol_del']));

		$check_rol=mainModel::ejecutar_consulta_simple("SELECT id_rol FROM TBL_ms_roles
		WHERE id_rol='$id'");
		if($check_rol->rowCount()<=0){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ha ocurrido un error",
				"Texto"=>"El rol seleccionado no existe",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		
		$eliminarrol=rolModelo::eliminar_rol_modelo($id);
			if($eliminarrol->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Rol Borrado",
					"Texto"=>"El rol fue borrado del sistema",
					"Tipo"=>"success"
				];
                echo json_encode($alerta);

                $datos_bitacora = [
                    "id_objeto" => 0,
                    "fecha" => date('Y-m-d H:i:s'),
                    "id_usuario" => $_SESSION['id_login'],
                    "accion" => "Rol eliminado",
                    "descripcion" => "El usuario ".$_SESSION['usuario_login']." eliminó un rol del sistema"
                ];
                Bitacora::guardar_bitacora($datos_bitacora);
                exit();
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ha ocurrido un error",
					"Texto"=>"El rol no pudo ser borrado",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);
			exit();	
	}
}