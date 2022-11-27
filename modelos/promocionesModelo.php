<?php
	
	require_once "mainModel.php";

	class promocionesModelo extends mainModel{

		/*--------- Modelo agregar promocion ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_promociones_modelo($datos)
		{
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_promociones(nom_promocion,fech_ini_promo,
			fech_fin_promo,id_estado_promocio,precio_promocion)
			VALUES(?,?,?,?,?)");

			$sql->bindParam(1,$datos['nombre']);
			$sql->bindParam(2,$datos['fecha_inicial']);
			$sql->bindParam(3,$datos['fecha_final']);
			$sql->bindParam(4,$datos['id_estado']);
			$sql->bindParam(5,$datos['precio']);
			$sql->execute();
			return $sql;

											
		}

		/*--------- Modelo actualizar promocion ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function actualizar_promociones_modelo($dato,$id)
		{
			$sql=mainModel::conectar()->prepare("UPDATE TBL_promociones SET nom_promocion=?,fech_ini_promo=?,fech_fin_promo=?,
			id_estado_promocio=?, precio_promocion=? WHERE id_Promociones=?");

			$sql->bindParam(1,$dato['nombre']);
			$sql->bindParam(2,$dato['fecha_inicial']);	
			$sql->bindParam(3,$dato['fecha_final']);			
			$sql->bindParam(4,$dato['id_estado']);			
			$sql->bindParam(5,$dato['precio']);
			$sql->bindParam(6,$id);
			$sql->execute();
			return $sql;
		}

		 protected static function eliminar_promociones_modelo($accion,$id){
			if ($accion=='borrar'){
				$sql=mainModel::conectar()->prepare("DELETE FROM TBL_promociones where id_promociones=?");
				$sql->bindParam(1,$id);
				$sql->execute();
				return $sql;
			}
		}

		
	}