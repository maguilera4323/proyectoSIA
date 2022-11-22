<?php
//verifica si hay sesiones iniciadas
if (session_status() == PHP_SESSION_NONE) {
	session_start();
}
/* require_once "./pruebabitacora.php"; */


//clase para la factura
class Invoice{
	private $host  = '20.163.218.52';
	private $user  = 'admin_bd';
	private $password   = "clave1234";
	private $database  = "proyecto_cafeteria";
	private $datosCompra = 'TBL_pedidos';
	private $datosDetalleCompra = 'TBL_detalle_pedido';
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
			INSERT INTO " . $this->datosPedido . "(id_cliente, num_factura, fech_pedido,  fech_entrega, sitio_entrega, id_estado_pedido, sub_total, ISV, total, id_forma_pago, fech_facturacion, porcentaje_isv) 
			VALUES ('" . $POST['cliente_pedido'] . "', '" . $_SESSION['id_login'] . "', '" . $POST['estado_pedido'] . "', now(),'" . $POST['subTotal'] . "')";
		mysqli_query($this->dbConnect, $sqlInsert);
		$lastInsertId = mysqli_insert_id($this->dbConnect); 

		//segundo insert, para la tabla de Detalle Compras
		//el ciclo es para insertar todos los insumos agregados a la compra
		for ($i = 0; $i < count($POST['productCode']); $i++) {
			$sqlInsertItem = "
			INSERT INTO " . $this->datosDetallePedido . "(id_pedido, id_producto, cantidad, precio_venta) 
			VALUES ('" . $POST['productCode'][$i] . "', '" . $POST['productName'][$i] . "', '" . $POST['quantity'][$i] . "', '" . $POST['price'][$i] . "', '" . $POST['fechaCaducidad'][$i] . "')";
			mysqli_query($this->dbConnect, $sqlInsertItem);
		}

		$datos_bitacora = [
			"id_objeto" => 0,
			"fecha" => date('Y-m-d H:i:s'),
			"id_usuario" => $_SESSION['id_login'],
			"accion" => "Nuevo pedido",
			"descripcion" => "El usuario ".$_SESSION['usuario_login']." registró un pedido en el sistema"
		];
		Bitacora::guardar_bitacora($datos_bitacora); 
	}


	public function actualizarFactura($POST)
	{
		if ($POST['id_actualizacion']) {
			$sqlInsert = "
				UPDATE " . $this->datosCompra . " 
				SET id_proveedor = '" . $POST['proveedor_compra'] . "', id_usuario= '" . $_SESSION['id_login'] . "', id_estado_compra = '" . $POST['estado_compra'] . "', fech_compra = '" . $POST['fecha_compra'] . "', total_compra = '" . $POST['subTotal'] . "' 
				WHERE id_compra = '" . $POST['id_actualizacion'] . "' ";
			mysqli_query($this->dbConnect, $sqlInsert);
		}
		/* $this->deleteInvoiceItems($POST['invoiceId']);
		for ($i = 0; $i < count($POST['productCode']); $i++) {
			$sqlInsertItem = "
				INSERT INTO " . $this->invoiceOrderItemTable . "(order_id, item_code, item_name, order_item_quantity, order_item_price, order_item_final_amount) 
				VALUES ('" . $POST['invoiceId'] . "', '" . $POST['productCode'][$i] . "', '" . $POST['productName'][$i] . "', '" . $POST['quantity'][$i] . "', '" . $POST['price'][$i] . "', '" . $POST['total'][$i] . "')";
			mysqli_query($this->dbConnect, $sqlInsertItem);
		} */
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
