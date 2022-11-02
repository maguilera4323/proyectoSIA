<?php
	
	require_once "mainModel.php";

	class insumoModelo extends mainModel{

		/*--------- Modelo agregar proveedor ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_insumo_modelo($datos)
		{
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_insumos(nom_insumo,id_categoria,
			cant_max,cant_min,unidad_medida)
			VALUES(?,?,?,?,?)");

			$sql->bindParam(1,$datos['nombre']);
			$sql->bindParam(2,$datos['cat']);
			$sql->bindParam(3,$datos['cantmax']);
			$sql->bindParam(4,$datos['cantmin']);
			$sql->bindParam(5,$datos['unidad']);
			$sql->execute();
			return $sql;

											
		}



		/*--------- Modelo actualizar proveedor ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function actualizar_insumo_modelo($datos,$id)
		{
			$sql=mainModel::conectar()->prepare("UPDATE TBL_insumos SET nom_insumo=?,id_categoria=?,cant_max=?,
			cant_min=?, unidad_medida=? WHERE id_insumos=?");
			$sql->bindParam(1,$datos['nombre']);
			$sql->bindParam(2,$datos['cat']);
			$sql->bindParam(3,$datos['cantmax']);
			$sql->bindParam(4,$datos['cantmin']);
			$sql->bindParam(5,$datos['unidad']);
			$sql->bindParam(6,$id);
			$sql->execute();
			return $sql;
		}

		protected static function datos_insumo_modelo($tipo,$id){
			if($tipo=='unico'){
				$sql=mainModel::conectar()->prepare("SELECT * FROM TBL_insumos where id_insumos=?");
				$sql->bindParam(1,$id);
			}
			$sql->execute();
			return $sql;
		}

		 protected static function eliminar_insumo_modelo($id){
				$sql=mainModel::conectar()->prepare("DELETE FROM TBL_insumos where id_insumos=?");
				$sql->bindParam(1,$id);
				$sql->execute();
				return $sql;
		}
	}