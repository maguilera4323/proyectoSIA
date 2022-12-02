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
				echo "<script> window.location.href='".SERVERURL."facturacion-list/'; </script>";
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
					$query="SELECT p.id_pedido, p.nom_cliente,  p.dni_cliente, p.num_factura, p.fech_pedido, p.fech_entrega, p.sitio_entrega,
					p.sub_total, p.ISV, p.total, f.forma_pago, p.fech_facturacion,p.id_estado_pedido FROM TBL_pedidos p
					inner join TBL_forma_pago f on f.id_forma_pago=p.id_forma_pago
					where p.id_pedido='$id_act_pedido'";
					$resultado=mysqli_query($conexion,$query);

					if($resultado -> num_rows >0){
					while($fila=mysqli_fetch_array($resultado)){
							$nom_cliente=$fila['nom_cliente'];
							$dni_cliente=$fila['dni_cliente'];
							$numFactura=$fila['num_factura'];
							$sitioEntrega=$fila['sitio_entrega'];
							$fechaPedido=$fila['fech_pedido'];
							$fechaEntrega=$fila['fech_entrega'];
							$subtotal=$fila['sub_total'];
							$impuesto=$fila['ISV'];
							$Total=$fila['total'];
							$fechaFact=$fila['fech_facturacion'];
							$formaPago=$fila['forma_pago'];
							$estado=$fila['id_estado_pedido'];
						}
					}
/* 
					//valida si el query anterior no retornó ningún valor
					//si el estado es distinto a Pendiente no se puede editar la venta
					if($estado!=1){
						echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Solo puede editar ventas con estado Pendiente</div>';
						echo "<script> window.location.href='".SERVERURL."facturacion-list/'; </script>";	
					} */

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

					//query para obtener el id de la primera promocion de la venta
					//este dato será utilizado en un ciclo más abajo para poder obtener los id de todos las promociones agregadas
					$queryPrimerIdPromocion="SELECT id_pedido_promocion FROM TBL_pedidos_promociones
					where id_pedido='$id_act_pedido' LIMIT 1";
					$resultadoPrimerIdPromocion=mysqli_query($conexion,$queryPrimerIdPromocion);

					if($resultadoPrimerIdPromocion -> num_rows >0){
					while($filaPriDetalle=mysqli_fetch_array($resultadoPrimerIdPromocion)){
							//se obtiene el id del primer insumo comprado
							$id_prom_detalle=$filaPriDetalle['id_pedido_promocion'];
						}
					}

					//query para obtener la cantidad de promociones que corresponden a la venta seleccionada para editar
					//el valor obtenido será utilizado en el ciclo de abajo como limite 
					$queryRegistrosPromocion="SELECT COUNT(*) as contador FROM TBL_pedidos_promociones 
					where id_pedido='$id_act_pedido'";
					$resultadoDetalle=mysqli_query($conexion,$queryRegistrosPromocion);

					if($resultadoDetalle -> num_rows >0){
					while($filaDetalle=mysqli_fetch_array($resultadoDetalle)){
							$cantidadPromocionesVenta=$filaDetalle['contador'];
						}
					}

					//query para obtener y mostrar los datos del descuento
					//estos datos se mostrarán tanto en la parte de arriba con el descuento seleccionado como en la parte final
					//con el monto de descuento y el porcentaje del mismo
					$queryDescuento="SELECT d.nom_descuento, d.porcentaje_descuento, pd.id_pedidos, pd.total_descontado FROM TBL_pedido_descuentos pd
					inner join TBL_descuentos d on d.id_descuentos=pd.id_descuentos
					where pd.id_pedidos='$id_act_pedido'";
					$resultadoDetalle=mysqli_query($conexion,$queryDescuento);
					if($resultadoDetalle -> num_rows >0){
						while($filaDetalle=mysqli_fetch_array($resultadoDetalle)){
								$nomDescuento=$filaDetalle['nom_descuento'];
								$porcentaje=$filaDetalle['porcentaje_descuento'];
								$totalDescontado=$filaDetalle['total_descontado'];
							}
						//si no se selecionó ningun descuento en la parte donde se seleccionan los descuentos se verá en blanco
						}else{
							$nomDescuento='';
						}
						$isv=15;

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
						<label class="color-label">DNI</label>
						<input type="text" class="form-control" name="dni_pedido" id="dni_pedido" maxlength="27" 
						value="<?php echo $dni_cliente; ?>" required>
					</div>	
					<div class="form-group">
						<label class="color-label">Num. Factura</label>
						<input type="text" class="form-control" name="num_factura" id="num_factura" maxlength="40" 
						style="text-transform:uppercase;" value="<?php echo $numFactura; ?> " disabled>
					</div>
					<div class="form-group">
						<label class="color-label">Forma de Pago</label>
						<input type="text" class="form-control" name="forma_pago_venta" id="forma_pago_venta" maxlength="40" 
						 value="<?php echo $formaPago; ?> " disabled>
					</div>		
					
				</div> 
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
					<div class="form-group">
						<label class="color-label">Cliente</label>
						<input type="text" class="form-control" name="cliente_pedido" id="cliente_pedido" maxlength="27" 
						value="<?php echo $nom_cliente; ?>" required>
					</div>	
					<div class="form-group">
						<label class="color-label">Sitio de Entrega</label>
						<input type="text" name="sitio_entrega" id="sitio_entrega" class="form-control" value="<?php echo $sitioEntrega; ?>" autocomplete="off">
					</div>	
					<div class="form-group">
						<label class="color-label">Estado de Pedido</label>
						<select class="form-control" name="estado_pedido" id="estado_pedido" >
							<?php
							$SQL="SELECT * FROM TBL_estado_pedido where id_estado_pedido<=2";
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
					<div class="form-group">
					<label class="color-label">Descuento</label>
					<td><input type="text" class="form-control" name="nombredescuento[]" id="nombredescuento_1" value="<?php echo $nomDescuento; ?>"></td>
							
						</tr>
					</div>	
				</div>
			</div>
			<div class="row">
	
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
						//Ciclo para obtener todos los registros de la tabla TBL_detalle_pedido usando el valor del primer id del detalle pedido
						//este id aumentará en 1 con cada iteración del ciclo debido a que los registros del detalle_pedido relacionados con un pedido especifico
						//están en la tabla TBL_detalle_pedido de forma seguida
						for ($i = 1; $i <=$cantidadProductosVenta; $i++) {

							//query para obtener los datos de TBL_detalle_pedido
							//Estos datos se imprimirán en la tabla donde aparecen todos los productos correspondientes a la factura
							$queryDetalle="SELECT p.nom_producto, dp.id_detalle_pedido, dp.id_producto,dp.cantidad,dp.precio_venta
							FROM TBL_detalle_pedido dp
							inner join TBL_producto p on p.id_producto=dp.id_producto
							where dp.id_detalle_pedido='$id_act_detalle' LIMIT 1";
							$resultadoDetalle=mysqli_query($conexion,$queryDetalle);
							
							if($resultadoDetalle -> num_rows >0){
							while($filaDetalle=mysqli_fetch_array($resultadoDetalle)){
									$idProducto=$filaDetalle['id_producto'];
									$nomProducto=$filaDetalle['nom_producto'];
									$cantidad=$filaDetalle['cantidad'];
									$precio=$filaDetalle['precio_venta'];
								}
							} 
						?>
						<tr>
							<td><input class="itemRowFactura" type="checkbox"></td>
							<td><input type="text" name="productCode[]" id="productCode_<?php echo $count; ?>" class="form-control" value="<?php echo $id_act_detalle;?>" autocomplete="off"></td>
							<td><input type="text" class="form-control"   value="<?php echo $nomProducto; ?>"></td>
							<td><input type="number" name="cantidad[]" id="cantidad_<?php echo $i; ?>" value="<?php echo $cantidad;?>"class="form-control quantity" autocomplete="off"></td>
							<td><input type="number" name="precio[]" id="precio_<?php echo $i; ?>" value="<?php echo $precio;?>" class="form-control price" autocomplete="off"></td>
							<td><input type="number" name="total[]" id="total_<?php echo $i; ?>" value="<?php echo $precio*$cantidad; ?>" class="form-control total" autocomplete="off"></td>
						</tr>
						<div class="form-group">
								<!--datos enviados para realizar las actualizaciones en el controlador!-->
								<!--id_act_compra[] para realizar el primer query de actualizacion del pedido!-->
								<!--id_act_detallecompra[] para realizar el segundo query de actualizacion del detalle de pedido!-->
								<!--nombreProducto[] para realizar la validacion del segundo query!-->
								<input type="hidden" value="<?php echo $id_act_pedido; ?>" class="form-control" 
								id="id_act_pedido_<?php echo $i; ?>" name="id_act_pedido[]">
								<input type="hidden" value="<?php echo $id_act_detalle; ?>" class="form-control" 
								id="id_act_detallepedido_<?php echo $i; ?>" name="id_act_detallepedido[]">
								<input type="hidden" value="<?php echo $idProducto; ?>" class="form-control" 
								id="nombreProducto_<?php echo $i; ?>" name="nombreProducto[]">
							</div>
						<?php 
						
						//después de traer un registro a la tabla el valor de $id_act_detalle aumenta en 1
						//para traer todos los registros relacionados con el pedido
						$id_act_detalle+=1;
						}?>
					</table>
				</div>
			</div>

			<div class="row">

			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<table class="table table-bordered table-hover" onkeypress="return solonumeros (event)" id="invoiceItemPromociones">
						<tr>
							<th width="2%"><input id="checkAllPromo"  class="formcontrol" type="checkbox"></th>
							<th width="19%">ID Promocion</th>
							<th width="19%">Promocion</th>
							<th width="15%">Cantidad</th>
							<th width="15%">Precio</th>
							<th width="15%">Total</th>
						</tr>
						<tr>
						<?php
						//Ciclo para obtener todos los registros de la tabla TBL_pedidos_promociones usando el valor del primer id del pedido promocion
						//este id aumentará en 1 con cada iteración del ciclo debido a que los registros del detalle_pedido relacionados con un pedido especifico
						//están en la tabla TBL_detalle_compra de forma seguida
						for ($j = 1; $j <=$cantidadPromocionesVenta; $j++) {

							//query para obtener los datos de TBL_detalle_pedido
							//Estos datos se imprimirán en la tabla donde aparecen todos los productos correspondientes a la factura
							$queryPromocion="SELECT pp.id_pedido_promocion, pp.id_pedido_promocion, pr.nom_promocion,pp.id_pedido,
							pp.cantidad,pp.precio_venta,pp.id_promocion
							FROM TBL_pedidos_promociones pp
							inner join TBL_pedidos p on p.id_pedido=pp.id_pedido
							inner join TBL_promociones pr on pr.id_promociones=pp.id_promocion
							where pp.id_pedido_promocion='$id_prom_detalle' LIMIT 1";
							$resultadoDetalle=mysqli_query($conexion,$queryPromocion);
							
							if($resultadoDetalle -> num_rows >0){
							while($filaDetalle=mysqli_fetch_array($resultadoDetalle)){
									$idPedPromocion=$filaDetalle['id_pedido_promocion'];
									$idPromocion=$filaDetalle['id_promocion'];
									$nomPromocion=$filaDetalle['nom_promocion'];
									$cantidadPromocion=$filaDetalle['cantidad'];
									$precioPromocion=$filaDetalle['precio_venta'];
								}
							} 
						?>
						<tr>
							<td><input class="itemRowFactura" type="checkbox"></td>
							<td><input type="text" name="productCode[]" id="productCode_<?php echo $count; ?>" class="form-control" value="<?php echo $id_prom_detalle;?>" autocomplete="off"></td>
							<td><input type="text" class="form-control"   value="<?php echo $nomPromocion; ?>"></td>
							<td><input type="number" name="cantidadpromo[]" id="cantidadpromo_<?php echo $i; ?>" value="<?php echo $cantidadPromocion;?>"class="form-control quantity" autocomplete="off"></td>
							<td><input type="number" name="preciopromo[]" id="preciopromo_<?php echo $i; ?>" value="<?php echo $precioPromocion;?>" class="form-control price" autocomplete="off"></td>
							<td><input type="number" name="totalpromo[]" id="totalpromo_<?php echo $i; ?>" value="<?php echo $precioPromocion*$cantidadPromocion; ?>" class="form-control total" autocomplete="off"></td>
						</tr>
						<div class="form-group">
								<!--datos enviados para realizar las actualizaciones en el controlador!-->
								<!--id_act_compra[] para realizar el primer query de actualizacion del pedido!-->
								<!--id_act_detallecompra[] para realizar el segundo query de actualizacion del detalle de pedido!-->
								<!--nombreProducto[] para realizar la validacion del segundo query!-->
								<input type="hidden" value="<?php echo $id_act_pedido; ?>" class="form-control" 
								id="id_act_pedido_<?php echo $i; ?>" name="id_act_pedido[]">
								<input type="hidden" value="<?php echo $id_prom_detalle; ?>" class="form-control" 
								id="id_prom_detalleprom_<?php echo $j; ?>" name="id_prom_detalleprom[]">
								<input type="hidden" value="<?php echo $idPromocion; ?>" class="form-control" 
								id="idPromocion_<?php echo $j; ?>" name="idPromocion[]">
							</div>
						
						<?php 
						
						//después de traer un registro a la tabla el valor de $id_prom_detalle aumenta en 1
						//para traer todos los registros relacionados con la venta
						$id_prom_detalle+=1;
						}?>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
					
					<br>
					<div class="form-group">
						<input type="hidden" value="<?php echo $_SESSION['usuario_login']; ?>" class="form-control" name="userId">
						<input data-loading-text="Guardando factura..." type="submit" name="invoice_btn" value="Guardar factura"
						class="btn btn-success submit_btn invoice-save-btm" style="font-size:20px; border: 2px solid #777574;">
					</div>

				</div>
				<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
					<span class="form-inline">
					<div class="form-group">
							<label class="color-label">Subtotal: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input type="number" class="form-control" name="subTotal" step="any" id="subTotal" 
								value="<?php echo $subtotal; ?>" placeholder="Subtotal">
							</div>
						</div>
						<div class="form-group">
							<label class="color-label">Monto después de descuento: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input type="number" class="form-control" name="montodescuento" id="descuentomonto" step="any" 
								value="<?php echo $subtotal-($subtotal*$porcentaje); ?>" placeholder="Monto descuento" >
							</div>
							<!-- <label class="color-label">Porcentaje Descuento: &nbsp;</label> -->
							<div class="input-group">
								<input type="number" class="form-control" name="nombredescuento" id="nomdesc" step="any" 
								style="width:5rem;" placeholder="% descuento" value="<?php echo $porcentaje; ?>" disabled>
								<div class="input-group-addon">%</div>
							</div>
						</div>
						<div class="form-group">
							<label class="color-label">Monto impuestos: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input type="number" class="form-control" name="taxAmount" id="taxAmount" step="any"
								value="<?php echo $impuesto; ?>" placeholder="Monto impuestos" novalidate>
							</div>
							<!-- <label class="color-label">Porcentaje Impuestos: &nbsp;</label> -->
							<div class="input-group">
								<input value="15" type="number" class="form-control" name="taxRate" id="taxRate" 
								style="width:5rem;" value="<?php echo $isv; ?>" step="any" disabled>
								<div class="input-group-addon">%</div>
							</div>
						</div>
						
						<div class="form-group">
							<label class="color-label">Total: &nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon currency">L.</div>
								<input type="number" class="form-control" name="totalAftertax" id="totalAftertax" step="any" 
								value="<?php echo $Total; ?>" placeholder="Total">
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