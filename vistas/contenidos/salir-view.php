<?php

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}		
		

session_destroy();
$datos_bitacora = 
[
    "id_objeto" => 0,
    "fecha" => date('Y-m-d h:i:s'),
    "id_usuario" => $_SESSION['usuario_login'],//cambiar aqui para que me pueda traer el USU conectado
    "accion" => "Cerrado de sesion",
    "descripcion" => "Acceso de usuario"
];
Bitacora::guardar_bitacora($datos_bitacora);

header("Location:".SERVERURL."login/");
die();
