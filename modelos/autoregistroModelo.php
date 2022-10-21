<?php
	
	require_once "mainModel.php";

	class autoregistroModelo extends mainModel{

		/*--------- Modelo autoregistro usuario ------ESTE ES EL QUE INTERACTUA DIRECTO CON LA BD---*/
		protected static function autoregistro_modelo($datos)
		{
			$sql=mainModel::conectar()->prepare("INSERT INTO TBL_usuarios(usuario,nombre_usuario,estado_usuario,
			contrasena,id_rol,fecha_vencimiento,correo_electronico)
			VALUES(?,?,?,?,?,?,?)");

			$sql->bindParam(1,$datos['usu']);
			$sql->bindParam(2,$datos['nombre']);
			$sql->bindParam(3,$datos['estado']);
			$sql->bindParam(4,$datos['contrase']);
			$sql->bindParam(5,$datos['rol']);
			$sql->bindParam(6,$datos['vencimiento']);
			$sql->bindParam(7,$datos['correo']);
			$sql->execute();
			return $sql;
        }
    }