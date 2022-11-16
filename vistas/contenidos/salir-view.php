<?php

if (session_status() == PHP_SESSION_NONE) {
    session_start();

    //llamado al controlador de login
    require_once 'controladores/loginControlador.php';
    $usuario = new loginControlador(); //se crea nueva instancia de usuario

	//valdacion para ver si se recibieron datos de ingreso
    if (isset($_SESSION['id_login'])) {
		$id_usuario=$_SESSION['id_login'];
        $respuesta = $usuario->registrarUltimaConexion($id_usuario);  //se envian los datos a la funcion accesoUsuario de modelo Login
    }
}		
		
$datos_bitacora = 
[
    "id_objeto" => 0,
    "fecha" => date('Y-m-d H:i:s'),
    "id_usuario" => $_SESSION['id_login'],//cambiar aqui para que me pueda traer el USU conectado
    "accion" => "Cierre de sesión",
    "descripcion" => "El usuario ".$_SESSION['usuario_login']." salió del sistema"
];
Bitacora::guardar_bitacora($datos_bitacora);
session_unset();
session_destroy();
echo "<script>window.location.replace('http//localhost/proyectoSIA/login/');</script>";
die();
