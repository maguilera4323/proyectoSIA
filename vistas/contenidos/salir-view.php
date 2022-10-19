<?php

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

include ("./cone.php");
$sql="SELECT * FROM TBL_usuarios";
$result=mysqli_query($conexion,$sql);
while($mostrar=mysqli_fetch_assoc($result)){

}			
		

session_destroy();
$datos_bitacora = 
[
    "id_objeto" => 0,
    "fecha" => date('Y-m-d h:i:s'),
    "id_usuario" => $mostrar['id_usuario'],//cambiar aqui para que me pueda traer el USU conectado
    "accion" => "Cerrado de sesion",
    "descripcion" => "Acceso de usuario"
];
Bitacora::guardar_bitacora($datos_bitacora);

header("Location:".SERVERURL."login/");
die();
