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
	private $datosCompra = 'TBL_compras';
	private $datosDetalleCompra = 'TBL_detalle_compra';
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
			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Nueva compra",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." registró una compra en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora);  

			echo '<script>
			swal.fire({
			title: "Compra Realizada",
			text: "Su compra ha sido realizada exitosamente",
			type: "success"
		  }).then(function() {
			  window.location.href = "../compra-list";
		  })
			</script>'; 
		}
		
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


				if($POST['estado_compra']==2){
					$sqlUpdateInventario = "
						UPDATE " . $this->inventario . " 
						SET cant_existencia = cant_existencia + '" . $POST['quantity'][$i] . "' 
						WHERE id_insumo = '" . $POST['productName'][$i] . "' ";
					mysqli_query($this->dbConnect, $sqlUpdateInventario);

					$sqlInsertMoviInventario = "
					INSERT INTO " . $this->movi_inv . "(id_insumos, cant_movimiento, tipo_movimiento, fecha_movimiento,id_usuario,comentario) 
					VALUES ('" . $POST['productName'][$i] . "', '" . $POST['quantity'][$i] . "', 1, now(),'" . $_SESSION['id_login'] . "','Entrada de insumos')";
					mysqli_query($this->dbConnect, $sqlInsertMoviInventario);}
			}
		}

		if (isset($sqlUpdateItem)=='true'){
			$datos_bitacora = [
				"id_objeto" => 0,
				"fecha" => date('Y-m-d H:i:s'),
				"id_usuario" => $_SESSION['id_login'],
				"accion" => "Actualización de compra",
				"descripcion" => "El usuario ".$_SESSION['usuario_login']." actualizó una compra en el sistema"
			];
			Bitacora::guardar_bitacora($datos_bitacora);  

			echo '<script>
			swal.fire({
			title: "Compra Actualizada",
			text: "Su compra ha sido actualizada exitosamente",
			type: "success"
		  }).then(function() {
			  window.location.href = "../compra-list";
		  })
			</script>'; 
		}
	}



	public function anularCompra($POST){
		if($POST['id_estado_del']==2){
		//select para obtener los datos de los insumos comprados desde el detalle de compraS
		$sqlSelectDetalleCompra = " 
		SELECT * FROM " . $this->datosDetalleCompra . " WHERE id_compra='" . $POST['id_compra_del'] . "'";
		$query=mysqli_query($this->dbConnect,$sqlSelectDetalleCompra);
			if (!$query) {
				die('Error in query');
			}

			//se crea un arreglo para recibir todos los insumos y las cantidades adquiridas de los mismos
			$id_insumo = array();
			$cantidad= array();
			$cont = 0;
			while ($fila = $query->fetch_assoc()) {
				$id_insumo[$cont]=$fila['id_insumos'];
				$cantidad[$cont]=$fila['cantidad_comprada'];
				$cont++;
			}																																																											
		
			//ciclo que se encarga de actualizar el inventario, restando los insumos comprados
			//y de insertar en la tabla de movimientos de inventario la cantidad de insumos restados
			for($j=0;$j<$cont;$j++){
				$sqlUpdateInventario = "
					UPDATE " . $this->inventario . " 
					SET cant_existencia = cant_existencia - '" . $cantidad[$j] . "' 
					WHERE id_insumo = '" . $id_insumo[$j] . "' ";
				mysqli_query($this->dbConnect, $sqlUpdateInventario);


				//query que se encarga de registrar la salida de los insumos al anularse la compra
				$sqlInsertMoviInventario = "
				INSERT INTO " . $this->movi_inv . "(id_insumos, cant_movimiento, tipo_movimiento, fecha_movimiento,id_usuario,comentario) 
				VALUES ('" . $id_insumo[$j] . "', '" . $cantidad[$j] . "', 2, now(),'" . $_SESSION['id_login'] . "','Salida de insumos por compra anulada')";
				mysqli_query($this->dbConnect, $sqlInsertMoviInventario);
			}

		}

			//query que actualiza el estado de la compra a Anulado
			$sqlUpdateEstadoCompra = "
			UPDATE " . $this->datosCompra . " 
			SET id_estado_compra = 3 WHERE id_compra = '" . $POST['id_compra_del'] . "' ";
			mysqli_query($this->dbConnect, $sqlUpdateEstadoCompra);


			if (isset($sqlUpdateEstadoCompra)=='true'){
				$datos_bitacora = [
					"id_objeto" => 0,
					"fecha" => date('Y-m-d H:i:s'),
					"id_usuario" => $_SESSION['id_login'],
					"accion" => "Nueva compra",
					"descripcion" => "El usuario ".$_SESSION['usuario_login']." anuló una compra en el sistema"
				];
				Bitacora::guardar_bitacora($datos_bitacora);  

				echo '<script>
				swal.fire({
				title: "Compra Anulada",
				text: "La compra seleccionada ha sido anulada del sistema",
				type: "success"
			  });
				</script>'; 
			}
	}

}
