<?php
require_once "./modelos/mainModel.php";

//clase que realizará las consultas a la BD
class Usuario extends mainModel{
	public $user;
	public $password;
    private $db;


	function getUsuario() {
		return $this->user;
	}

	function getPassword() {
		return $this->password;
	}

	function setUsuario($user) {
		$this->user = $user;
	}

	function setPassword($password) {
		$this->password = $password;
	}

	//Funcion que realiza un select para encontrar un usuario con los datos ingresados
	//los resultados de la consulta pasan al controlador por medio del retorno de $respuesta
	public function accesoUsuario($user, $password) {
		$db = new mainModel();
		$query = "SELECT * FROM TBL_usuarios WHERE usuario = '".$user. "' AND contrasena = '".$password . "' LIMIT 1";
		return $respuesta = $db->ejecutar_consulta_simple($query);
	}

		//Funcion que realiza un update para cambiar el estado del usuario al realizar tres intentos fallidos
	//los resultados de la consulta pasan al controlador por medio del retorno de $respuesta
	public function bloquearUsuario($user) {
		$db = new mainModel();
		$query= ("UPDATE TBL_usuarios SET estado_usuario=3 WHERE usuario = '$user'");
		return $respuesta = $db->actualizarRegistros($query);
	}

	public function intentosValidos() {
		$db = new mainModel();
		$query = "SELECT valor FROM TBL_ms_parametros WHERE parametro = 'ADMIN_INTENTOS_INVALIDOS' LIMIT 1";
		return $respuesta = $db->ejecutar_consulta_simple($query);
	}



}