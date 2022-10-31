<?php
	
	require_once "mainModel.php";

	class proveedorModelo extends mainModel{

		/*--------- Modelo agregar proveedor ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_proveedor_modelo($datos)
		{
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_Proveedores(nom_proveedor,rtn_proveedor,
			tel_proveedor,correo_proveedor,dir_proveedor)
			VALUES(?,?,?,?,?)");

			$sql->bindParam(1,$datos['nombre']);
			$sql->bindParam(2,$datos['rtn']);
			$sql->bindParam(3,$datos['telefono']);
			$sql->bindParam(4,$datos['correo']);
			$sql->bindParam(5,$datos['direccion']);
			$sql->execute();
			return $sql;

											
		}



		/*--------- Modelo actualizar proveedor ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function actualizar_proveedor_modelo($dato,$id)
		{
			$sql=mainModel::conectar()->prepare("UPDATE TBL_Proveedores SET nom_proveedor=?,rtn_proveedor=?,tel_proveedor=?,
			correo_proveedor=?, dir_proveedor=? WHERE id_Proveedores=?");

			$sql->bindParam(1,$dato['nombre']);
			$sql->bindParam(2,$dato['rtn']);	
			$sql->bindParam(3,$dato['telefono']);			
			$sql->bindParam(4,$dato['correo']);			
			$sql->bindParam(5,$dato['direccion']);
			$sql->bindParam(6,$id);
			$sql->execute();
			return $sql;

				/* VERIFICAR SU GUARDA DEL DATO EN BITACORA */
				$datos_bitacora = 
				[
					"id_objeto" => 0,
					"fecha" => date('Y-m-d h:i:s'),
					"id_Proveedores" => null,
					"accion" => "Actualizacion de proveedor",
					"descripcion" => "Acceso de proveedor"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			
		}

		protected static function datos_proveedor_modelo($tipo,$id){
			if($tipo=='unico'){
				$sql=mainModel::conectar()->prepare("SELECT * FROM TBL_Proveedores where id_Proveedores=?");
				$sql->bindParam(1,$id);
			}
			$sql->execute();
			return $sql;
		}

		 protected static function eliminar_proveedor_modelo($accion,$id){
			
			if ($accion=='borrar'){
				$sql=mainModel::conectar()->prepare("DELETE FROM TBL_Proveedores where id_Proveedores=?");
				$sql->bindParam(1,$id);
				$sql->execute();
				return $sql;
			}
			
		
		
		}
	}