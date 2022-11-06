<?php
	
	require_once "mainModel.php";

	class rolModelo extends mainModel{

		/*--------- Modelo agregar proveedor ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_rol_modelo($datos)
		{
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_ms_roles(rol,descripcion,
			creado_por,fecha_creacion)
			VALUES(?,?,?,?)");

			$sql->bindParam(1,$datos['nombre']);
			$sql->bindParam(2,$datos['desc']);
			$sql->bindParam(3,$datos['creado']);
			$sql->bindParam(4,$datos['fecha_crea']);
			$sql->execute();
			return $sql;								
		}


		/*--------- Modelo actualizar proveedor ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function actualizar_rol_modelo($datos,$id)
		{
			$sql=mainModel::conectar()->prepare("UPDATE TBL_ms_roles SET rol=?,descripcion=?,
			modificado_por=?, fecha_modificacion=? WHERE id_rol=?");
			$sql->bindParam(1,$datos['nombre']);
			$sql->bindParam(2,$datos['desc']);
			$sql->bindParam(3,$datos['modif']);
			$sql->bindParam(4,$datos['fecha_modif']);
			$sql->bindParam(5,$id);
			$sql->execute();
			return $sql;
		}

		protected static function datos_rol_modelo($id){
			$sql=mainModel::conectar()->prepare("SELECT * FROM TBL_ms_roles where id_rol=?");
			$sql->bindParam(1,$id);
			$sql->execute();
			return $sql;
		}

		 protected static function eliminar_rol_modelo($id){
				$sql=mainModel::conectar()->prepare("DELETE FROM TBL_ms_roles where id_rol=?");
				$sql->bindParam(1,$id);
				$sql->execute();
				return $sql;
		}
	}