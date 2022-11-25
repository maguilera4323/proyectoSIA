<?php
//verifica si hay sesiones iniciadas
if (session_status() == PHP_SESSION_NONE) {
	session_start();
}
/* require_once "../pruebabitacora.php";  */


//clase para la factura
class Invoice{
	private $host  = '20.163.218.52';
	private $user  = 'admin_bd';
	private $password   = "clave1234";
	private $database  = "proyecto_cafeteria";
	private $datosCompra = 'TBL_compras';
	private $datosDetalleCompra = 'TBL_detalle_compra';
	private $dbConnect = false;

	public function __construct()
	{
		if (!$this->dbConnect) {
			$conn = new mysqli($this->host, $this->user, $this->password, $this->database);
			if ($conn->connect_error) {
				die("Error failed to connect to MySQL: " . $conn->connect_error);
			} else {
				$this->dbConnect = $conn;
			}
		}
	}



		//función para crear y guardar una factura de compra
		public function nuevaFactura($POST){	
		//primer insert, para la tabla de Compras
		$sqlInsert = "
			INSERT INTO " . $this->datosCompra . "(id_proveedor, id_usuario, id_estado_compra,  fech_compra,total_compra) 
			VALUES ('" . $POST['proveedor_compra'] . "', '" . $_SESSION['id_login'] . "', '" . $POST['estado_compra'] . "', now(),'" . $POST['subTotal'] . "')";
		mysqli_query($this->dbConnect, $sqlInsert);
		$lastInsertId = mysqli_insert_id($this->dbConnect); 

		//segundo insert, para la tabla de Detalle Compras
		//el ciclo es para insertar todos los insumos agregados a la compra
		for ($i = 0; $i < count($POST['productName']); $i++) {
			$sqlInsertItem = "
			INSERT INTO " . $this->datosDetalleCompra . "(id_compra, id_insumos, cantidad_comprada, precio_costo, fecha_caducidad,estado_compra) 
			VALUES ('" . $POST['productCode'] . "', '" . $POST['productName'][$i] . "', '" . $POST['quantity'][$i] . "', '" . $POST['price'][$i] . "', '" . $POST['fechaCaducidad'][$i] . "', '" . $POST['estado_compra'] . "')";
			mysqli_query($this->dbConnect, $sqlInsertItem);
		}

		if (isset($lastInsertId)=='true'){
			echo '<script>
			swal.fire("Compra Realizada", "Su compra se ha realizado exitosamente", "success")
			</script>'; 
		}
		

		/* $datos_bitacora = [
			"id_objeto" => 0,
			"fecha" => date('Y-m-d H:i:s'),
			"id_usuario" => $_SESSION['id_login'],
			"accion" => "Nueva compra",
			"descripcion" => "El usuario ".$_SESSION['usuario_login']." registró una compra en el sistema"
		];
		Bitacora::guardar_bitacora($datos_bitacora);  */
	}


	public function actualizarFactura($POST){
		//primer update, para la tabla de Compras
		if ($POST['proveedor_compra']) {
			for ($i = 0; $i <1; $i++) {
			$sqlUpdate = "
				UPDATE " . $this->datosCompra . " 
				SET id_proveedor = '" . $POST['proveedor_compra'] . "', id_usuario= '" . $_SESSION['id_login'] . "', id_estado_compra = '" . $POST['estado_compra'] . "', fech_compra = '" . $POST['fecha_compra'] . "', total_compra = '" . $POST['subTotal'] . "' 
				WHERE id_compra = '" . $POST['id_act_compra'][$i] . "' ";
			mysqli_query($this->dbConnect, $sqlUpdate);
		}


		//segundo update, para la tabla de DetalleCompras
		//el ciclo for para actualizar los insumos agregados a la compra
			for ($i = 0; $i < count($POST['productName']); $i++) {
				 $sqlUpdateItem = "
				UPDATE " . $this->datosDetalleCompra . "
				SET id_compra = '" . $POST['id_act_compra'][$i] . "', id_insumos= '" . $POST['productName'][$i] . "', cantidad_comprada = '" . $POST['quantity'][$i] . "', precio_costo = '" . $POST['price'][$i] . "', fecha_caducidad = '" . $POST['fechaCaducidad'][$i] . "' 
					WHERE id_detalle_compra = '" . $POST['id_act_detallecompra'][$i] . "' ";
				mysqli_query($this->dbConnect, $sqlUpdateItem); 
			}
		}

		$datos_bitacora = [
			"id_objeto" => 0,
			"fecha" => date('Y-m-d H:i:s'),
			"id_usuario" => $_SESSION['id_login'],
			"accion" => "Nueva compra",
			"descripcion" => "El usuario ".$_SESSION['usuario_login']." actualizó los datos de una compra en el sistema"
		];
		Bitacora::guardar_bitacora($datos_bitacora);
	}



	public function deleteInvoiceItems($invoiceId)
	{
		$sqlQuery = "
			DELETE FROM " . $this->invoiceOrderItemTable . " 
			WHERE order_id = '" . $invoiceId . "'";
		mysqli_query($this->dbConnect, $sqlQuery);
	}
	public function deleteInvoice($invoiceId)
	{
		$sqlQuery = "
			DELETE FROM " . $this->invoiceOrderTable . " 
			WHERE order_id = '" . $invoiceId . "'";
		mysqli_query($this->dbConnect, $sqlQuery);
		$this->deleteInvoiceItems($invoiceId);
		return 1;
	}
}
