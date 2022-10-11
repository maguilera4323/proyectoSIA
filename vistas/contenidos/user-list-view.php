<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE USUARIOS
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>user-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; NUEVO USUARIO</a>
		</li>
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>user-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE USUARIOS</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>user-search/"><i class="fas fa-search fa-fw"></i> &nbsp; BUSCAR USUARIO</a>
		</li>
	</ul>	
</div>

<?php 
$conexion=mysqli_connect('20.25.134.34','admin_bd','admin1234','proyecto_cafeteria');
?>

<div class="container-fluid">

<div class="table-responsive">
	<table class="table table-dark table-sm">
		<thead>
			<tr class="text-center roboto-medium">
				<th>#</th>
				<th>USUARIO</th>
				<th>NOMBRE</th>
				<th>ESTADO</th>
				<th>ROL</th>
				<th>CORREO</th>
				<th>CREADO POR</th>
				<th>ACTUALIZAR</th>
				<th>ELIMINAR</th>
			</tr>
		</thead>
		<?php
			$sql="SELECT * FROM TBL_usuarios";
			$result=mysqli_query($conexion,$sql);
			while($mostrar=mysqli_fetch_array($result)){			
		?>
				<tbody>
					<tr class="text-center" >
						<td><?php echo $mostrar['id_usuario']?></td>
						<td><?php echo $mostrar['usuario']?></td>
						<td><?php echo $mostrar['nombre_usuario']?></td>
						<td><?php echo $mostrar['estado_usuario']?></td>
						<td><?php echo $mostrar['id_rol']?></td>
						<td><?php echo $mostrar['correo_electronico']?></td>
						<td><?php echo $mostrar['creado_por']?></td>
						
						<td>
							<a href="user-update.html" class="btn btn-success">
									<i class="fas fa-sync-alt"></i>	
							</a>
						</td>
						<td>
							<form action="">
								<button type="button" class="btn btn-warning">
										<i class="far fa-trash-alt"></i>
								</button>
							</form>
						</td>
					</tr>
				</tbody>
		<?php
			}
		?>
	</table>
		

</div>