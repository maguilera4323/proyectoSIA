<?php
	include ("./cone.php");  
	//verifica si hay sesiones iniciadas
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT * FROM TBL_permisos where id_rol='$id_rol' and id_objeto=16";
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
				echo "<script> window.location.href='".SERVERURL."facturacion-list/'; </script>";
			}

	//llamado al controlador de la factura
    require_once 'controladores/facturacionControlador.php';
	$factura = new Invoice();
	if (isset($_POST['invoice_btn'])) {
		$factura->nuevaFactura($_POST);
	}
?>
<script>
	function solonumeros(e)
	{
		key=e.keyCode || e.which;
		teclado=String.fromCharCode(key);
		numeros="0123456789";
		
		especiales="8-37-38-46";
		teclado_especial=false;
		for(var i in especiales){
			if(key==especiales[i]){
				teclado_especial=true;
			}
		}
		if(numeros.indexOf(teclado)==-1 && !teclado_especial){
			return false;
		}
	}
</script>
<script>
	function sololetras(e)
	{
		key=e.keyCode || e.which;
		teclado=String.fromCharCode(key);
		letras="abcdefghijklmnñopqrstuvwxyz";		
		especiales="";
		teclado_especial=false;
		for(var i in especiales){
			if(key==especiales[i]){
				teclado_especial=true;
			}
		}
		if(letras.indexOf(teclado)==-1 && !teclado_especial){
			return false;
		}
	}
</script>

<div class="container content-invoice">
	<form action="" id="invoice-form" method="post" class="invoice-form">
		<div class="load-animate animated fadeInUp">
			<div class="row">
			<h3 class="text-left">
       			 <i class="fas fa-cart-plus"></i> &nbsp; AGREGAR NUEVO PEDIDO
    		</h3>
			</div>
			<?php
				$SQL="SELECT * FROM TBL_pedidos";
				$dato = mysqli_query($conexion, $SQL);
				
				//Validacion para obtener el id del pedido que estamos realizando
				if($dato -> num_rows >0){
					while($fila=mysqli_fetch_array($dato)){
						$ultimoIdPedido=$fila['id_pedido'];
					}
					$idPedidoActual=$ultimoIdPedido+1;
				}else{
					$idPedidoActual=1;
				}

				//query de la tabla del talonario
				//se obtienen los datos del valor inicial, valor actual y valor final del talonario
				$SQL="SELECT * FROM TBL_talonario_cai";
				$dato = mysqli_query($conexion, $SQL);
					
				if($dato -> num_rows >0){
					while($fila=mysqli_fetch_array($dato)){
						$rango_inicial=$fila['rango_inicial'];
						$numFacturaAnterior=$fila['cai_actual'];
						$rango_final=$fila['rango_final'];
					}
				}
				
				//validacion para verificar si ya se han registrado facturas con codigo CAI
				if($numFacturaAnterior!=''){
					//se extraen los primeros 11 caracteres del codigo de factura con la funcion substr
					//usando la funcion substr, el parametro 0 es para indicar que se deben tomar desde el incio de la cadena
					//el parametro -8 es para obviar los ultimos 8 caracteres
					$cadenaPrimerosCaracteres=substr($numFacturaAnterior,0,-8);

					//se extrae el rango de facturacion con la funcion substr
					//como parametro se usa el 11 para indicar que comience a tomar caracteres desde el caracter 12
					//se usa la funcion intval para convertir la cadena extraida a numero
					//se suma 1 para obtener el valor de la factura actual
					$numFactura=intval(substr($numFacturaAnterior,11))+1;

					//se usa la funcion str_pad para reconvertir el numero de la factura actual a una cadena del rango de facturacion
					//el parametro 8 es para indicar el tamaño del rango del numero de la factura, que son 8 digitos(00000000)
					//debido a que el numero obtenido en $numFactura será menor a 8 digitos se ingresa un caracter para rellenar los espacios sobrantes
					//Los espacios sobrantes a la izquierda se rellenan con ceros (parametro 0 de la funcion)
					$cadenaRangoFactura=str_pad($numFactura, 8, "0", STR_PAD_LEFT);

					//se une la cadena actual de la factura con los 11 primeros caracteres para obtener el numero de factura completo
					$numFacturaActual=$cadenaPrimerosCaracteres.$cadenaRangoFactura;

					//Si es la primera factura que se realiza, esta tomara el valor del valor inicial del talonario
				}else{
					$numFacturaActual=$rango_inicial;
				}
				
				
			?>
			<br>
			<input id="currency" type="hidden" value="$">
			<div class="row">
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
					<div class="form-group">
						<label class="color-label">DNI</label>
						<input type="text" value="<?php print "0000000000000";?>" class="form-control"  name="dni_pedido" id="dni_pedido" maxlength="13" 
						onkeypress="return solonumeros (event)" onChange="cambioTextBox1()">
						
						<!-- ESTE SIRVE PARA BLOQUEAR LA CAJA DE TEXTO DE NOMBRE DE CLIENTE SIEMPRE Y CUANDO SE CUMPLA LA CONDICION DE 
						LOS 13 CEROS -->
						<script>
						cambioTextBox1 = function() {
						var textbox1 = document.getElementById("dni_pedido");
						var textbox2 = document.getElementById("cliente_pedido");
						
						var valorTextBox1 = textbox1.value;
						
						if(
							valorTextBox1 == "0000000000000" 
						) {
							textbox2.disabled = true;
						} else {
							textbox2.disabled = false;
						}
						}
						</script>
					</div>	
					<div class="form-group">
						<label class="color-label">Num. Factura</label>
						<input type="text" class="form-control" value="<?php echo $numFacturaActual;?>"   
						style="text-transform:uppercase;"  disabled>
						<input type="hidden" value="<?php echo $numFacturaActual;?>" class="form-control" id="num_factura" name="num_factura">
					</div>	
					<div class="form-group">
						<label class="color-label">Forma de Pago</label>
						<select class="form-control" name="forma_pago_venta" id="forma_pago_venta" required>
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
						<label class="color-label">Cliente</label>
						<input type="text" placeholder="Ingrese nombre de cliente" name="cliente_pedido" id="cliente_pedido" class="form-control" 
						value="<?php print "Consumidor Final";?>" autocomplete="off">
					</div>
					<div class="form-group">
						<label class="color-label">Sitio de Entrega</label>
						<input type="text" placeholder="Ingrese dirección" name="sitio_entrega" id="sitio_entrega" class="form-control" autocomplete="off" required>
					    <input type="hidden" name="numPedido" id="numPedido" class="form-control" value="<?php echo $idPedidoActual; ?>" autocomplete="off">
					</div>			

					<div class="form-group">
						<label class="color-label">Estado de Pedido</label>
						<select class="form-control" name="estado_pedido" id="estado_pedido">
							<?php
							$SQL="SELECT * FROM TBL_estado_pedido LIMIT 1";
								$dato = mysqli_query($conexion, $SQL);
					
								if($dato -> num_rows >0){
									while($fila=mysqli_fetch_array($dato)){
										echo '<option value='.$fila['id_estado_pedido'].' selected>'.$fila['estado_pedido'].'</option>';
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
						<input type="date" class="form-control" name="fecha_pedido" id="fecha_pedido" required>
					</div>
					<div class="form-group">
						<label class="color-label">Fecha Entrega</label>
						<input type="date" class="form-control" name="fecha_entrega" id="fecha_entrega" required>
					</div>
					<div class="form-group">
					<label class="color-label">Descuento</label>
					<td><select name="nombredescuento_1" id="nombredescuento_1" class="form-control nombreDescuento">
									<?php
									$SQL="SELECT * FROM TBL_descuentos";
									$dato = mysqli_query($conexion, $SQL);
									$options="<option value=\"\" data-price=\"\" selected>Seleccione una opción</option>";
									
										if($dato -> num_rows >0){
											while($fila=mysqli_fetch_array($dato)){
												$precio='data-price="'.$fila['porcentaje_descuento'].'"';  
												$id=$fila['id_descuentos'];
												$nombre=$fila['nom_descuento'];
												$options.="<option value=\"$id\" $precio>$nombre</option>";
												}
												echo $options;
											}
										?>
							</select>
					</td>
							
			</tr>
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
					<table class="table table-bordered table-hover" onkeypress="return solonumeros (event)" id="invoiceItemFactura">
						<tr>
							<th width="2%"><input id="checkAllFactura" class="formcontrol" type="checkbox"></th>
							<th width="19%">Producto</th>
							<th width="15%">Cantidad </th>
							<th width="15%">Precio</th>
							<th width="15%">Total</th>
						</tr>
						<tr>
							<td><input class="itemRowFactura" type="checkbox"></td>
							<td><select name="nombreProducto[]" id="nombreProducto_1" class="form-control nombreProducto"
							 required>
									<?php
									$SQL="SELECT * FROM TBL_producto";
									$dato = mysqli_query($conexion, $SQL);
									$options="<option value=\"\" data-price=\"\" selected>Seleccione una opción</option>";
									
										if($dato -> num_rows >0){
											while($fila=mysqli_fetch_array($dato)){
												$precio='data-price="'.$fila['precio_produ'].'"';  
												$id=$fila['id_producto'];
												$nombre=$fila['nom_producto'];
												$options.="<option value=\"$id\" $precio>$nombre</option>";
												}
												echo $options;
											}
										?>
							</select></td>
							<td><input type="number" name="cantidad[]" id="cantidad_1" class="form-control quantity" required></td>
							<td><input type="number" name="precio[]" id="precio_1" class="form-control price" ></td>
							<td><input type="number" name="total[]" id="total_1" class="form-control total" ></td>
						</tr>
					</table>
				</div>
			</div>
	<!-- 	<div class="row"> -->

<!-- INICIO PROMOCIONES -->
<div class="row">
				<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
					<button class="btn btn-danger delete" id="removeRowsPromociones" type="button">- Eliminar</button>
					<button class="btn btn-success" id="addRowsPromocion" type="button">+ Agregar Más</button>    
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<table class="table table-bordered table-hover" onkeypress="return solonumeros (event)" id="invoiceItemPromociones">
						<tr>
							<th width="2%"><input id="checkAllPromo"  class="formcontrol" type="checkbox"></th>
							<th width="19%">Promocion</th>
							<th width="15%">Cantidad</th>
							<th width="15%">Precio</th>
							<th width="15%">Total</th>
						</tr>
						<tr>
							<td><input class="itemRowPromociones" type="checkbox"></td>
							<td><select name="nombrePromocion[]" id="nombrePromocion_1" class="form-control nombrePromocion" required>
									<?php
									$SQL="SELECT * FROM TBL_promociones where id_estado_promocio=1";
									$dato = mysqli_query($conexion, $SQL);
									$options="<option value=\"\" data-price=\"\" selected>Seleccione una opción</option>";
									
										if($dato -> num_rows >0){
											while($fila=mysqli_fetch_array($dato)){
												$precio='data-price="'.$fila['precio_promocion'].'"';  
												$id=$fila['id_promociones'];
												$nombre=$fila['nom_promocion'];
												$options.="<option value=\"$id\" $precio>$nombre</option>";
												}
												echo $options;
											}
										?>
							</select></td>
							<td><input type="number" name="cantidadpromo[]" id="cantidadpromo_1"  class="form-control quantitypromo" required></td>
							<td><input type="number" name="preciopromo[]" id="preciopromo_1" class="form-control pricepromo"></td>
							<td><input type="number" name="totalpromo[]" id="totalpromo_1" class="form-control totalpromo"></td>
						</tr>
					</table>
				</div>
			</div> 
<!-- FIN PROMOCIOES -->

			<div class="row">
				<div class="col-xs-10 col-sm-8 col-md-8 col-lg-8">
					
					<br>
					<div class="form-group">
						<input type="hidden" value="<?php echo $_SESSION['usuario_login']; ?>" class="form-control" name="userId">
						<input data-loading-text="Guardando factura..." type="submit" name="invoice_btn" value="Guardar factura" 
						class="btn btn-success submit_btn invoice-save-btm" style="font-size:20px; border: 2px solid #777574;">
						<a href="<?php echo SERVERURL; ?>facturacion-list/"><input value="salir" 
						class="btn btn-success submit_btn invoice-save-btm" style="font-size:20px; border: 2px solid #777574;"></a>
					</div>

				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
					<span class="form-inline">
						<div class="form-group">
							<label class="color-label">Subtotal: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input type="number" class="form-control" name="subTotal" step="any" id="subTotal" placeholder="Subtotal">
							</div>
						</div>
						<div class="form-group">
							<label class="color-label">Monto después de descuento: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input type="number" class="form-control" name="montodescuento" id="descuentomonto" step="any" placeholder="Monto descuento" novalidate>
							</div>
							<!-- <label class="color-label">Porcentaje Descuento: &nbsp;</label> -->
							<div class="input-group">
								<input type="number" class="form-control" name="nombredescuento" id="nomdesc" step="any" 
								style="width:5rem;" placeholder="% descuento" disabled>
								<div class="input-group-addon">%</div>
							</div>
						</div>
						<div class="form-group">
							<label class="color-label">Monto impuestos: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input type="number" class="form-control" name="taxAmount" id="taxAmount" step="any" placeholder="Monto impuestos" novalidate>
							</div>
							<!-- <label class="color-label">Porcentaje Impuestos: &nbsp;</label> -->
							<div class="input-group">
								<input value="15" type="number" class="form-control" name="taxRate" id="taxRate" 
								style="width:5rem;" step="any" disabled>
								<div class="input-group-addon">%</div>
							</div>
						</div>
						
						<div class="form-group">
							<label class="color-label">Total: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input value="" type="number" class="form-control" name="totalAftertax" id="totalAftertax" step="any" placeholder="Total">
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
