<?php
	include ("./cone.php");  
	//verifica si hay sesiones iniciadas
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}

	//llamado al controlador de la factura
    require_once 'controladores/facturacionControlador.php';
	$factura = new Invoice();
	if (isset($_POST['invoice_btn'])) {
		$factura->actualizarFactura($_POST);
	}
?>

<div class="container content-invoice">
<?php	
					//variables para generar la url completa del sitio y obtener el id del registro
					$host= $_SERVER["HTTP_HOST"];
					$url= $_SERVER["REQUEST_URI"];
					$url_completa="http://" . $host . $url; 
					//variable que contiene el id de la compra a editar
					$id_act_pedido = explode('/',$url_completa)[5]; 
					
					//query para obtener los datos guardados en la tabla de compras
					//estos datos serán mostrados en la vista
					$query="SELECT * FROM TBL_pedidos where id_pedido='$id_act_pedido'";
					$resultado=mysqli_query($conexion,$query);

					if($resultado -> num_rows >0){
					while($fila=mysqli_fetch_array($resultado)){
							$numFactura=$fila['num_factura'];
							$sitioEntrega=$fila['sitio_entrega'];
							$fechaPedido=$fila['fech_pedido'];
							$fechaEntrega=$fila['fech_entrega'];
							$subtotal=$fila['sub_total'];
							$impuesto=$fila['ISV'];
							$Total=$fila['total'];
							$fechaFact=$fila['fech_facturacion'];
						}
					}

					//query para obtener el id del primer insumo de la compra
					//este dato será utilizado en un ciclo más abajo para poder obtener los id de todos los insumos
					$queryPrimerIdDetalle="SELECT id_detalle_pedido FROM TBL_detalle_pedido 
					where id_pedido='$id_act_pedido' LIMIT 1";
					$resultadoPrimerIdDetalle=mysqli_query($conexion,$queryPrimerIdDetalle);

					if($resultadoPrimerIdDetalle -> num_rows >0){
					while($filaPriDetalle=mysqli_fetch_array($resultadoPrimerIdDetalle)){
							//se obtiene el id del primer insumo comprado
							$id_act_detalle=$filaPriDetalle['id_detalle_pedido'];
						}
					}

					//query para obtener la cantidad de insumos que corresponden a la compra seleccionada para editar
					//el valor obtenido será utilizado en el ciclo de abajo como limite 
					$queryRegistrosDetalle="SELECT COUNT(*) as contador FROM TBL_detalle_pedido 
					where id_pedido='$id_act_pedido'";
					$resultadoDetalle=mysqli_query($conexion,$queryRegistrosDetalle);

					if($resultadoDetalle -> num_rows >0){
					while($filaDetalle=mysqli_fetch_array($resultadoDetalle)){
							$cantidadProductosVenta=$filaDetalle['contador'];
						}
					}
			?>
	<form action="" id="invoice-form" method="post" class="invoice-form" role="form" novalidate="">
		<div class="load-animate animated fadeInUp">
			<div class="row">
			<h3 class="text-left">
       			 <i class="fas fa-cart-plus"></i> &nbsp; EDITAR PEDIDO
    		</h3>
			</div>
			<br>
			<input id="currency" type="hidden" value="$">
			<div class="row">
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
					<div class="form-group">
						<label class="color-label">Cliente</label>
						<select class="form-control" name="cliente_pedido" id="cliente_pedido" >
						<option value="" selected="" disabled="">Seleccione una opción</option>
							<?php
							$SQL="SELECT * FROM TBL_Clientes";
								$dato = mysqli_query($conexion, $SQL);
					
								if($dato -> num_rows >0){
									while($fila=mysqli_fetch_array($dato)){
										echo '<option value='.$fila['id_clientes'].'>'.$fila['nom_cliente'].'</option>';
										}
									}
								?>
						</select>
					</div>	
					<div class="form-group">
						<label class="color-label">Num. Factura</label>
						<input type="text" class="form-control" name="num_factura" id="num_factura" maxlength="40" 
						style="text-transform:uppercase;" value="<?php echo $numFactura; ?>">
					</div>	
					<div class="form-group">
						<label class="color-label">Forma de Pago</label>
						<select class="form-control" name="forma_pago_venta" id="forma_pago_venta" >
						<option value="" selected="" disabled="">Seleccione una opción</option>
							<?php
							$SQL="SELECT * FROM TBL_forma_pago";
								$dato = mysqli_query($conexion, $SQL);
					
								if($dato -> num_rows >0){
									while($fila=mysqli_fetch_array($dato)){
										echo '<option value='.$fila['id_forma_pago'].'>'.$fila['forma_pago'].'</option>';
										}
									}
								?>
						</select>
					</div>	
				</div> 
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
					<div class="form-group">
						<label class="color-label">Sitio de Entrega</label>
						<input type="text" name="sitio_entrega" id="sitio_entrega" class="form-control" value="<?php echo $sitioEntrega; ?>" autocomplete="off">
					</div>	
					<div class="form-group">
						<label class="color-label">Estado de Pedido</label>
						<select class="form-control" name="estado_pedido" id="estado_pedido" >
						<option value="" selected="" disabled="">Seleccione una opción</option>
							<?php
							$SQL="SELECT * FROM TBL_estado_pedido";
								$dato = mysqli_query($conexion, $SQL);
					
								if($dato -> num_rows >0){
									while($fila=mysqli_fetch_array($dato)){
										echo '<option value='.$fila['id_estado_pedido'].'>'.$fila['estado_pedido'].'</option>';
										}
									}
								?>
						</select>
					</div>	
					<div class="form-group">
						<label class="color-label">Fecha</label>
						<?php $fcha = date("Y-m-d");?>
						<input type="date" class="form-control" name="fecha" id="fecha" value="<?php echo $fcha?>" disabled>
					</div>	
				</div>      		
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-3 pull-right">
					<div class="form-group">
						<label class="color-label">Fecha Pedido</label>
						<input type="date" class="form-control" name="fecha_pedido" id="fecha_pedido" value="<?php echo $fechaPedido; ?>">
					</div>
					<div class="form-group">
						<label class="color-label">Fecha Entrega</label>
						<input type="date" class="form-control" name="fecha_entrega" id="fecha_entrega" value="<?php echo $fechaEntrega; ?>">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
					<button class="btn btn-danger delete" id="removeRowsFactura" type="button">- Eliminar</button>
					<button class="btn btn-success" id="addRowsFactura" type="button">+ Agregar Más</button>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<table class="table table-bordered table-hover" id="invoiceItemFactura">
						<tr>
							<th width="2%"><input id="checkAllFactura" class="formcontrol" type="checkbox"></th>
							<th width="15%">No Detalle Pedido</th>
							<th width="19%">Producto</th>
							<th width="15%">Cantidad</th>
							<th width="15%">Precio</th>
							<th width="15%">Total</th>
						</tr>
						<?php
						//Ciclo para obtener todos los registros de la tabla TBL_detalle_compra usando el valor del primer id del detalle compra
						//este id aumentará en 1 con cada iteración del ciclo debido a que los registros del detalle_compra relacionados con una compra especifica
						//están en la tabla TBL_detalle_compra de forma seguida
						for ($i = 1; $i <=$cantidadProductosVenta; $i++) {

							//query para obtener los datos de TBL_detalle_compra
							//Estos datos se imprimirán en la tabla
							$queryDetalle="SELECT id_detalle_pedido, id_producto,cantidad,precio_venta
							FROM TBL_detalle_pedido where id_detalle_pedido='$id_act_detalle' LIMIT 1";
							$resultadoDetalle=mysqli_query($conexion,$queryDetalle);
							
							if($resultadoDetalle -> num_rows >0){
							while($filaDetalle=mysqli_fetch_array($resultadoDetalle)){
									$idProducto=$filaDetalle['id_producto'];
									$cantidad=$filaDetalle['cantidad'];
									$precio=$filaDetalle['precio_venta'];
								}
							} 
						?>
						<tr>
							<td><input class="itemRowFactura" type="checkbox"></td>
							<td><input type="text" name="productCode[]" id="productCode_<?php echo $count; ?>" class="form-control" value="<?php echo $id_act_detalle;?>" autocomplete="off"></td>
							<td><select name="nombreProducto[]" id="nombreProducto_<?php echo $i; ?>" class="form-control">
								<option value="" selected="" disabled="">Seleccione una opción</option>
									<?php
									$SQL="SELECT * FROM TBL_producto";
										$dato = mysqli_query($conexion, $SQL);
							
										if($dato -> num_rows >0){
											while($fila=mysqli_fetch_array($dato)){
												echo '<option value='.$fila["id_producto"].'>'.$fila['nom_producto'].'</option>';
												}
											}
										?>
							</select></td>
							<td><input type="number" name="cantidad[]" id="cantidad_<?php echo $i; ?>" value="<?php echo $cantidad;?>"class="form-control quantity" autocomplete="off"></td>
							<td><input type="number" name="precio[]" id="precio_<?php echo $i; ?>" value="<?php echo $precio;?>" class="form-control price" autocomplete="off"></td>
							<td><input type="number" name="total[]" id="total_<?php echo $i; ?>" value="<?php echo $precio*$cantidad; ?>" class="form-control total" autocomplete="off"></td>
						</tr>
						<div class="form-group">
								<!--datos enviados para realizar las actualizaciones en el controlador!-->
								<!--id_act_compra[] para realizar el primer query de actualizacion del pedido!-->
								<!--id_act_detallecompra[] para realizar el segundo query de actualizacion del detalle de pedido!-->
								<input type="hidden" value="<?php echo $id_act_pedido; ?>" class="form-control" 
								id="id_act_pedido_<?php echo $i; ?>" name="id_act_pedido[]">
								<input type="hidden" value="<?php echo $id_act_detalle; ?>" class="form-control" 
								id="id_act_detallepedido_<?php echo $i; ?>" name="id_act_detallepedido[]">
							</div>
						<?php 
						//después de traer un registro a la tabla el valor de $id_act_detalle aumenta en 1
						//para traer todos los registros relacionados con la compra
						$id_act_detalle+=1;
						}?>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
					
					<br>
					<div class="form-group">
						<input type="hidden" value="<?php echo $_SESSION['usuario_login']; ?>" class="form-control" name="userId">
						<input data-loading-text="Guardando factura..." type="submit" name="invoice_btn" value="Guardar factura" class="btn btn-success submit_btn invoice-save-btm">
					</div>

				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<span class="form-inline">
						<div class="form-group">
							<label class="color-label">Total: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input type="number" class="form-control" name="subTotal" id="subTotal" placeholder="Subtotal" value="<?php echo $subtotal; ?>">
							</div>
							<!-- Código para los demás cálculos de la factura como el impuesto y el cambio!-->
							</div>
							<div class="form-group">
							<label>Porcentaje Impuestos: &nbsp;</label>
							<div class="input-group">
								<input type="number" class="form-control" name="taxRate" id="taxRate" placeholder="Porcentaje Impuestos" >
								<div class="input-group-addon">%</div>
							</div>
						</div>
						<div class="form-group">
							<label>Monto impuestos: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input type="number" class="form-control" name="taxAmount" id="taxAmount" placeholder="Monto impuestos" value="<?php echo $impuesto; ?>">
							</div>
						</div>
						<div class="form-group">
							<label>Total: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input type="number" class="form-control" name="totalAftertax" id="totalAftertax" placeholder="Total" value="<?php echo $Total; ?>">
							</div>
						</div>
						<div class="form-group">
							<label>Monto Pagado: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input type="number" class="form-control" name="amountPaid" id="amountPaid" placeholder="Monto Pagado">
							</div>
						</div>
						<div class="form-group">
							<label>Cambio: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input type="number" class="form-control" name="amountDue" id="amountDue" placeholder="Cambio">
							</div>
						</div>
					</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</form>
</div>
</div>