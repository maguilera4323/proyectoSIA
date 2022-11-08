<?php
	
	require_once "mainModel.php";

	class productoModelo extends mainModel{

		/*--------- Modelo agregar producto ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_producto_modelo($datos)
		{
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_Proveedores(nom_producto,rtn_proveedor,
			tel_proveedor,correo_proveedor,dir_proveedor)
			VALUES(?,?,?,?,?)");

			$sql->bindParam(1,$datos['nombre']);
			$sql->bindParam(2,$datos['id_tipo_producto']);
			$sql->bindParam(3,$datos['descripcion']);
			$sql->bindParam(4,$datos['precio']);
			$sql->bindParam(5,$datos['foto']);
			$sql->execute();
			return $sql;

											
		}



		/*--------- Modelo actualizar producto ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function actualizar_producto_modelo($dato,$id)
		{
			$sql=mainModel::conectar()->prepare("UPDATE TBL_Proveedores SET nom_producto=?,rtn_proveedor=?,tel_proveedor=?,
			correo_proveedor=?, dir_proveedor=? WHERE id_Proveedores=?");

			$sql->bindParam(1,$dato['nombre']);
			$sql->bindParam(2,$dato['id_tipo_producto']);	
			$sql->bindParam(3,$dato['descripcion']);			
			$sql->bindParam(4,$dato['precio']);			
			$sql->bindParam(5,$dato['foto']);
			$sql->bindParam(6,$id);
			$sql->execute();
			return $sql;

				/* VERIFICAR SU GUARDA DEL DATO EN BITACORA */
				$datos_bitacora = 
				[
					"id_objeto" => 0,
					"fecha" => date('Y-m-d h:i:s'),
					"id_Producto" => null,
					"accion" => "Actualizacion de producto",
					"descripcion" => "Registro de producto"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			
		}

		protected static function datos_producto_modelo($tipo,$id){
			if($tipo=='unico'){
				$sql=mainModel::conectar()->prepare("SELECT * FROM TBL_Proveedores where id_Producto=?");
				$sql->bindParam(1,$id);
			}
			$sql->execute();
			return $sql;
		}

		 protected static function eliminar_producto_modelo($accion,$id){
			
			if ($accion=='borrar'){
				$sql=mainModel::conectar()->prepare("DELETE FROM TBL_Proveedores where id_Producto=?");
				$sql->bindParam(1,$id);
				$sql->execute();
				return $sql;
			}
			
		
		
		}
	}