<?php
//verifica si hay sesiones iniciadas
if (session_status() == PHP_SESSION_NONE) {
	session_start();
}
require_once "./pruebabitacora.php";


//clase para la factura
class Invoice{
	private $host  = '20.163.218.52';
	private $user  = 'admin_bd';
	private $password   = "clave1234";
	private $database  = "proyecto_cafeteria";
	private $datosPedido = 'TBL_pedidos';
	private $datosDetallePedido = 'TBL_detalle_pedido';
	private $datosCAI = 'TBL_talonario_cai';
	private $recetario = 'TBL_recetario';
	private $inventario = 'TBL_inventario';
	private $movi_inv = 'TBL_movi_inventario';
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



		//función para crear y guardar una factura
		public function nuevaFactura($POST){	
		//primer insert, para la tabla de Pedidos
		$sqlInsert = "
			INSERT INTO " . $this->datosPedido . "(id_cliente, num_factura, fech_pedido,  fech_entrega, sitio_entrega, id_estado_pedido, sub_total, ISV, total, id_forma_pago, fech_facturacion,porcentaje_isv) 
			VALUES ('" . $POST['cliente_pedido'] . "', '" . $POST['num_factura'] . "', '" . $POST['fecha_pedido'] . "', '" . $POST['fecha_entrega'] . "','" . $POST['sitio_entrega'] . "',
			'" . $POST['estado_pedido'] . "', '" . $POST['subTotal'] . "','" . $POST['taxAmount'] . "','" . $POST['totalAftertax'] . "','" . $POST['forma_pago_venta'] . "', now(),('" . $POST['taxRate'] . "')/100 )";
		mysqli_query($this->dbConnect, $sqlInsert);
		$lastInsertId = mysqli_insert_id($this->dbConnect); 

		//funcion de update para actualizar el valor actual de las facturas del talonario CAI
		$sqlUpdate = "
		UPDATE " . $this->datosCAI . " 
				SET cai_actual = '" . $POST['num_factura'] . "' 
				WHERE id_talonario_cai = 1";
		mysqli_query($this->dbConnect, $sqlUpdate);

		//segundo insert, para la tabla de Detalle Pedidos
		//el ciclo es para insertar todos los productos agregados al pedido
		for ($i = 0; $i < count($POST['nombreProducto']); $i++) {

			$sqlInsertItem = "
			INSERT INTO " . $this->datosDetallePedido . "(id_pedido, id_producto, cantidad, precio_venta) 
			VALUES ('" . $POST['numPedido'] . "', '" . $POST['nombreProducto'][$i] . "', '" . $POST['cantidad'][$i] . "', '" . $POST['precio'][$i] . "')";
			mysqli_query($this->dbConnect, $sqlInsertItem);

			//select para obtener los datos de los insumos que componen el producto vendido
			$sqlSelectRecetario = " 
			SELECT * FROM " . $this->recetario . " WHERE id_producto='" . $POST['nombreProducto'][$i] . "'";
			$query=mysqli_query($this->dbConnect,$sqlSelectRecetario);
				if (!$query) {
					die('Error in query');
				}

				//se crea un arreglo para recibir todos los insumos y las respectivas cantidades de los mismos
				$id_insumo = array();
				$cantidad= array();
				$cont = 0;
				while ($row = $query->fetch_assoc()) {
					$id_insumo[$cont]=$row['id_insumo'];
					$cantidad[$cont]=$row['cant_insumo'];
					$cont++;
				}																																																											
			
				//ciclo que se encarga de actualizar el inventario, restando los insumos consumidos por cada producto
				//y de insertar en la tabla de movimientos de inventario la cantidad de insumos usados y el tipo de movimiento
				for($j=0;$j<$cont;$j++){
					$sqlUpdateInventario = "
						UPDATE " . $this->inventario . " 
						SET cant_existencia = cant_existencia - '" . $cantidad[$j]*$POST['cantidad'][$i] . "' 
						WHERE id_insumo = '" . $id_insumo[$j] . "' ";
					mysqli_query($this->dbConnect, $sqlUpdateInventario);

					$sqlInsertMoviInventario = "
					INSERT INTO " . $this->movi_inv . "(id_insumos, cant_movimiento, tipo_movimiento, fecha_movimiento,id_usuario,comentario) 
					VALUES ('" . $id_insumo[$j] . "', '" . $cantidad[$j] . "', 2, now(),'" . $_SESSION['id_login'] . "','Salida de insumos')";
					mysqli_query($this->dbConnect, $sqlInsertMoviInventario);
				}
			  
		} 

		if (isset($lastInsertId)=='true'){
			echo '<script>
			swal.fire("Venta Realizada", "La venta se ha realizado exitosamente", "success")
			</script>'; 

			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Nuevo pedido",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." registró un pedido en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora); 
		}

		 
	}


	public function actualizarFactura($POST){
		//primer update, para la tabla de Compras
		if ($POST['nombreProducto']) {
			for ($i = 0; $i <1; $i++) {
			$sqlUpdate = "
				UPDATE " . $this->datosPedido . " 
				SET id_cliente = '" . $POST['cliente_pedido'] . "', num_factura= '" . $POST['num_factura'] . "', fech_pedido = '" . $POST['fecha_pedido'] . "', 
				fech_entrega = '" . $POST['fecha_entrega'] . "', sitio_entrega = '" . $POST['sitio_entrega'] . "', id_estado_pedido = '" . $POST['estado_pedido'] . "',
				sub_total = '" . $POST['subTotal'] . "', ISV = '" . $POST['taxAmount'] . "', total = '" . $POST['totalAftertax'] . "', id_forma_pago = '" . $POST['forma_pago_venta'] . "',
				fech_facturacion = now() WHERE id_pedido = '" . $POST['id_act_pedido'][$i] . "' ";
			mysqli_query($this->dbConnect, $sqlUpdate);
		}


		//segundo update, para la tabla de DetalleCompras
		//el ciclo for para actualizar los insumos agregados a la compra
			for ($i = 0; $i < count($POST['nombreProducto']); $i++) {
				 $sqlUpdateItem = "
				UPDATE " . $this->datosDetallePedido . "
				SET id_pedido = '" . $POST['id_act_pedido'][$i] . "', id_producto= '" . $POST['nombreProducto'][$i] . "', cantidad = '" . $POST['cantidad'][$i] . "', precio_venta = '" . $POST['precio'][$i] . "' 
					WHERE id_detalle_pedido = '" . $POST['id_act_detallepedido'][$i] . "' ";
				mysqli_query($this->dbConnect, $sqlUpdateItem); 
			} 
		}
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
		$sql = "
			DELETE FROM " . $this->invoiceOrderTable . " 
			WHERE order_id = '" . $invoiceId . "'";
		mysqli_query($this->dbConnect, $sqlQuery);
		$this->deleteInvoiceItems($invoiceId);
		return 1;
	}
}
