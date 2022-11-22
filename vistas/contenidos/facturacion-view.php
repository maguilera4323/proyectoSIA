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
		$factura->nuevaFactura($_POST);
	}
?>

<div class="container content-invoice">
	<form action="" id="invoice-form" method="post" class="invoice-form" role="form" novalidate="">
		<div class="load-animate animated fadeInUp">
			<div class="row">
			<h3 class="text-left">
       			 <i class="fas fa-cart-plus"></i> &nbsp; AGREGAR NUEVO PEDIDO
    		</h3>
			</div>
			<?php
				$SQL="SELECT * FROM TBL_pedidos";
				$dato = mysqli_query($conexion, $SQL);
					
				if($dato -> num_rows >0){
					while($fila=mysqli_fetch_array($dato)){
						$ultimoIdPedido=$fila['id_pedido'];
					}
				}
				$idPedidoActual=$ultimoIdPedido+1;
			?>
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
						style="text-transform:uppercase;">
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
						<input type="text" name="sitio_entrega" id="sitio_entrega" class="form-control" autocomplete="off">
					    <input type="hidden" name="numPedido" id="numPedido" class="form-control" value="<?php echo $idPedidoActual; ?>" autocomplete="off">
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
						<input type="date" class="form-control" name="fecha_pedido" id="fecha_pedido">
					</div>
					<div class="form-group">
						<label class="color-label">Fecha Entrega</label>
						<input type="date" class="form-control" name="fecha_entrega" id="fecha_entrega">
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
							<th width="19%">Producto</th>
							<th width="15%">Cantidad</th>
							<th width="15%">Precio</th>
							<th width="15%">Total</th>
						</tr>
						<tr>
							<td><input class="itemRowFactura" type="checkbox"></td>
							<td><select name="nombreProducto[]" id="nombreProducto_1" class="form-control">
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
							<td><input type="number" name="cantidad[]" id="cantidad_1" class="form-control quantity" autocomplete="off"></td>
							<td><input type="number" name="precio[]" id="precio_1" class="form-control price" autocomplete="off"></td>
							<td><input type="number" name="total[]" id="total_1" class="form-control total" autocomplete="off"></td>
						</tr>
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
								<input value="" type="number" class="form-control" name="subTotal" id="subTotal" placeholder="Subtotal">
							</div>
							<!-- Código para los demás cálculos de la factura como el impuesto y el cambio!-->
							</div>
							<div class="form-group">
							<label>Porcentaje Impuestos: &nbsp;</label>
							<div class="input-group">
								<input value="" type="number" class="form-control" name="taxRate" id="taxRate" placeholder="Porcentaje Impuestos">
								<div class="input-group-addon">%</div>
							</div>
						</div>
						<div class="form-group">
							<label>Monto impuestos: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input value="" type="number" class="form-control" name="taxAmount" id="taxAmount" placeholder="Monto impuestos">
							</div>
						</div>
						<div class="form-group">
							<label>Total: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input value="" type="number" class="form-control" name="totalAftertax" id="totalAftertax" placeholder="Total">
							</div>
						</div>
						<div class="form-group">
							<label>Monto Pagado: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input value="" type="number" class="form-control" name="amountPaid" id="amountPaid" placeholder="Monto Pagado">
							</div>
						</div>
						<div class="form-group">
							<label>Cambio: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input value="" type="number" class="form-control" name="amountDue" id="amountDue" placeholder="Cambio">
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