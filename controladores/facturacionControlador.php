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
	private $pedidos_descuento = 'TBL_pedido_descuentos';
	private $parametros = 'TBL_ms_parametros';
	private $promocion_pedido = 'TBL_pedidos_promociones';
	private $promocion_producto = 'TBL_promociones_productos';
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
		
			//query para obtener el valor del parametro del impuesto sobre ventas
		$sqlValorISV = " 
			SELECT valor FROM " . $this->parametros . " WHERE id_parametro=17";
			$query=mysqli_query($this->dbConnect,$sqlValorISV);
				if (!$query) {
					die('Error in query');
				}

				//se guarda el valor del ISV en una variable
				while ($fila = $query->fetch_assoc()) {
					$isv=$fila['valor'];
				}	
		

		//Insert para la tabla de Pedidos
		$sqlInsert = "
			INSERT INTO " . $this->datosPedido . "(num_factura, fech_pedido,  fech_entrega, sitio_entrega, id_estado_pedido, sub_total, ISV, total, id_forma_pago, fech_facturacion,porcentaje_isv) 
			VALUES ('" . $POST['num_factura'] . "', '" . $POST['fecha_pedido'] . "', '" . $POST['fecha_entrega'] . "','" . $POST['sitio_entrega'] . "',
			'" . $POST['estado_pedido'] . "', '" . $POST['subTotal'] . "','" . $POST['taxAmount'] . "','" . $POST['totalAftertax'] . "','" . $POST['forma_pago_venta'] . "', now(),'" . $isv . "'/100 )";
		mysqli_query($this->dbConnect, $sqlInsert);
		$lastInsertId = mysqli_insert_id($this->dbConnect);
		

		//validacion de si se seleccionó un descuento para el pedido
		//se hace un insert y se guarda en la tabla de Pedidos_descuentos
		if(($POST['montodescuento'])!=''){
			$sqlInsertDesc = "
				INSERT INTO " . $this->pedidos_descuento . "(id_descuentos, id_pedidos, total_descontado) 
				VALUES ('" . $POST['nombredescuento_1'] . "', '" . $POST['numPedido'] . "', '" . $POST['subTotal']-$POST['montodescuento'] . "' )";
			mysqli_query($this->dbConnect, $sqlInsertDesc);
		}
		

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
		} 


		if(isset($POST['nombrePromocion'])){
			//Tercer insert, para la tabla de Pedido Promociones
			//el ciclo es para insertar todos los promociones agregados a un producto especifico
			for ($j = 0; $j < count($POST['nombrePromocion']); $j++) {
				$sqlInsertPromocion = "
				INSERT INTO " . $this->promocion_pedido . "(id_promocion, id_pedido, cantidad, precio_venta) 
				VALUES ( '" . $POST['nombrePromocion'][$j] . "', '" . $POST['numPedido'] . "','" . $POST['cantidadpromo'][$j] . "','" . $POST['preciopromo'][$j] . "')";
				mysqli_query($this->dbConnect, $sqlInsertPromocion);  
			} 
		}


		//mensaje de alerta confirmando que la venta ha sido exitosa
		if (isset($lastInsertId)=='true'){
			echo '<script>
			swal.fire({
			title: "Pedido Realizado",
			text: "Su pedido ha sido realizado exitosamente",
			type: "success"
		  }).then(function() {
			  window.location.href = "../facturacion-list";
		  })
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
		//primer update, para la tabla de Pedidos
		//se valida si se ha enviado el id de un producto
		if ($POST['nombreProducto']) {
			for ($i = 0; $i <1; $i++) {
			$sqlUpdate = "
				UPDATE " . $this->datosPedido . " 
				SET id_cliente = '" . $POST['cliente_pedido'] . "', fech_pedido = '" . $POST['fecha_pedido'] . "', 
				fech_entrega = '" . $POST['fecha_entrega'] . "', sitio_entrega = '" . $POST['sitio_entrega'] . "', id_estado_pedido = '" . $POST['estado_pedido'] . "',
				sub_total = '" . $POST['subTotal'] . "', ISV = '" . $POST['taxAmount'] . "', total = '" . $POST['totalAftertax'] . "',
				fech_facturacion = now() WHERE id_pedido = '" . $POST['id_act_pedido'][$i] . "' ";
			mysqli_query($this->dbConnect, $sqlUpdate);
		}


		//segundo update, para la tabla de DetallePedidos
		//el ciclo for para actualizar los productos agregados a la venta
			for ($i = 0; $i < count($POST['nombreProducto']); $i++) {
				 $sqlUpdateItem = "
				UPDATE " . $this->datosDetallePedido . "
				SET id_pedido = '" . $POST['id_act_pedido'][$i] . "', id_producto= '" . $POST['nombreProducto'][$i] . "', cantidad = '" . $POST['cantidad'][$i] . "', precio_venta = '" . $POST['precio'][$i] . "' 
					WHERE id_detalle_pedido = '" . $POST['id_act_detallepedido'][$i] . "' ";
				mysqli_query($this->dbConnect, $sqlUpdateItem); 


				//validación para revisar si el estado del pedido es Realizado
				//de ser afirmativo se procede a restar insumos del inventario segun los datos del recetario
				//y a registrar las salidas de inventario en Movimientos de Inventario
				//este codigo se enfoca a realizar los registros del inventario y movimientos de los productos
			if($POST['estado_pedido']==2){
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
					$cantidad_insumo[$cont]=$row['cant_insumo'];
					$cont++;
				}																																																											
			
				//ciclo que se encarga de actualizar el inventario, restando los insumos consumidos por cada producto
				//y de insertar en la tabla de movimientos de inventario la cantidad de insumos usados y el tipo de movimiento
				for($j=0;$j<$cont;$j++){
					$sqlUpdateInventario = "
						UPDATE " . $this->inventario . " 
						SET cant_existencia = cant_existencia - '" . $cantidad_insumo[$j]*$POST['cantidad'][$i] . "' 
						WHERE id_insumo = '" . $id_insumo[$j] . "' ";
					mysqli_query($this->dbConnect, $sqlUpdateInventario);

					$sqlInsertMoviInventario = "
					INSERT INTO " . $this->movi_inv . "(id_insumos, cant_movimiento, tipo_movimiento, fecha_movimiento,id_usuario,comentario) 
					VALUES ('" . $id_insumo[$j] . "', '" . $cantidad_insumo[$j]*$POST['cantidad'][$i] . "', 2, now(),'" . $_SESSION['id_login'] . "','Salida de insumos por producto')";
					mysqli_query($this->dbConnect, $sqlInsertMoviInventario);
				}
			} 

		}


		if(isset($POST['idPromocion'])){
		//segundo update, para la tabla de PedidosPromociones
		//el ciclo for para actualizar las promociones agregadas a la venta
		for ($i = 0; $i < count($POST['idPromocion']); $i++) {
			$sqlUpdateItem = "
		   UPDATE " . $this->promocion_pedido . "
		   SET cantidad = '" . $POST['cantidadpromo'][$i] . "', precio_venta= '" . $POST['preciopromo'][$i] . "' 
			   WHERE id_pedido_promocion = '" . $POST['id_prom_detalleprom'][$i] . "' ";
		   mysqli_query($this->dbConnect, $sqlUpdateItem);


		   	//validación para revisar si el estado del pedido es Realizado
				//de ser afirmativo se procede a restar insumos del inventario segun los datos del recetario
				//y a registrar las salidas de inventario en Movimientos de Inventario
				//este codigo se enfoca a realizar los registros del inventario y movimientos de las promociones
			if($POST['estado_pedido']==2){
				//select para obtener los datos de los productos que componen la promocion y sus cantidades
				$sqlSelectPromProductos = " 
				SELECT * FROM " . $this->promocion_producto . " WHERE id_promociones='" . $POST['idPromocion'][$i] . "'";
				$query=mysqli_query($this->dbConnect,$sqlSelectPromProductos);
					if (!$query) {
						die('Error in query');
					}
	
					//se crea un arreglo para recibir todos los productos y las respectivas cantidades de los mismos
					$id_producto = array();
					$cant_producto= array();
					$cont = 0;
					while ($row = $query->fetch_assoc()) {
						$id_producto[$cont]=$row['id_producto'];
						$cant_producto[$cont]=$row['cantidad'];
						$cont++;
					}	

				
				//query para obtener las cantidades de insumos usadas por los productos de la promoción
				//usando como parametro $id_producto, con el id de los productos obtenidos anteriormente
			$sqlSelectRecetario = " 
			SELECT * FROM " . $this->recetario . " WHERE id_producto='" . $id_producto[$i] . "'";
			$query=mysqli_query($this->dbConnect,$sqlSelectRecetario);
				if (!$query) {
					die('Error in query');
				}

				//se crea un arreglo para recibir todos los insumos y las respectivas cantidades de los mismos
				$id_insumo = array();
				$cantidad_insumo= array();
				$cont = 0;
				while ($row = $query->fetch_assoc()) {
					$id_insumo[$cont]=$row['id_insumo'];
					$cantidad_insumo[$cont]=$row['cant_insumo'];
					$cont++;
				}																																																											
			
				//ciclo que se encarga de actualizar el inventario, restando los insumos consumidos por cada producto
				//y de insertar en la tabla de movimientos de inventario la cantidad de insumos usados y el tipo de movimiento
				//en estos dos querys se usan tres variables cantidad
				//$cantidad_insumo es el valor obtenido del recetario
				//$cantidad_producto el valor obtenido de TBL_promociones_productos
				//cantidad_promo es el valor de la cantidad de promociones vendidas, recibido de facturacion-update
				for($j=0;$j<$cont;$j++){
					$sqlUpdateInventario = "
						UPDATE " . $this->inventario . " 
						SET cant_existencia = cant_existencia - '" . ($cantidad_insumo[$j]*$POST['cantidadpromo'][$i])*$cant_producto[$i] . "' 
						WHERE id_insumo = '" . $id_insumo[$j] . "' ";
					mysqli_query($this->dbConnect, $sqlUpdateInventario);

					$sqlInsertMoviInventario = "
					INSERT INTO " . $this->movi_inv . "(id_insumos, cant_movimiento, tipo_movimiento, fecha_movimiento,id_usuario,comentario) 
					VALUES ('" . $id_insumo[$j] . "', '" . ($cantidad_insumo[$j]*$POST['cantidadpromo'][$i])*$cant_producto[$i] . "', 2, now(),'" . $_SESSION['id_login'] . "','Salida de insumos por promoción')";
					mysqli_query($this->dbConnect, $sqlInsertMoviInventario);
				}
			} 
		}
	}
}

	//mensaje de alerta indicando que la venta fue actualizada exitosamente
		if (isset($sqlUpdateItem)=='true'){
			echo '<script>
			swal.fire({
			title: "Pedido Actualizado",
			text: "Su pedido ha sido actualizado exitosamente",
			type: "success"
		  }).then(function() {
			  window.location.href = "../facturacion-list";
		  })
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





	public function anularPedido($POST)
	{
		//query que actualiza el estado del pedido a Anulado
		$sqlUpdateEstadoPedido = "
		UPDATE " . $this->datosPedido . " 
		SET id_estado_pedido = 3 WHERE id_pedido = '" . $POST['id_pedido_del'] . "' ";
		mysqli_query($this->dbConnect, $sqlUpdateEstadoPedido);


		//mensaje de alerta que muestra que una factura fue anulada de forma exitosa
		if (isset($sqlUpdateEstadoPedido)=='true'){
			echo '<script>
			swal.fire({
			title: "Pedido Anulado",
			text: "El pedido seleccionado ha sido anulado del sistema",
			type: "success"
		  });
			</script>'; 
		}
	}
	
}
