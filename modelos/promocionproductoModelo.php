<?php
	
	require_once "mainModel.php";

	class promocionproductoModelo extends mainModel{

		/*--------- Modelo agregar promocionproducto------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_promocionproducto_modelo($datos)
		{
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_promociones_productos(id_promociones,id_producto,
			cantidad)
			VALUES(?,?,?)");

			$sql->bindParam(1,$datos['id_promociones']);
			$sql->bindParam(2,$datos['id_producto']);
			$sql->bindParam(3,$datos['cantidad']);
			$sql->execute();
			return $sql;								
		}


		/*--------- Modelo actualizar promocionproducto------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function actualizar_promocionproducto_modelo($datos,$id)
		{
			$sql=mainModel::conectar()->prepare("UPDATE TBL_promociones_productos SET id_promociones=?, id_producto=?, cantidad=?
			WHERE id_promociones_productos=?");
			$sql->bindParam(1,$datos['id_promociones']);
			$sql->bindParam(2,$datos['id_producto']);
			$sql->bindParam(3,$datos['cantidad']);
			$sql->bindParam(4,$id);
			$sql->execute();
			return $sql;
		}

		/*--------- Modelo eliminar promocionproducto ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		 protected static function eliminar_promocionproducto_modelo($id){
				$sql=mainModel::conectar()->prepare("DELETE FROM TBL_promociones_productos where id_promociones_productos=?");
				$sql->bindParam(1,$id);
				$sql->execute();
				return $sql;
		}
	}