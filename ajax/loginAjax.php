<?php
$peticionAjax=true;
require_once "../config/APP.php";

if (isset($_POST['token']) && isset($_POST['usuario'])){
    require_once '../controladores/loginControlador.php';
    $close_login=new loginControlador();

    echo $close_login->cerrarSesion();

}else{
    session_start();
    session_unset();
    session_destroy();
    header("Location: ".SERVERURL."login/");
    exit();
}