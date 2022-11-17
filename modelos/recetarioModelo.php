<?php
	
	require_once "mainModel.php";

	class recetarioModelo extends mainModel{

		/*--------- Modelo agregar recetario------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_recetario_modelo($datos)
		{
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_recetario(id_producto,id_insumo,
			cant_insumo)
			VALUES(?,?,?)");

			$sql->bindParam(1,$datos['id_producto']);
			$sql->bindParam(2,$datos['id_insumo']);
			$sql->bindParam(3,$datos['cant_insumo']);
			$sql->execute();
			return $sql;								
		}


		/*--------- Modelo actualizar recetario ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function actualizar_recetario_modelo($datos,$id)
		{
			$sql=mainModel::conectar()->prepare("UPDATE TBL_recetario SET id_producto=?, id_insumo=?, cant_insumo=?
			WHERE id_recetario=?");
			$sql->bindParam(1,$datos['id_producto']);
			$sql->bindParam(2,$datos['id_insumo']);
			$sql->bindParam(3,$datos['cant_insumo']);
			$sql->bindParam(4,$id);
			$sql->execute();
			return $sql;
		}

		/*--------- Modelo eliminar recetario ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		 protected static function eliminar_recetario_modelo($id){
				$sql=mainModel::conectar()->prepare("DELETE FROM TBL_recetario where id_recetario=?");
				$sql->bindParam(1,$id);
				$sql->execute();
				return $sql;
		}
	}