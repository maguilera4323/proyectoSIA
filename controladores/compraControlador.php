<?php
//verifica si hay sesiones iniciadas
if (session_status() == PHP_SESSION_NONE) {
	session_start();
}

class Invoice{
	private $host  = '20.163.218.52';
	private $user  = 'admin_bd';
	private $password   = "clave1234";
	private $database  = "proyecto_cafeteria";
	private $invoiceOrderTable = 'TBL_compras';
	private $invoiceOrderItemTable = 'TBL_detalle_compra';
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
	private function getData($sqlQuery)
	{
		$result = mysqli_query($this->dbConnect, $sqlQuery);
		if (!$result) {
			die('Error in query: ' . mysqli_error());

		}
		$data = array();
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
			$data[] = $row;
		}
		return $data;
	}

	private function getNumRows($sqlQuery)
	{
		$result = mysqli_query($this->dbConnect, $sqlQuery);
		if (!$result) {
			die('Error in query: ' . mysqli_error());
		}
		$numRows = mysqli_num_rows($result);
		return $numRows;
	}

	
	public function saveInvoice($POST)
	{
		$sqlInsert = "
			INSERT INTO " . $this->invoiceOrderTable . "(id_proveedor, id_usuario, id_estado_compra,  total_compra) 
			VALUES ('" . $POST['proveedor_compra'] . "', '" . $_SESSION['id_login'] . "', '" . $POST['estado_compra'] . "', '" . $POST['subTotal'] . "')";
		mysqli_query($this->dbConnect, $sqlInsert);
		$lastInsertId = mysqli_insert_id($this->dbConnect); 
		for ($i = 0; $i < count($POST['productCode']); $i++) {
			$sqlInsertItem = "
			INSERT INTO " . $this->invoiceOrderItemTable . "(id_compra, id_insumos, cantidad_comprada, precio_costo, fecha_caducidad) 
			VALUES ('" . $POST['productCode'][$i] . "', '" . $POST['productName'][$i] . "', '" . $POST['quantity'][$i] . "', '" . $POST['price'][$i] . "', '" . $POST['fechaCaducidad'][$i] . "')";
			mysqli_query($this->dbConnect, $sqlInsertItem);
		}
	}

	public function updateInvoice($POST)
	{
		if ($POST['invoiceId']) {
			$sqlInsert = "
				UPDATE " . $this->invoiceOrderTable . " 
				SET order_receiver_name = '" . $POST['companyName'] . "', order_receiver_address= '" . $POST['address'] . "', order_total_before_tax = '" . $POST['subTotal'] . "', order_total_tax = '" . $POST['taxAmount'] . "', order_tax_per = '" . $POST['taxRate'] . "', order_total_after_tax = '" . $POST['totalAftertax'] . "', order_amount_paid = '" . $POST['amountPaid'] . "', order_total_amount_due = '" . $POST['amountDue'] . "', note = '" . $POST['notes'] . "' 
				WHERE user_id = '" . $POST['userId'] . "' AND order_id = '" . $POST['invoiceId'] . "'";
			mysqli_query($this->dbConnect, $sqlInsert);
		}
		$this->deleteInvoiceItems($POST['invoiceId']);
		for ($i = 0; $i < count($POST['productCode']); $i++) {
			$sqlInsertItem = "
				INSERT INTO " . $this->invoiceOrderItemTable . "(order_id, item_code, item_name, order_item_quantity, order_item_price, order_item_final_amount) 
				VALUES ('" . $POST['invoiceId'] . "', '" . $POST['productCode'][$i] . "', '" . $POST['productName'][$i] . "', '" . $POST['quantity'][$i] . "', '" . $POST['price'][$i] . "', '" . $POST['total'][$i] . "')";
			mysqli_query($this->dbConnect, $sqlInsertItem);
		}
	}


	public function getInvoiceList()
	{
		$sqlQuery = "
			SELECT * FROM " . $this->invoiceOrderTable . " 
			WHERE user_id = '" . $_SESSION['userid'] . "'";
		return  $this->getData($sqlQuery);
	}


	public function getInvoice($invoiceId)
	{
		$sqlQuery = "
			SELECT * FROM " . $this->invoiceOrderTable . " 
			WHERE user_id = '" . $_SESSION['userid'] . "' AND order_id = '$invoiceId'";
		$result = mysqli_query($this->dbConnect, $sqlQuery);
		$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
		return $row;
	}
	public function getInvoiceItems($invoiceId)
	{
		$sqlQuery = "
			SELECT * FROM " . $this->invoiceOrderItemTable . " 
			WHERE order_id = '$invoiceId'";
		return  $this->getData($sqlQuery);
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