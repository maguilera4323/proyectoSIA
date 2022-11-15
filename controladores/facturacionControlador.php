<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/facturacionModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/facturacionModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}


class facturacionControlador extends facturacionModelo
{

}