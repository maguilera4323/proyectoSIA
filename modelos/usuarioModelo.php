<?php
	
	require_once "mainModel.php";

	class usuarioModelo extends mainModel{

		/*--------- Modelo agregar usuario ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_usuario_modelo($datos)
		{
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_usuarios(usuario,nombre_usuario,estado_usuario,
			contrasena,id_rol,primer_ingreso,fecha_vencimiento,correo_electronico,creado_por,fecha_creacion)
			VALUES(?,?,?,?,?,?,?,?,?,?)");

			$sql->bindParam(1,$datos['usu']);
			$sql->bindParam(2,$datos['nombre']);
			$sql->bindParam(3,$datos['estado']);
			$sql->bindParam(4,$datos['contrase']);
			$sql->bindParam(5,$datos['rol']);
			$sql->bindParam(6,$datos['ingreso']);	
			$sql->bindParam(7,$datos['vencimiento']);
			$sql->bindParam(8,$datos['correo']);
			$sql->bindParam(9,$datos['creador']);
			$sql->bindParam(10,$datos['fecha_crea']);
			$sql->execute();
			return $sql;

				/* VERIFICAR SU GUARDA DEL DATO EN BITACORA */
				$datos_bitacora = 
				[
					"id_objeto" => 0,
					"fecha" => date('Y-m-d h:i:s'),
					"id_usuario" => null,
					"accion" => "insercion de usuario",
					"descripcion" => "Acceso de usuario"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
							
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
/* 				$datos_bitacora = 
				[
					"id_objeto" => 0,
					"fecha" => date('Y-m-d h:i:s'),
					"id_usuario" => null,
					"accion" => "Actualizacion de usuario",
					"descripcion" => "Acceso de usuario"
				];
				Bitacora::guardar_bitacora($datos_bitacora);*/
			
		} 


		// modelo para actualizar perfil
		protected static function actualizar_perfil_modelo($dato, $id){
            $sql=mainModel::conectar()->prepare("UPDATE TBL_usuarios SET usuario=?,nombre_usuario=?,
			 correo_electronico=?, contrasena=?
			WHERE id_usuario=?");

            $sql->bindParam(1,$dato['usuper']);
            $sql->bindParam(1,$dato['nombreper']);
            $sql->bindParam(1,$dato['correoper']);
            $sql->bindParam(1,$dato['passwordper']);
            return $sql;
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