<?php
	
	require_once "mainModel.php";

	class usuarioModelo extends mainModel{

		/*--------- Modelo agregar usuario ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_usuario_modelo($datos){
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_usuarios(usuario,nombre_usuario,estado_usuario,
			contrasena,id_rol,primer_ingreso,fecha_vencimiento,correo_electronico,creado_por,fecha_creacion)
			 VALUES(:Usu,:Nombre,:Estado,:correo,:contrase,:ingreso,:vencimiento,:creador,:fecha_crea,:Rol
			 ,:Fech_cone,:preguntas,)");

			$sql->bindParam(":Usu",$datos['Usu']);
			$sql->bindParam(":Nombre",$datos['Nombre']);
			$sql->bindParam(":Estado",$datos['Estado']);
			$sql->bindParam(":contrase",$datos['contrase']);
			$sql->bindParam(":Rol",$datos['Rol']);
			$sql->bindParam(":ingreso",$datos['ingreso']);	
			$sql->bindParam(":vencimiento",$datos['vencimiento']);
			$sql->bindParam(":correo,",$datos['correo']);
			$sql->bindParam(":creador",$datos['creador']);
			$sql->bindParam(":fecha_crea",$datos['fecha_crea']);
				
			$sql->execute();

			return $sql;
		}

	}