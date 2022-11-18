<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
} 

if($peticionAjax){
	require_once "../modelos/compraModelo.php";
	require_once "../pruebabitacora.php";
}else{
	require_once "./modelos/compraModelo.php";
	require_once "./pruebabitacora.php";//aqui se ejecuta dentro del index y no se utiliza Ajax
}

class compraControlador extends compraModelo
{

    // Nueva compra controlador
    public function agregar_compra_controlador()
    {
																// name de las vistas
        $Proveedor=mainModel::limpiar_cadena(strtoupper($_POST['idproveedor']));
        $Usuario=mainModel::limpiar_cadena(strtoupper($_POST['usuarioid']));
        $Estadocompra=mainModel::limpiar_cadena(strtoupper($_POST['idestadocompra']));
        $Fechacompra=mainModel::limpiar_cadena(strtoupper($_POST['fechacompra_insumo']));
        $Totalcompra=mainModel::limpiar_cadena(strtoupper($_POST['totalcompra_insumo']));

        // Agregar la compra
        $datos_compra_reg=[
			"proveedor"=>$Proveedor,
			"usuario"=>$Usuario,
            "estadocompra"=>$Estadocompra,
			"fechacompra"=>$Fechacompra,
            "totalcompra"=>$Totalcompra
        ];    

        $agregar_compra=compraModelo::agregar_compra_modelo($datos_compra_reg);

        if ($agregar_compra->rowCount()==1){
            $alerta=[
                "Alerta"=>"limpiar",
                "Titulo"=>"Proveedor registrado",
                "Texto"=>"Los datos del proveedor han sido registrados con exito",
                "Tipo"=>"success"
            ];

            
        }else{
            $alerta=[
                "Alerta"=>"simple",
                "Titulo"=>"Ocurrió un error inesperado",
                "Texto"=>"No hemos podido registrar el Proveedor",
                "Tipo"=>"error"
            ];
        }
        echo json_encode($alerta);

        // guardar las acciones de nueva compra en la bitacora
        $datos_bitacora = [
            "id_objeto" => 0,
            "fecha" => date('Y-m-d h:i:s'),
            "id_Proveedores" => $_SESSION['id_login'],
            "accion" => "Creación de Compra",
            "descripcion" => "El usuario ".$_SESSION['usuario_login']." realizó una nueva compra en el sistema"
        ];
        Bitacora::guardar_bitacora($datos_bitacora); 

    }/* Fin controlador */

    // Actualizar compra controlador
    public function actualizar_compra_controlador()
    {

        $id_actualizar=mainModel::limpiar_cadena($_POST['id_actualizacion_actu']);
        $Insumo=mainModel::limpiar_cadena(strtoupper($_POST['insumo_nombre_actu']));
        $Cantidad=mainModel::limpiar_cadena(strtoupper($_POST['insumo_cantidad_actu']));
        $Preciounitario=mainModel::limpiar_cadena(strtoupper($_POST['insumo_precio_actu']));
        $Fechacaducidad=mainModel::limpiar_cadena(strtoupper($_POST['fechacaducidad_insumo_actu']));
        $Fechacompra=mainModel::limpiar_cadena(strtoupper($_POST['fechacompra_insumo_actu']));
        $Proveedor=mainModel::limpiar_cadena(strtoupper($_POST['proveedor_actu']));
        $Estadocompra=mainModel::limpiar_cadena(strtoupper($_POST['estadocompra_insumo_actu']));
        $Totalcompra=mainModel::limpiar_cadena(strtoupper($_POST['totalcompra_insumo_actu']));


         /*== comprobar campos vacios ==*/
		if($Insumo=="" || $Cantidad=="" || $Preciounitario=="" || $Fechacaducidad=="" || $Fechacompra=="" || $Proveedor=="" || $Estadocompra=="" || $Totalcompra==""){
			$alerta=[
				"Alerta"=>"simple",
				"Titulo"=>"Ocurrió un error inesperado",
				"Texto"=>"No se han llenado todos los campos que son obligatorios",
				"Tipo"=>"error"
			];
			echo json_encode($alerta);
			exit();
		}

        /*== Verificando integridad de los datos ==*/
			if(mainModel::verificar_datos("[A-ZÁÉÍÓÚÑ ]{1,30}",$Insumo)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El dato no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

			if(mainModel::verificar_datos("[0-9]{1,14}",$Cantidad)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El dato no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

            if(mainModel::verificar_datos("[0-9]{1,14}",$Preciounitario)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El dato no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

            if(mainModel::verificar_datos("A-ZÁÉÍÓÚÑ ]{1,30}",$Proveedor)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El dato no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

            if(mainModel::verificar_datos("A-ZÁÉÍÓÚÑ ]{1,30}",$Estadocompra)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El dato no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

            if(mainModel::verificar_datos("[0-9]{1,14}",$Totalcompra)){
				$alerta=[
					"Alerta"=>"simple",
					"Titulo"=>"Ocurrió un error inesperado",
					"Texto"=>"El dato no coincide con el formato solicitado",
					"Tipo"=>"error"
				];
				echo json_encode($alerta);
				exit();
			}

    }/* Fin controlador */

    // Eliminar compra controlador
    public function eliminarCompra()
    {



    }/* Fin controlador */

}