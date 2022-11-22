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
					$permiso_act=$fila['permiso_actualizacion'];
				}
			}

			//valida si el query anterior no retornó ningún valor
			//en este caso no había un permiso registrado del objeto para el rol del usuario conectado
			if(!isset($permiso_act)){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene acceso autorizado a esta vista</div>';
				echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
			//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
			}else if($permiso_act==0){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene acceso autorizado a esta vista</div>';
				echo "<script> window.location.href='".SERVERURL."compra-list/'; </script>";
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
					//variables para generar la url completa del sitio y obtener el id del registro
					$host= $_SERVER["HTTP_HOST"];
					$url= $_SERVER["REQUEST_URI"];
					$url_completa="http://" . $host . $url; 
					//variable que contiene el id de la compra a editar
					$id_act_compra = explode('/',$url_completa)[5]; 
					
					//query para obtener los datos guardados en la tabla de compras
					//estos datos serán mostrados en la vista
					$query="SELECT * FROM TBL_compras where id_compra='$id_act_compra'";
					$resultado=mysqli_query($conexion,$query);

					if($resultado -> num_rows >0){
					while($fila=mysqli_fetch_array($resultado)){
							$idCompra=$fila['id_usuario'];
							$idUsuario=$fila['id_usuario'];
							$Fecha=$fila['fech_compra'];
							$Total=$fila['total_compra'];
						}
					}

					//query para obtener el id del primer insumo de la compra
					//este dato será utilizado en un ciclo más abajo para poder obtener los id de todos los insumos
					$queryPrimerIdDetalle="SELECT id_detalle_compra FROM TBL_detalle_compra 
					where id_compra='$id_act_compra' LIMIT 1";
					$resultadoPrimerIdDetalle=mysqli_query($conexion,$queryPrimerIdDetalle);

					if($resultadoPrimerIdDetalle -> num_rows >0){
					while($filaPriDetalle=mysqli_fetch_array($resultadoPrimerIdDetalle)){
							//se obtiene el id del primer insumo comprado
							$id_act_detalle=$filaPriDetalle['id_detalle_compra'];
						}
					}

					//query para obtener la cantidad de insumos que corresponden a la compra seleccionada para editar
					//el valor obtenido será utilizado en el ciclo de abajo como limite 
					$queryRegistrosDetalle="SELECT COUNT(*) as contador FROM TBL_detalle_compra 
					where id_compra='$id_act_compra'";
					$resultadoDetalle=mysqli_query($conexion,$queryRegistrosDetalle);

					if($resultadoDetalle -> num_rows >0){
					while($filaDetalle=mysqli_fetch_array($resultadoDetalle)){
							$cantidadInsumosCompra=$filaDetalle['contador'];
						}
					}
			?>
	<form action="" id="invoice-form" method="post" class="invoice-form" role="form" data-form="save" novalidate="">
		<div class="load-animate animated fadeInUp">
			<div class="row">
			<h3 class="text-left">
       			 <i class="fas fa-cart-plus"></i> &nbsp; EDITAR NUEVA COMPRA
    		</h3>
			</div>
			<br>
			<input id="currency" type="hidden" value="$">
			<div class="row">
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<div class="form-group">
						<label class="color-label">Proveedor</label>
						<select class="form-control" name="proveedor_compra" id="proveedor_compra" required >
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
						//Ciclo para obtener todos los registros de la tabla TBL_detalle_compra usando el valor del primer id del detalle compra
						//este id aumentará en 1 con cada iteración del ciclo debido a que los registros del detalle_compra relacionados con una compra especifica
						//están en la tabla TBL_detalle_compra de forma seguida
						for ($i = 1; $i <=$cantidadInsumosCompra; $i++) {

							//query para obtener los datos de TBL_detalle_compra
							//Estos datos se imprimirán en la tabla
							$queryDetalle="SELECT id_detalle_compra, id_insumos,cantidad_comprada,precio_costo,fecha_caducidad
							FROM TBL_detalle_compra where id_detalle_compra='$id_act_detalle' LIMIT 1";
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
							<td><input type="text" name="productCode[]" id="productCode_<?php echo $count; ?>" class="form-control" value="<?php echo $id_act_detalle;?>" autocomplete="off"></td>
							<td><select name="productName[]" id="productName_<?php echo $count; ?>" class="form-control">
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
							<!-- <td><input type="number" name="id_act_compra[]" id="id_act_compra_<?php echo $i; ?>" class="form-control total" value="<?php echo $id_act_compra; ?>" autocomplete="off"  onchange="sumar(this.value);"></td>
						    <td><input type="number" name="id_act_detallecompra[]" id="id_act_detallecompra_<?php echo $i; ?>" class="form-control total" value="<?php echo $id_act_detalle; ?>" autocomplete="off"  onchange="sumar(this.value);"></td> -->
						</tr>
							<div class="form-group">
								<!--datos enviados para realizar las actualizaciones en el controlador!-->
								<!--id_act_compra[] para realizar el primer query de actualizacion de la compra!-->
								<!--id_act_detallecompra[] para realizar el segundo query de actualizacion del detalle de compra!-->
								<input type="hidden" value="<?php echo $id_act_compra; ?>" class="form-control" 
								id="id_act_compra_<?php echo $i; ?>" name="id_act_compra[]">
								<input type="hidden" value="<?php echo $id_act_detalle; ?>" class="form-control" 
								id="id_act_detallecompra_<?php echo $i; ?>" name="id_act_detallecompra[]">
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
								<input value="" type="number" class="form-control" name="subTotal" value="<?php echo $Total; ?>" id="subTotal">
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