<?php
require_once "./modelos/mainModel.php";

//clase que realizará las consultas a la BD
class Usuario extends mainModel{
	public $user;
	public $user_id;
	public $password;
	public $preg;
	public $preg_id;
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

	function getPreguntaId() {
		return $this->preg_id;
	}

	function getUsuarioId() {
		return $this->user_id;
	}

	function setPreguntaId($preg_id) {
		$this->preg_id = $preg_id;
	}

	function setUsuarioId($user_id) {
		$this->user_id = $user_id;
	}

	//Funciones de Vista de Login
	//Funcion que realiza un select para encontrar un usuario con los datos ingresados
	//los resultados de la consulta pasan al controlador por medio del retorno de $respuesta
	public function accesoUsuario($user, $password) {
		$db = new mainModel();
		$query = "SELECT * FROM TBL_usuarios WHERE usuario = '".$user. "' AND BINARY contrasena = '".$password . "' LIMIT 1";
		return $respuesta = $db->ejecutar_consulta_simple($query);
	}

	//Funcion que realiza un select para encontrar un usuario con los datos ingresados
	//los resultados de la consulta pasan al controlador por medio del retorno de $respuesta
	public function verificarEstado($user) {
		$db = new mainModel();
		$query = "SELECT usuario, estado_usuario FROM TBL_usuarios WHERE usuario = '".$user. "' LIMIT 1";
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


	//Funciones de Vista Opciones de Recuperación de Contraseña
	//Función que realiza un select para revisar si el usuario ingresado para recuperacion de contraseña existe en la bd
	public function verificaUsuarioExistente($user) {
		$db = new mainModel();
		$query = "SELECT * FROM TBL_usuarios WHERE BINARY usuario = '".$user. "' LIMIT 1";
		return $respuesta = $db->ejecutar_consulta_simple($query);
	}


	//Funciones de Vista Preguntas de Seguridad
	//Función para revisar que la respuesta de una pregunta ingresada es la correcta
	public function verificarPreguntaSeguridad($preg,$response,$user) {
		$db = new mainModel();
		$query = ("SELECT pu.respuesta FROM TBL_ms_preguntas_usuario pu 
							inner JOIN TBL_usuarios u ON pu.id_usuario = u.id_usuario 
							inner JOIN TBL_preguntas p ON pu.id_pregunta = p.id_pregunta
			WHERE BINARY pu.respuesta='$response'and p.pregunta='$preg' and u.usuario='$user' limit 1");
		return $respuesta = $db->ejecutar_consulta_simple($query);
	}


	//Funciones de Vista Cambio de Contraseña
	public function verificarContrasenaActual($user) {
		$db = new mainModel();
		$query = "SELECT * FROM TBL_usuarios WHERE usuario = '".$user. "' LIMIT 1";
		return $respuesta = $db->ejecutar_consulta_simple($query);
	}


	public function cambioContrasena($user,$password) {
		$db = new mainModel();
		$query = "UPDATE TBL_usuarios set contrasena='$password' where usuario='$user'";
		return $respuesta = $db->actualizarRegistros($query);
	}

	public function minContrasena() {
		$db = new mainModel();
		$query = "SELECT valor FROM TBL_ms_parametros WHERE parametro = 'MIN_CONTRASENA' LIMIT 1";
		return $respuesta = $db->ejecutar_consulta_simple($query);
	}


	public function maxContrasena() {
		$db = new mainModel();
		$query = "SELECT valor FROM TBL_ms_parametros WHERE parametro = 'MAX_CONTRASENA' LIMIT 1";
		return $respuesta = $db->ejecutar_consulta_simple($query);
	}



	//Funciones de vista Primer Ingreso
	public function obtenerPreguntas($preg_id) {
		$db = new mainModel();
		$query = ("SELECT pregunta FROM TBL_preguntas WHERE BINARY id_pregunta='$preg_id' limit 1");
		return $respuesta = $db->ejecutar_consulta_simple($query);
	}


	public function insertarRespuestasSeguridad($response,$user,$user_id,$preg_id) {
		$db = new mainModel();
		$query = ("INSERT into TBL_ms_preguntas_usuario (id_pregunta,id_usuario,respuesta,creado_por,modificado_por,fecha_modificacion) 
		VALUES('$preg_id','$user_id','$response','$user',null,null)");
		return $respuesta = $db->actualizarRegistros($query);
	}
	

	public function actualizarUsuario($user_id) {
		$db = new mainModel();
		$query= ("UPDATE TBL_usuarios SET estado_usuario=1 WHERE id_usuario = '$user_id'");
		return $respuesta = $db->actualizarRegistros($query);
	}
}	