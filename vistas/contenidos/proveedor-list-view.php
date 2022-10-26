<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PROVEEDORES
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>proveedor-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PROVEEDOR</a>
		</li>
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>proveedor-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PROVEEDORES</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>proveedor-search/"><i class="fas fa-search fa-fw"></i> &nbsp; BUSCAR PROVEEDOR</a>
		</li>
	</ul>	
</div>

<div class="container-fluid">
	<div class="table-responsive">
		<table class="table table-dark table-sm">
			<thead>
				<tr class="text-center roboto-medium">
					<th>#</th>
					<th>NOMBRE</th>
					<th>RTN</th>
					<th>TELEFONO</th>
					<th>CORREO</th>
					<th>DIRECCIÓN</th>
					<th>ACTUALIZAR</th>
					<th>ELIMINAR</th>
				</tr>
			</thead>
			<?php
			include ("./cone.php");
			$sql="SELECT * FROM TBL_Proveedores";
			$result=mysqli_query($conexion,$sql);
			while($mostrar=mysqli_fetch_assoc($result)){			
		?>
				<tbody>
					<tr class="text-center" >
						<td><?php echo $mostrar['id_Proveedores']?></td>
						<td><?php echo $mostrar['nom_proveedor']?></td>
						<td><?php echo $mostrar['rtn_proveedor']?></td>
						<td><?php echo $mostrar['tel_proveedor']?></td>
						<td><?php echo $mostrar['correo_proveedor']?></td>
						<td><?php echo $mostrar['dir_proveedor']?></td>
						<td>
						<a href="<?php echo SERVERURL; ?>proveedor-update/<?php echo $mostrar['id_Proveedores']?>" class="btn btn-success">
									<i class="fas fa-sync-alt"></i>	
							</a>
						</td>
						<td>
							<form class="FormularioAjax" action="<?php echo SERVERURL; ?>ajax/usuarioAjax.php" method="POST" data-form="delete" autocomplete="off">
							<input type="hidden" pattern="" class="form-control" name="id_usuario_del" value="<?php echo $mostrar['id_usuario'] ?>">
							<input type="hidden" pattern="" class="form-control" name="usuario_del" value="<?php echo $mostrar['usuario'] ?>">	
							<button type="submit" class="btn btn-warning">
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
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled">
				<a class="page-link" href="#" tabindex="-1">Previous</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item">
				<a class="page-link" href="#">Next</a>
			</li>
		</ul>
	</nav>
</div>