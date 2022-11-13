<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/productoModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/productoModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}


class productoControlador extends productoModelo
{

	/*--------- Controlador agregar producto ---------*/
	public function agregar_producto_controlador()
	{
		$Nom_producto=mainModel::limpiar_cadena(strtoupper($_POST['nombre_producto_nuevo']));
		$Id_Tipo_producto=mainModel::limpiar_cadena(strtoupper($_POST['id_tipo_producto_nuevo']));
		$Descripcion=mainModel::limpiar_cadena($_POST['descripcion_producto_nuevo']);
		$Precio=mainModel::limpiar_cadena($_POST['precio_producto_nuevo']);
 
		$archivo=($_FILES['imagen']);//ADQUIERE LA IMAGEN
		$extencion=pathinfo($archivo['name'],PATHINFO_EXTENSION);//CAPTURA LA EXTENCION DEL ARCHIVO
		$Foto=$Nom_producto.".".$extencion;  //este sera el nombre de la imagen y esta es la variable que se usa para cargar en la BD
		move_uploaded_file($archivo["tmp_name"], "./productos_img/$Foto");
		
					
			/*== AGREGAR PRODUCTO ==*/
			$datos_producto_reg=[
				"nombre"=>$Nom_producto,
				"id_tipo_producto"=>$Id_Tipo_producto,
				"descripcion"=>$Descripcion,
				"precio"=>$Precio,
				"foto"=>$Foto
			];

			$agregar_producto=productoModelo::agregar_producto_modelo($datos_producto_reg);

			if($agregar_producto->rowCount()==1){
				$alerta=[
					"Alerta"=>"limpiar",
					"Titulo"=>"Producto registrado",
					"Texto"=>"Los datos del producto han sido registrados con exito",
					"Tipo"=>"success"
				];

				
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido registrar el Producto",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d h:i:s'),
				"id_producto" => $_SESSION['id_login'],
				"accion" => "Agregar Producto",
				"descripcion" => "Se agrego un nuevo producto en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */


	/*--------- Controlador actualizar producto ---------*/
	public function actualizar_producto_controlador()
	{	
		$id_actualizar=mainModel::limpiar_cadena($_POST['id_actualizacion']);
		$Nom_producto=mainModel::limpiar_cadena($_POST['nombre_producto_actu']);
		$Id_Tipo_producto=mainModel::limpiar_cadena($_POST['id_tipo_producto_actu']);
		$Descripcion=mainModel::limpiar_cadena($_POST['descripcion_producto_actu']);
		$Precio=mainModel::limpiar_cadena($_POST['precio_producto_actu']);
		$Foto=mainModel::limpiar_cadena($_POST['foto_producto_actu']);
		
		if($Nom_producto=="" || $Id_Tipo_producto=="" || $Descripcion=="" || $Precio=="" || $Foto==""){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"No se han llenado todos los campos que son obligatorios",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}


			/*== Verificando integridad de los datos ==*/
			if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ ]{1,30}",$Nom_producto)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El NOMBRE no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			/*if(mainModel::verificar_datos("[0-9]{1,14}",$Id_Tipo_producto)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El ID del tipo de producto no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}*/
			
			if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ ]{1,30}",$Descripcion)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"La Descripcion no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[0-9]{1,8}",$Precio)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El Precio no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}


			/*== ACTUALIZAR PRODUCTO ==*/
		$datos_producto_actu=
			[
				"nombre"=>$Nom_producto,
				"id_tipo_producto"=>$Id_Tipo_producto,
				"descripcion"=>$Descripcion,
				"precio"=>$Precio,
				"foto"=>$Foto			
			];

			$actualizar_producto=productoModelo::actualizar_producto_modelo($datos_producto_actu,$id_actualizar);

			if($actualizar_producto->rowCount()==1)
			{
				$alerta=[
					"Alerta"=>"limpiar",
					"Titulo"=>"Producto Actualizado",
					"Texto"=>"Producto actualizado exitosamente",
					"Tipo"=>"success"
				];
			}else
			{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"No hemos podido actualizar el producto",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d h:i:s'),
				"id_Producto" => $_SESSION['id_login'],
				"accion" => "Modificación de producto",
				"descripcion" => "Se actualizó un producto en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
	} /* Fin controlador */
	

	public function datosproductoControlador($tipo,$id){
		$tipo=mainModel::limpiar_cadena($tipo);
		$id=mainModel::limpiar_cadena($id);

		return productoModelo::datos_producto_modelo($tipo,$id);
	}

	

		//funcion para eliminar un producto
		public function eliminarProducto()
		{
			$id=mainModel::limpiar_cadena(($_POST['id_producto_del']));
			$Producto=mainModel::limpiar_cadena(($_POST['producto_del']));
			$array=array();
			$valor='';

		

		//verifica que el usuario si exista en el sistema
		$check_producto=mainModel::ejecutar_consulta_simple("SELECT id_producto FROM TBL_producto
		WHERE id_Producto='$id'");
		if($check_producto->rowCount()<=0){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ha ocurrido un error",
				"Texto"=>"El Producto seleccionado no existe",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

		
		$eliminarproducto=productoModelo::eliminar_producto_modelo("borrar",$id);
			if($eliminarproducto->rowCount()==1){
				$alerta=[
					"Alerta"=>"recargar",
					"Titulo"=>"Producto Borrado",
					"Texto"=>"El Producto fue borrado",
					"Tipo"=>"success"
				];
			}else{
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ha ocurrido un error",
					"Texto"=>"El producto no pudo ser borrado",
					"Tipo"=>"error"
				];
			}
			echo json_encode($alerta);
		$datos_bitacora = [
			"id_objeto" => 0,
			"fecha" => date('Y-m-d H:i:s'),
			"id_usuario" => $_SESSION['id_login'],
			"accion" => "Producto Eliminado",
			"descripcion" => "El usuario ".$_SESSION['usuario_login']." Elimino un producto del sistema"
		];
		Bitacora::guardar_bitacora($datos_bitacora);
			exit();

			
	}
}