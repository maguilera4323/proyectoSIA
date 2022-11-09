<?php
	
	require_once "mainModel.php";

	class permisoModelo extends mainModel{

		/*--------- Modelo agregar proveedor ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_permiso_modelo($datos)
		{
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_permisos(id_rol,id_objeto,permiso_insercion,
			permiso_actualizacion,permiso_eliminacion,permiso_consulta,creado_por,fecha_creacion)
			VALUES(?,?,?,?,?,?,?,?)");

			$sql->bindParam(1,$datos['nombrerol']);
			$sql->bindParam(2,$datos['nombreobjeto']);
			$sql->bindParam(3,$datos['ins']);
			$sql->bindParam(4,$datos['act']);
			$sql->bindParam(5,$datos['eli']);
			$sql->bindParam(6,$datos['cons']);
			$sql->bindParam(7,$datos['creado']);
			$sql->bindParam(8,$datos['fecha_crea']);
			$sql->execute();
			return $sql;							
		}


		/*--------- Modelo actualizar proveedor ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function actualizar_permiso_modelo($datos,$idrol,$idobjeto)
		{
			$sql=mainModel::conectar()->prepare("UPDATE TBL_permisos SET permiso_insercion=?,permiso_actualizacion=?,
			permiso_eliminacion=?,permiso_consulta=?, modificado_por=?, fecha_modificacion=? WHERE id_rol=? and id_objeto=?");
			$sql->bindParam(1,$datos['ins']);
			$sql->bindParam(2,$datos['act']);
			$sql->bindParam(3,$datos['eli']);
			$sql->bindParam(4,$datos['cons']);
			$sql->bindParam(5,$datos['modif']);
			$sql->bindParam(6,$datos['fecha_modif']);
			$sql->bindParam(7,$idrol);
			$sql->bindParam(8,$idobjeto);
			$sql->execute();
			return $sql;
		}

		protected static function datos_objeto_modelo($id){
			$sql=mainModel::conectar()->prepare("SELECT * FROM TBL_objetos where id_objeto=?");
			$sql->bindParam(1,$id);
			$sql->execute();
			return $sql;
		}

		 protected static function eliminar_permiso_modelo($idrol,$idobj){
				$sql=mainModel::conectar()->prepare("DELETE FROM TBL_permisos where id_rol=? and id_objeto=?");
				$sql->bindParam(1,$idrol);
				$sql->bindParam(2,$idobj);
				$sql->execute();
				return $sql;
		}
	}