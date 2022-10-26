<?php

if (session_status() == PHP_SESSION_NONE) {
    session_start();
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
