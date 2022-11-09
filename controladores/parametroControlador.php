<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/parametroModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/parametroModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}


class parametroControlador extends parametroModelo
{

	/*--------- Controlador agregar parametro ---------*/
	public function agregarParametro()
	{
		$nom_parametro=mainModel::limpiar_cadena(strtoupper($_POST['nombre_parametro_nuevo']));
		$valor=mainModel::limpiar_cadena($_POST['valor_parametro_nuevo']);
		$creado=$_SESSION['usuario_login'];
		$fec_creacion=date('y-m-d H:i:s');

			$datos_parametro_reg=[
				"nombre"=>$nom_parametro,
				"valor"=>$valor,
				"id_usuario" => $_SESSION['id_login'],
				"creado"=>$creado,
				"fecha_crea"=>$fec_creacion
			];

			$agregar_parametro=parametroModelo::agregar_parametro_modelo($datos_parametro_reg);

			if($agregar_parametro->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Parametro Registrado",
					"Texto"=>"Los datos del parametro han sido registrados con exito",
					"Tipo"=>"success"
				];

				
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar el parametro",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Creación de Rol",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." creó un nuevo parametro en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */


	/*--------- Controlador actualizar usuario ---------*/
	public function actualizarParametro()
	{	
		$nom_parametro=mainModel::limpiar_cadena(strtoupper($_POST['nombre_parametro_act']));
		$valor=mainModel::limpiar_cadena($_POST['valor_parametro_act']);
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
			$datos_parametro_act=[
				"nombre"=>$nom_parametro,
				"valor"=>$valor,
				"id_usuario" => $_SESSION['id_login'],
				"modif"=>$modificado,
				"fecha_modif"=>$fec_modificacion
			];

			$actualizar_parametro=parametroModelo::actualizar_parametro_modelo($datos_parametro_act,$id_actualizar);

			if($actualizar_parametro->rowCount()==1)
			{
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Parametro Actualizado",
					"Texto"=>"Parametro actualizado exitosamente",
					"Tipo"=>"success"
				];
			}else
			{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido actualizar el parametro",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Modificación de rol",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." actualizó un parametro del sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */
	

	
		//funcion para eliminar un parametro
		public function eliminarParametro()
		{
			$id=mainModel::limpiar_cadena(($_POST['id_parametro_del']));

		//verifica que el parametro si exista en el sistema
		$check_parametro=mainModel::ejecutar_consulta_simple("SELECT id_parametro FROM TBL_ms_parametros
		WHERE id_parametro='$id'");
		if($check_parametro->rowCount()<=0){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ha ocurrido un error",
				"Texto"=>"El parametro seleccionado no existe",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		
		$eliminarparametro=parametroModelo::eliminar_parametro_modelo($id);
			if($eliminarparametro->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Parametro Borrado",
					"Texto"=>"El parametro fue borrado del sistema",
					"Tipo"=>"success"
				];
                echo json_encode($alerta);

                $datos_bitacora = [
                    "id_objeto" => 0,
                    "fecha" => date('Y-m-d H:i:s'),
                    "id_usuario" => $_SESSION['id_login'],
                    "accion" => "Parametro eliminado",
                    "descripcion" => "El usuario ".$_SESSION['usuario_login']." eliminó un parametro del sistema"
                ];
                Bitacora::guardar_bitacora($datos_bitacora);
                exit();
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ha ocurrido un error",
					"Texto"=>"El Parametro no pudo ser borrado",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);
			exit();	
	}
}