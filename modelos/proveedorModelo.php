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



		/*--------- Modelo actualizar usuario ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function actualizar_usuario_modelo($dato,$id)
		{
			$sql=mainModel::conectar()->prepare("UPDATE TBL_usuarios SET usuario=?,nombre_usuario=?,estado_usuario=?,
			id_rol=?, correo_electronico=?,modificado_por=?,fecha_modificacion=? 
			WHERE id_usuario=?");

			$sql->bindParam(1,$dato['usua']);
			$sql->bindParam(2,$dato['nombrea']);	
			$sql->bindParam(3,$dato['estadoa']);			
			$sql->bindParam(4,$dato['rola']);			
			$sql->bindParam(5,$dato['correoa']);
			$sql->bindParam(6,$dato['modificador']);
			$sql->bindParam(7,$dato['fecha_modif']);
			$sql->bindParam(8,$id);
			$sql->execute();
			return $sql;

				/* VERIFICAR SU GUARDA DEL DATO EN BITACORA */
				$datos_bitacora = 
				[
					"id_objeto" => 0,
					"fecha" => date('Y-m-d h:i:s'),
					"id_usuario" => null,
					"accion" => "Actualizacion de usuario",
					"descripcion" => "Acceso de usuario"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			
		}

		protected static function datos_usuario_modelo($tipo,$id){
			if($tipo=='unico'){
				$sql=mainModel::conectar()->prepare("SELECT * FROM TBL_usuarios where id_usuario=?");
				$sql->bindParam(1,$id);
			}
			$sql->execute();
			return $sql;
		}

		 protected static function eliminar_usuario_modelo($accion,$id){
			if($accion=='inactivar'){
				$sql=mainModel::conectar()->prepare("UPDATE TBL_usuarios set estado_usuario=2 where id_usuario=?");
				$sql->bindParam(1,$id);
				$sql->execute();
				return $sql;
			}else if ($accion=='eliminar'){
				$sql=mainModel::conectar()->prepare("DELETE FROM TBL_usuarios where id_usuario=?");
				$sql->bindParam(1,$id);
				$sql->execute();
				return $sql;
			}
			
		
		}

	}