<?php
	include ("./cone.php");  
	//verifica si hay sesiones iniciadas
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT * FROM TBL_permisos where id_rol='$id_rol' and id_objeto=12";
			$dato = mysqli_query($conexion, $SQL);

			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
					$permiso_ins=$fila['permiso_insercion'];
				}
			}

			//valida si el query anterior no retornó ningún valor
			//en este caso no había un permiso registrado del objeto para el rol del usuario conectado
			if(!isset($permiso_ins)){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene acceso autorizado a esta vista</div>';
				echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
			//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
			}else if($permiso_ins==0){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene acceso autorizado a esta vista</div>';
				echo "<script> window.location.href='".SERVERURL."compra-list/'; </script>";
			}

	//llamado al controlador de la factura
     require_once 'controladores/compraControlador.php';
	$factura = new Invoice();
	if (isset($_POST['invoice_btn'])) {
		$factura->nuevaFactura($_POST);
	} 
?>
<br>

<div class="container content-invoice">
	<form action="" id="invoice-form" method="post" class="invoice-form" data-form="save">
		<div class="load-animate animated fadeInUp">
			<div class="row">
			<h3 class="text-left">
       			 <i class="fas fa-cart-plus"></i> &nbsp; AGREGAR NUEVA COMPRA
    		</h3>
			</div>
			</div>
			<?php
				$SQL="SELECT * FROM TBL_compras";
				$dato = mysqli_query($conexion, $SQL);
					
				if($dato -> num_rows >0){
					while($fila=mysqli_fetch_array($dato)){
						$ultimoIdCompra=$fila['id_compra'];
					}
					$idCompraActual=$ultimoIdCompra+1;
				}else{
					$idCompraActual=1;
				}
				
			?>
			<br>
			<br>
			<input id="currency" type="hidden" value="$">
			<div class="row">
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<div class="form-group">
						<label class="color-label">Proveedor</label>
						<select class="form-control" name="proveedor_compra" id="proveedor_compra" required>
						<option value="" selected="" disabled="">Seleccione una opción</option>
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
						<input type="hidden" name="productCode" id="productCode" class="form-control" value="<?php echo $idCompraActual; ?>" autocomplete="off">
						<input type="text" class="form-control" name="usuario_compra" id="cliente_apellido" maxlength="40" 
						value="<?php echo $_SESSION['usuario_login']; ?>" style="text-transform:uppercase;" disabled>
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
						<input type="date" class="form-control" name="fecha_compra" id="fecha_compra" value="<?php echo $fcha?>" disabled>
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
							<th width="19%">Insumo</th>
							<th width="19%">Fecha de caducidad</th>
							<th width="15%">Cantidad</th>
							<th width="15%">Precio</th>
							<th width="15%">Total</th>
						</tr>
						<tr>
							<td><input class="itemRow" type="checkbox"></td>
							<td><select name="productName[]" id="productName_1" class="form-control">
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
							<td><input type="date" name="fechaCaducidad[]" id="fechaCaducidad_1" class="form-control" autocomplete="off"></td>
							<td><input type="number" name="quantity[]" id="quantity_1" class="form-control quantity" autocomplete="off"></td>
							<td><input type="number" name="price[]" id="price_1" class="form-control price" autocomplete="off"></td>
							<td><input type="number" name="totales[]" id="totales_1" class="form-control total" autocomplete="off"></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
					
					<br>
					<div class="form-group">
						<input type="hidden" value="<?php echo $_SESSION['usuario_login']; ?>" class="form-control" name="userId">
						<input type="submit" name="invoice_btn" value="Guardar Compra" 
						class="btn btn-success submit_btn invoice-save-btm" style="font-size:20px; border: 2px solid #777574;">
						<a href="<?php echo SERVERURL; ?>compra-list/"><input value="salir" 
						class="btn btn-success submit_btn invoice-save-btm" style="font-size:20px; border: 2px solid #777574;"></a>
					</div>

				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<span class="form-inline">
						<div class="form-group">
							<label class="color-label">Total: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input value="" type="number" class="form-control" name="subTotal" step="any" id="subTotal">
							</div>
					</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</form>
</div>
</div>