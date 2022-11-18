<?php
    $peticionAjax=true;
	require_once "../config/APP.php";

    if (isset($_POST['idproveedor']) || isset($_POST['idproveedor_actu']) || isset($_POST['idproveedor_del']))
    {
         /*   Instancia del controlador Compra  */
         require_once "../controladores/compraControlador.php";
		$ins_compra = new compraControlador();

        /*    Instancia agregar nueva compra    */
        if(isset($_POST['idproveedor'])){
			echo $ins_compra->agregar_compra_controlador();
			die();
		}

        /*      Instancia actualizar compra     */
        if(isset($_POST['idproveedor_actu']) ){
			echo $ins_compra->actualizar_compra_controlador();
			die();
		}

        /*     Instancia eliminar compra      */ 
        if(isset($_POST['idproveedor_del']) ){
			echo $ins_compra->eliminarCompra();
			die();
		}else{
			session_start();//se cambio de SPM  a SIA
			session_unset();//Vaciamos la sesion
			session_destroy();//destruimos la sesion
			header("Location: ".SERVERURL."login/");//lo redirigimos al login para que ingrese con su usuario
			exit();
		}
    }

