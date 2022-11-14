<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/proveedorModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/proveedorModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}

class compraControlador extends compraModelo
{

    // Nueva compra controlador
    public function agregar_compra_controlador()
    {



    }

    // Actualizar compra controlador
    public function actualizar_compra_controlador()
    {



    }

    // Eliminar compra controlador
    public function eliminarCompra()
    {

        

    }

}