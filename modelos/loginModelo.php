<?php
require_once "./modelos/mainModel.php";

//clase que realizará las consultas a la BD
class Usuario extends mainModel{
	public $user;
	public $password;
	public $preg;
	public $response;
    private $db;


	function getUsuario() {
		return $this->user;
	}

	function getContrasena() {
		return $this->password;
	}

	function setUsuario($user) {
		$this->user = $user;
	}

	function setContrasena($password) {
		$this->password = $password;
	}

	function getPregunta() {
		return $this->preg;
	}

	function getRespuesta() {
		return $this->response;
	}

	function setPregunta($preg) {
		$this->preg = $preg;
	}

	function setRespuesta($response) {
		$this->response = $response;
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

	//Función que realiza un select para obtener el parametro de intentos válidos de ingreso
	//Aún no funciona, se sigue trabajando en ella
	public function intentosValidos() {
		$db = new mainModel();
		$query = "SELECT valor FROM TBL_ms_parametros WHERE parametro = 'ADMIN_INTENTOS_INVALIDOS' LIMIT 1";
		return $respuesta = $db->ejecutar_consulta_simple($query);
	}

	//Función que realiza un select para revisar si el usuario ingresado para recuperacion de contraseña existe en la bd
	public function verificaUsuarioExistente($user) {
		$db = new mainModel();
		$query = "SELECT * FROM TBL_usuarios WHERE usuario = '".$user. "' LIMIT 1";
		return $respuesta = $db->ejecutar_consulta_simple($query);
	}

	public function verificaPregunta($preg,$response,$user) {
		$db = new mainModel();
		$query = ("SELECT COUNT(*) as registro_encontrado FROM TBL_ms_preguntas_usuario pu 
							inner JOIN TBL_usuarios u ON pu.id_usuario = u.id_usuario 
							inner JOIN TBL_preguntas p ON pu.id_pregunta = p.id_pregunta
			WHERE pu.respuesta='$response'and p.pregunta='$preg' and u.usuario='$user' limit 1");
		return $respuesta = $db->ejecutar_consulta_simple($query);
	}
}