<?php
	include ("./cone.php");  
	//verifica si hay sesiones iniciadas
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}

	//llamado al controlador de la factura
    require_once 'controladores/compraControlador.php';
	$factura = new Invoice();
	if (isset($_POST['invoice_btn'])) {
		$factura->actualizarFactura($_POST);
	}
?>
<br>

<div class="container content-invoice">
			<?php
					$host= $_SERVER["HTTP_HOST"];
					$url= $_SERVER["REQUEST_URI"];
					$url_completa="http://" . $host . $url; //variable con la url del sitio completa
					$id_editar = explode('/',$url_completa)[5]; 
					
					//query para obtener los datos guardados en la tabla de compras
					$query="SELECT * FROM TBL_compras where id_compra='$id_editar'";
					$resultado=mysqli_query($conexion,$query);

					if($resultado -> num_rows >0){
					while($fila=mysqli_fetch_array($resultado)){
							$idCompra=$fila['id_usuario'];
							$idUsuario=$fila['id_usuario'];
							$Fecha=$fila['fech_compra'];
						}
					}

					//query para obtener la cantidad de insumos relacionados a la venta
					//y el primer registro de estos para realizar un ciclo for más abajo
					$queryPrimerIdDetalle="SELECT id_detalle_compra FROM TBL_detalle_compra 
					where id_compra='$id_editar' LIMIT 1";
					$resultadoPrimerIdDetalle=mysqli_query($conexion,$queryPrimerIdDetalle);

					if($resultadoPrimerIdDetalle -> num_rows >0){
					while($filaPriDetalle=mysqli_fetch_array($resultadoPrimerIdDetalle)){
							$id_detalle=$filaPriDetalle['id_detalle_compra'];
						}
					}

					$queryRegistrosDetalle="SELECT COUNT(*) as contador FROM TBL_detalle_compra 
					where id_compra='$id_editar'";
					$resultadoDetalle=mysqli_query($conexion,$queryRegistrosDetalle);

					if($resultadoDetalle -> num_rows >0){
					while($filaDetalle=mysqli_fetch_array($resultadoDetalle)){
							$valor=$filaDetalle['contador'];
						}
					}
					echo $valor;

			?>
	<form action="" id="invoice-form" method="post" class="invoice-form" role="form" novalidate="">
		<div class="load-animate animated fadeInUp">
			<div class="row">
			<h3 class="text-left">
       			 <i class="fas fa-cart-plus"></i> &nbsp; AGREGAR NUEVA COMPRA
    		</h3>
			</div>
			<br>
			<input id="currency" type="hidden" value="$">
			<div class="row">
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<div class="form-group">
						<label class="color-label">Proveedor</label>
						<select class="form-control" name="proveedor_compra" id="proveedor_compra" required>
						<option value="<?php echo $idInsumo; ?>" selected="" disabled=""></option>
							<?php
							$SQL="SELECT * FROM TBL_Proveedores";
								$dato = mysqli_query($conexion, $SQL);
					
								if($dato -> num_rows >0){
									while($fila=mysqli_fetch_array($dato)){
										echo '<option value='.$fila['id_Proveedores'].'>'.$fila['nom_proveedor'].'</option>';
										}
									}
								?>
						</select>
					</div>	
					<div class="form-group">
						<label class="color-label">Usuario</label>
						<input type="text" class="form-control" name="usuario_compra" id="cliente_apellido" maxlength="40" 
						value="<?php echo $idUsuario; ?>" style="text-transform:uppercase;">
					</div>	
				</div>      		
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 pull-right">
					<div class="form-group">
						<label class="color-label">Estado de Compra</label>
						<select class="form-control" name="estado_compra" id="estado_compra" required>
						<option value="" selected="" disabled="">Seleccione una opción</option>
							<?php
							$SQL="SELECT * FROM TBL_estado_compras";
								$dato = mysqli_query($conexion, $SQL);
					
								if($dato -> num_rows >0){
									while($fila=mysqli_fetch_array($dato)){
										echo '<option value="'.$fila['id_estado_compra'].'">'.$fila['nom_estado_compra'].'</option>';
										}
									}
								?>
						</select>
					</div>
					<div class="form-group">
						<label class="color-label">Fecha</label>
						<?php $fcha = date("Y-m-d");?>
						<input type="date" class="form-control" name="fecha_compra" id="fecha_compra" value="<?php echo $Fecha;?>" >
					</div>
					
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
					<button class="btn btn-danger delete" id="removeRows" type="button">- Eliminar</button>
					<button class="btn btn-success" id="addRows" type="button">+ Agregar Más</button>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<table class="table table-bordered table-hover" id="invoiceItem">
						<tr>
							<th width="2%"><input id="checkAll" class="formcontrol" type="checkbox"></th>
							<th width="15%">No Compra</th>
							<th width="19%">Insumo</th>
							<th width="19%">Fecha de caducidad</th>
							<th width="15%">Cantidad</th>
							<th width="15%">Precio</th>
							<th width="15%">Total</th>
						</tr>
						<?php
						for ($i = 1; $i <=$valor; $i++) {
							$queryDetalle="SELECT id_detalle_compra, id_insumos,cantidad_comprada,precio_costo,fecha_caducidad
							FROM TBL_detalle_compra where id_detalle_compra='$id_detalle' LIMIT 1";
							$resultadoDetalle=mysqli_query($conexion,$queryDetalle);
		
							if($resultadoDetalle -> num_rows >0){
							while($filaDetalle=mysqli_fetch_array($resultadoDetalle)){
									$idInsumo=$filaDetalle['id_insumos'];
									$cantidad=$filaDetalle['cantidad_comprada'];
									$precio=$filaDetalle['precio_costo'];
									$fechaCad=$filaDetalle['fecha_caducidad'];
								}
							} 
						?>
						<tr>
							<td><input class="itemRow" type="checkbox"></td>
							<td><input type="text" name="productCode[]" id="productCode_<?php echo $count; ?>" class="form-control" value="<?php echo $id_editar;?>" autocomplete="off"></td>
							<td><select name="productName[]" id="productName_<?php echo $count; ?>" class="form-control">
								<option value="" selected="" disabled="">Seleccione una opción</option>
									<?php
									$SQL="SELECT * FROM TBL_insumos";
										$dato = mysqli_query($conexion, $SQL);
							
										if($dato -> num_rows >0){
											while($fila=mysqli_fetch_array($dato)){
												echo '<option value='.$fila["id_insumos"].'>'.$fila['nom_insumo'].'</option>';
												}
											}
										?>
							</select></td>
							<td><input type="date" name="fechaCaducidad[]" id="fechaCaducidad_<?php echo $i; ?>" class="form-control" value="<?php echo $fechaCad; ?>" autocomplete="off"></td>
							<td><input type="number" name="quantity[]" id="quantity_<?php echo $i; ?>" class="form-control quantity" value="<?php echo $cantidad; ?>" autocomplete="off"></td>
							<td><input type="number" name="price[]" id="price_<?php echo $i; ?>" class="form-control price" value="<?php echo $precio; ?>" autocomplete="off"></td>
							<td><input type="number" name="total[]" id="total_<?php echo $i; ?>" class="form-control total" value="<?php echo $precio*$cantidad; ?>"autocomplete="off"  onchange="sumar(this.value);"></td>
						</tr>
						<?php 
						$id_detalle+=1;
						}?>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
					
					<br>
					<div class="form-group">
						<input type="hidden" value="<?php echo $id_editar; ?>" class="form-control" id="id_actualizacion" name="id_actualizacion">
						<input data-loading-text="Guardando factura..." type="submit" name="invoice_btn" value="Guardar Compra" 
						class="btn btn-success submit_btn invoice-save-btm" style="font-size:20px; border: 2px solid #777574;">
					</div>

				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<span class="form-inline">
						<div class="form-group">
							<label class="color-label">Total: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input value="" type="number" class="form-control" name="subTotal" id="subTotal">
							</div>
							<!-- Código para los demás cálculos de la factura como el impuesto y el cambio!-->

							<!-- <div class="form-group">
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
								<div class="input-group-addon currency">$</div>
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
						</div> -->
					</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</form>
</div>
</div>

<script>
	function sumar (valor) {
    var total = 0;	
    valor = parseInt(valor); // Convertir el valor a un entero (número).
	
    total = document.getElementById('subTotal');
	
    // Aquí valido si hay un valor previo, si no hay datos, le pongo un cero "0".
    total = (total == null || total == undefined || total == "") ? 0 : total;
	
    /* Esta es la suma. */
    total = (parseInt(total) + parseInt(valor));
	
    // Colocar el resultado de la suma en el control "span".
    document.getElementById('subTotal') = total;
}
</script>