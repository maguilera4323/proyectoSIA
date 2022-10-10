<?php
	
	require_once "mainModel.php";

	class usuarioModelo extends mainModel{

		/*--------- Modelo agregar usuario ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_usuario_modelo($datos){
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
			
		}

	}