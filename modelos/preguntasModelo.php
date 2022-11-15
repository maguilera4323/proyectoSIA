<?php
	
	require_once "mainModel.php";

	class preguntasModelo extends mainModel{

		protected static function agregar_pregunta_modelo($datos){
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_preguntas(pregunta,creado_por,fecha_creacion)
			VALUES(?,?,?)");
			$sql->bindParam(1,$datos['nombre']);
			$sql->bindParam(2,$datos['creado']);
			$sql->bindParam(3,$datos['fecha_crea']);
			$sql->execute();
			return $sql;								
		}

		protected static function actualizar_pregunta_modelo($datos,$id){
			$sql=mainModel::conectar()->prepare("UPDATE TBL_preguntas SET pregunta=?,
			modificado_por=?, fecha_modificacion=? WHERE id_pregunta=?");
			$sql->bindParam(1,$datos['nombre']);
			$sql->bindParam(2,$datos['modif']);
			$sql->bindParam(3,$datos['fecha_modif']);
			$sql->bindParam(4,$id);
			$sql->execute();
			return $sql;
		}

		 protected static function eliminar_pregunta_modelo($id){
				$sql=mainModel::conectar()->prepare("DELETE FROM TBL_preguntas where id_pregunta=?");
				$sql->bindParam(1,$id);
				$sql->execute();
				return $sql;
		}
	}