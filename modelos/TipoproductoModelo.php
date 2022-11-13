<?php
	
	require_once "mainModel.php";

	class TipoproductoModelo extends mainModel{

		/*--------- Modelo agregar Tipo de producto ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_Tipo_producto_modelo($datos)
		{
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_tipo_producto(tipo_producto,tamaño_producto,
			clasificacion_producto)
			VALUES(?,?,?)");

			$sql->bindParam(1,$datos['tipo']);
			$sql->bindParam(2,$datos['tamaño']);
			$sql->bindParam(3,$datos['clasificacion']);
			$sql->execute();
			return $sql;

											
		}



		/*--------- Modelo actualizar Tipo producto ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function actualizar_Tipo_producto_modelo($dato,$id)
		{
			$sql=mainModel::conectar()->prepare("UPDATE TBL_tipo_producto SET tipo_producto=?,tamaño_producto=?,
			clasificacion_producto=? WHERE id_tipo_produ=?");

			$sql->bindParam(1,$dato['tipo']);
			$sql->bindParam(2,$dato['tamaño']);	
			$sql->bindParam(3,$dato['clasificacion']);			
			$sql->bindParam(4,$id);
			$sql->execute();
			return $sql;

				/* VERIFICAR SU GUARDA DEL DATO EN BITACORA */
				$datos_bitacora = 
				[
					"id_objeto" => 0,
					"fecha" => date('Y-m-d h:i:s'),
					"id_tipo_producto" => null,
					"accion" => "Actualizacion de Tipo de producto",
					"descripcion" => "Registro de Tipo de producto"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			
		}

		protected static function datos_Tipo_producto_modelo($tipo,$id){
			if($tipo=='unico'){
				$sql=mainModel::conectar()->prepare("SELECT * FROM TBL_tipo_producto where id_tipo_producto=?");
				$sql->bindParam(1,$id);
			}
			$sql->execute();
			return $sql;
		}

		 protected static function eliminar_Tipo_producto_modelo($accion,$id){
			
			if ($accion=='borrar'){
				$sql=mainModel::conectar()->prepare("DELETE FROM TBL_tipo_producto where id_tipo_producto=?");
				$sql->bindParam(1,$id);
				$sql->execute();
				return $sql;
			}
			
		
		
		}
	}