<?php
	
	require_once "mainModel.php";

	class usuarioModelo extends mainModel{

		/*--------- Modelo agregar usuario ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_usuario_modelo($datos){
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_usuarioS(usuario,nombre_usuario,estado_usuario,
			contrasena,id_rol,fecha_ultima_conexion,preguntas_contestadas,primer_ingreso,fecha_vencimiento,
			correo_electronico,creado_por,fecha_creacion)
			 VALUES(:Usu,:Nombre,:Estado,:Contra,:Rol,:Fech_cone,:preguntas,:ingreso,:vencimiento,:correo,:creador,:fecha_crea)");

			$sql->bindParam(":usuario",$datos['Usu']);
			$sql->bindParam(":nombre_usuario",$datos['Nombre']);
			$sql->bindParam(":correo_electronico",$datos['correo']);
			$sql->bindParam(":contrasena",$datos['Contra']);
			$sql->bindParam(":estado_usuario",$datos['Estado']);
			$sql->bindParam(":primer_ingreso",$datos['ingreso']);
			$sql->bindParam(":fecha_vencimiento",$datos['vencimiento']);
			$sql->bindParam(":creado_por",$datos['creador']);
			$sql->bindParam(":fecha_creacion",$datos['fecha_crea']);
			$sql->bindParam(":id_rol",$datos['Rol']);	
			$sql->execute();

			return $sql;
		}

	}