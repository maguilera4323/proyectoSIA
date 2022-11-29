<?php
	include ("./cone.php");
	require_once "./pruebabitacora.php";

	$datos_bitacora = [
		"id_objeto" => 1,
		"fecha" => date('Y-m-d H:i:s'),
		"id_usuario" => $_SESSION['id_login'],
		"accion" => "Cambio de vista",
		"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la vista del Home"
	];
	Bitacora::guardar_bitacora($datos_bitacora); 

	$rol=$_SESSION['id_rol'];
	//query para extraer los tipos de objeto con los que cuenta el sistema actualmente
	$sql="SELECT tipo_objeto FROM TBL_permisos 
	where id_rol='$rol'";
	$dato = mysqli_query($conexion, $sql); 

		if($dato -> num_rows >0){
			while($fila=mysqli_fetch_array($dato)){
				//se valida que el tipo de objeto concuerde con un valor en especifico
				//para darle valor a la variable que servirá de comprobacion
				if($fila['tipo_objeto']=='Proveedores'){
					$proveedores='true';
				}

				if($fila['tipo_objeto']=='Insumos'){
					$insumos='true';
				}

				if($fila['tipo_objeto']=='Productos'){
					$productos='true';
				}

				if($fila['tipo_objeto']=='Compras'){
					$compras='true';
				}

				if($fila['tipo_objeto']=='Mantenimiento'){
					$mantenimiento='true';
				}

				if($fila['tipo_objeto']=='Administracion'){
					$administracion='true';
				}

				if($fila['tipo_objeto']=='Facturacion'){
					$facturacion='true';
				}
			}
		} 

	//validación para obtener la alerta de cantidades bajos de insumos
	//se obtiene la cantidad minima de cada insumo con este query
	$sqlInsumos="SELECT* FROM TBL_insumos";
	$dato = mysqli_query($conexion, $sqlInsumos); 
	$cont=0;
		if($dato -> num_rows >0){
			while($fila=mysqli_fetch_array($dato)){
				$cantidad[$cont]=$fila['cant_min'];
				$cont++;
			}
		} 

		//query para obtener las cantidades en inventario de cada insumo
		$sqlInventario="SELECT* FROM TBL_inventario";
		$dato = mysqli_query($conexion, $sqlInventario); 
		$cont=0;
			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
					$cantidad_inv[$cont]=$fila['cant_existencia'];
					$cont++;
				}
			}
		
		//ciclo para validar si se debe mostrar la alerta de bajo inventario
		//condicion de si la cantidad en inventario es menor o igual a la cantidad minina del insumo más 10
		for($i=0;$i<$cont;$i++){
			if($cantidad_inv[$i]<=($cantidad[$i]+10)){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Uno o más insumos están por terminarse. Revise el inventario de insumos
					<button type="button" class="close" data-dismiss="alert"">X</button>
					</div>';
			}
		}
?>

<!-- Page header -->
<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fab fa-dashcube fa-fw"></i> &nbsp; Inicio
	</h3>
</div>

	<!-- Content -->
	<div class="full-box tile-container">
		<?php
			if(isset($facturacion)=='true'){
		?>
		<a href="<?php echo SERVERURL; ?>proveedor-list/" class="tile">
			<div class="tile-tittle">PROVEEDORES</div>
			<div class="tile-icon">
				<i class="fas fa-users fa-fw"></i>
		<!-- AQUI INICIA EL CONTADOR PARA LOS USUARIOS EN EL HOME -->
		<p>	
			<?php
				$sql=" SELECT COUNT(*) as total_proveedores FROM `TBL_Proveedores` ";
				$result=mysqli_query($conexion,$sql);
				while($mostrar=mysqli_fetch_assoc ($result)){
			?>
					<tbody>
						<tr class="text-center" >
							<td><?php echo $mostrar['total_proveedores']?></td>

						</tr>
					</tbody>
			<?php
				}
			?>
			Proveedores Registrados
			</p>
	<!-- AQUI FINALIZA EL CONTADOR PARA LOS USUARIOS EN EL HOME -->
			</div>
		</a>
		<?php
			}
		?>
		
		<?php
			if(isset($compras)=='true'){
		?>
		<a href="<?php echo SERVERURL; ?>compra-list/" class="tile">
			<div class="tile-tittle">COMPRAS</div>
			<div class="tile-icon">
				<i class="fas fa-shopping-cart"></i>
				<p>
			<?php
				$sql=" SELECT COUNT(*) as total_compras FROM `TBL_compras` ";
				$result=mysqli_query($conexion,$sql);
				while($mostrar=mysqli_fetch_assoc ($result)){
			?>
					<tbody>
						<tr class="text-center" >
							<td><?php echo $mostrar['total_compras']?></td>

						</tr>
					</tbody>
			<?php
				}
			?> Compras registradas</p>
			</div>
		</a>
		<?php
			}
		?>
		
		<?php
			if(isset($insumos)=='true'){
		?>
		<a href="<?php echo SERVERURL; ?>insumos-list/" class="tile">
			<div class="tile-tittle">INSUMOS</div>
			<div class="tile-icon">
				<i class="fas fa-pallet fa-fw"></i>
				<p>
			<?php
				$sql=" SELECT COUNT(*) as total_insumos FROM `TBL_insumos` ";
				$result=mysqli_query($conexion,$sql);
				while($mostrar=mysqli_fetch_assoc ($result)){
			?>
					<tbody>
						<tr class="text-center" >
							<td><?php echo $mostrar['total_insumos']?></td>

						</tr>
					</tbody>
			<?php
				}
			?> Insumos registrados</p>
			</div>
		</a>
		<?php
			}
		?>

		<?php
			if(isset($productos)=='true'){
		?>
		<a href="<?php echo SERVERURL; ?>producto-list/" class="tile">
			<div class="tile-tittle">PRODUCTO</div>
			<div class="tile-icon">
				<i class="fas fa-mug-hot fa-fw"></i>
				<p>
			<?php
				$sql=" SELECT COUNT(*) as total_productos FROM `TBL_producto` ";
				$result=mysqli_query($conexion,$sql);
				while($mostrar=mysqli_fetch_assoc ($result)){
			?>
					<tbody>
						<tr class="text-center" >
							<td><?php echo $mostrar['total_productos']?></td>

						</tr>
					</tbody>
			<?php
				}
			?> Productos registrados</p>
			</div>
		</a>
		<?php
			}
		?>

		<?php
			if(isset($mantenimiento)=='true'){
		?>
		<a href="<?php echo SERVERURL; ?>user-list/" class="tile">
			<div class="tile-tittle">Usuarios</div>
			<div class="tile-icon">
				<i class="fas fa-user-secret fa-fw"></i>
	<!-- AQUI INICIA EL CONTADOR PARA LOS USUARIOS EN EL HOME -->
				<p>	
			<?php
				$sql=" SELECT COUNT(*) as total_usuarios FROM `TBL_usuarios` ";
				$result=mysqli_query($conexion,$sql);
				while($mostrar=mysqli_fetch_assoc ($result)){
			?>
					<tbody>
						<tr class="text-center" >
							<td><?php echo $mostrar['total_usuarios']?></td>

						</tr>
					</tbody>
			<?php
				}
			?>
			Usuarios Registrados
			</p>
	<!-- AQUI FINALIZA EL CONTADOR PARA LOS USUARIOS EN EL HOME -->
			</div>
		</a>
		<?php
			}
		?>
		
		<?php
			if(isset($facturacion)=='true'){
		?>
		<a href="<?php echo SERVERURL; ?>facturacion-list/" class="tile">
			<div class="tile-tittle">FACTURACION</div>
			<div class="tile-icon">
				<i class="fas fa-store-alt fa-fw"></i>
				<p><?php
				$sql=" SELECT COUNT(*) as total_facturas FROM `TBL_pedidos` ";
				$result=mysqli_query($conexion,$sql);
				while($mostrar=mysqli_fetch_assoc ($result)){
				?>
					<tbody>
						<tr class="text-center" >
							<td><?php echo $mostrar['total_facturas']?></td>

						</tr>
					</tbody>
			<?php
				}
			?>
			Ventas Registradas</p>
			</div>
		</a>
		<?php
			}
		?>
	</div>


