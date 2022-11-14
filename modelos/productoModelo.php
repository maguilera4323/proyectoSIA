<?php
	
	require_once "mainModel.php";

	class productoModelo extends mainModel{

		/*--------- Modelo agregar producto ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_producto_modelo($datos)
		{
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_producto(nom_producto,id_tipo_produ,
			des_produ,precio_produ,foto_produ)
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
			$sql=mainModel::conectar()->prepare("UPDATE TBL_producto SET nom_producto=?,id_tipo_produ=?,des_produ=?,
			precio_produ=?, foto_produ=? WHERE id_producto=?");

			$sql->bindParam(1,$dato['nombre']);
			$sql->bindParam(2,$dato['id_tipo_producto']);	
			$sql->bindParam(3,$dato['descripcion']);			
			$sql->bindParam(4,$dato['precio']);			
			$sql->bindParam(5,$dato['foto']);
			$sql->bindParam(6,$id);
			$sql->execute();
			return $sql;
		}


		protected static function datos_producto_modelo($tipo,$id){
			if($tipo=='unico'){
				$sql=mainModel::conectar()->prepare("SELECT * FROM TBL_producto where id_producto=?");
				$sql->bindParam(1,$id);
			}
			$sql->execute();
			return $sql;
		}


		 protected static function eliminar_producto_modelo($accion,$id){
			if ($accion=='borrar'){
				$sql=mainModel::conectar()->prepare("DELETE FROM TBL_producto where id_producto=?");
				$sql->bindParam(1,$id);
				$sql->execute();
				return $sql;
			}
			
		
		
		}
	}