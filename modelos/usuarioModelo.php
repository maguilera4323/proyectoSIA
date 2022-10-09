<?php
	
	require_once "mainModel.php";

	class usuarioModelo extends mainModel{

		/*--------- Modelo agregar usuario ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function agregar_usuario_modelo($datos){
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_usuarioS(usuario,nombre_usuario,estado_usuario,
			contrasena,id_rol,fecha_ultima_conexion,preguntas_contestadas,primer_ingreso,fecha_vencimiento,
			correo_electronico,creado_por,fecha_creacion,modificado_por,fecha_modificacion)
			 VALUES(:DNI,:Nombre,:Apellido,:Telefono,:Direccion,:Email,:Usuario,:Clave,:Estado,:Privilegio)");

			$sql->bindParam(":usuario",$datos['DNI']);
			$sql->bindParam(":nombre_usuario",$datos['Nombre']);
			$sql->bindParam(":estado_usuario",$datos['Apellido']);
			$sql->bindParam(":contrasena",$datos['Telefono']);
			$sql->bindParam(":id_rol",$datos['Direccion']);
			$sql->bindParam(":fecha_ultima_conexion",$datos['Email']);
			$sql->bindParam(":preguntas_contestadas",$datos['Usuario']);
			$sql->bindParam(":primer_ingreso",$datos['Clave']);
			$sql->bindParam(":fecha_vencimiento",$datos['Estado']);
			$sql->bindParam(":correo_electronico",$datos['Privilegio']);
			$sql->bindParam(":creado_por",$datos['Privilegio']);
			$sql->bindParam(":fecha_creacion",$datos['Privilegio']);
			$sql->bindParam(":modificado_por",$datos['Privilegio']);
			$sql->bindParam(":fecha_modificacion",$datos['Privilegio']);
			$sql->bindParam(":Privilegio",$datos['Privilegio']);
			$sql->execute();

			return $sql;
		}

	}