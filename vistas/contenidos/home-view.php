<?php
	require_once "./pruebabitacora.php";

	$datos_bitacora = [
		"id_objeto" => 0,
		"fecha" => date('Y-m-d H:i:s'),
		"id_usuario" => $_SESSION['id_login'],
		"accion" => "Cambio de vista",
		"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la vista del Home"
	];
	Bitacora::guardar_bitacora($datos_bitacora); 
?>

<!-- Page header -->
<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fab fa-dashcube fa-fw"></i> &nbsp; Inicio
	</h3>
</div>

<?php 
	if($_SESSION['rol']=='Admin Sistema'){
?>
	<!-- Content -->
	<div class="full-box tile-container">
		<a href="<?php echo SERVERURL; ?>proveedor-list/" class="tile">
			<div class="tile-tittle">PROVEEDORES</div>
			<div class="tile-icon">
				<i class="fas fa-users fa-fw"></i>
		<!-- AQUI INICIA EL CONTADOR PARA LOS USUARIOS EN EL HOME -->
		<p>	
			<?php
				include ("./cone.php");

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
		
		<a href="<?php echo SERVERURL; ?>compra-list/" class="tile">
			<div class="tile-tittle">COMPRAS</div>
			<div class="tile-icon">
				<i class="fas fa-shopping-cart"></i>
				<p>4 cambiar</p>
			</div>
		</a>

		<a href="<?php echo SERVERURL; ?>item-list/" class="tile">
			<div class="tile-tittle">INSUMOS</div>
			<div class="tile-icon">
				<i class="fas fa-pallet fa-fw"></i>
				<p>9 Cambiar</p>
			</div>
		</a>

		<a href="<?php echo SERVERURL; ?>reservation-pending/" class="tile">
			<div class="tile-tittle">PRODUCTO</div>
			<div class="tile-icon">
				<i class="fas fa-hand-holding-usd fa-fw"></i>
				<p>200  Cambiar</p>
			</div>
		</a>

		<a href="<?php echo SERVERURL; ?>user-list/" class="tile">
			<div class="tile-tittle">Usuarios</div>
			<div class="tile-icon">
				<i class="fas fa-user-secret fa-fw"></i>
	<!-- AQUI INICIA EL CONTADOR PARA LOS USUARIOS EN EL HOME -->
				<p>	
			<?php
				include ("./cone.php");

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

		<a href="<?php echo SERVERURL; ?>company/" class="tile">
			<div class="tile-tittle">FACTURACION</div>
			<div class="tile-icon">
				<i class="fas fa-store-alt fa-fw"></i>
				<p>1 Cambiar</p>
			</div>
		</a>
	</div>
<?php
}?>

<?php 
	if($_SESSION['rol']=='Admin Inv.'){
?>
	<!-- Content -->
	<div class="full-box tile-container">
		<a href="<?php echo SERVERURL; ?>proveedor-list/" class="tile">
			<div class="tile-tittle">PROVEEDORES</div>
			<div class="tile-icon">
				<i class="fas fa-users fa-fw"></i>
		<!-- AQUI INICIA EL CONTADOR PARA LOS USUARIOS EN EL HOME -->
		<p>	
			<?php
				include ("./cone.php");

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
		
		<a href="<?php echo SERVERURL; ?>compra-list/" class="tile">
			<div class="tile-tittle">COMPRAS</div>
			<div class="tile-icon">
				<i class="fas fa-shopping-cart"></i>
				<p>4 cambiar</p>
			</div>
		</a>

		<a href="<?php echo SERVERURL; ?>item-list/" class="tile">
			<div class="tile-tittle">INSUMOS</div>
			<div class="tile-icon">
				<i class="fas fa-pallet fa-fw"></i>
				<p>9 Cambiar</p>
			</div>
		</a>

		<a href="<?php echo SERVERURL; ?>reservation-pending/" class="tile">
			<div class="tile-tittle">PRODUCTO</div>
			<div class="tile-icon">
				<i class="fas fa-hand-holding-usd fa-fw"></i>
				<p>200  Cambiar</p>
			</div>
		</a>
	</div>
<?php
}?>

<?php 
	if($_SESSION['rol']=='Vendedor'){
?>
	<!-- Content -->
	<div class="full-box tile-container">

		<a href="<?php echo SERVERURL; ?>reservation-pending/" class="tile">
			<div class="tile-tittle">PRODUCTO</div>
			<div class="tile-icon">
				<i class="fas fa-hand-holding-usd fa-fw"></i>
				<p>200  Cambiar</p>
			</div>
		</a>

		<a href="<?php echo SERVERURL; ?>company/" class="tile">
			<div class="tile-tittle">FACTURACION</div>
			<div class="tile-icon">
				<i class="fas fa-store-alt fa-fw"></i>
				<p>1 Cambiar</p>
			</div>
		</a>
	</div>
<?php
}?>

