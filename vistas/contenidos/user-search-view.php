<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-search fa-fw"></i> &nbsp; BUSCAR USUARIO
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>user-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; NUEVO USUARIO</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>user-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE USUARIOS</a>
		</li>
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>user-search/"><i class="fas fa-search fa-fw"></i> &nbsp; BUSCAR USUARIO</a>
		</li>
	</ul>	
</div>

<div class="container-fluid">
	<form class="form-neon" action="">
		<div class="container-fluid">
			<div class="row justify-content-md-center">
				<div class="col-12 col-md-6">
					<div class="form-group">
						<label for="inputSearch" class="bmd-label-floating">¿Qué usuario estas buscando?</label>
						<input type="text" class="form-control" name="busqueda-" id="inputSearch" maxlength="30">
					</div>
				</div>
				<div class="col-12">
					<p class="text-center" style="margin-top: 40px;">
						<button type="submit" class="btn btn-raised btn-info"><i class="fas fa-search"></i> &nbsp; BUSCAR</button>
					</p>
				</div>
			</div>
		</div>
	</form>
</div>


<div class="container-fluid">
	<form action="">
		<input type="hidden" name="eliminar-busqueda" value="eliminar">
		<div class="container-fluid">
			<div class="row justify-content-md-center">
				<div class="col-12 col-md-6">
					<p class="text-center" style="font-size: 20px;">
						Resultados de la busqueda <strong>“Buscar”</strong>
					</p>
				</div>
				<div class="col-12">
					<p class="text-center" style="margin-top: 20px;">
						<button type="submit" class="btn btn-raised btn-danger"><i class="far fa-trash-alt"></i> &nbsp; ELIMINAR BÚSQUEDA</button>
					</p>
				</div>
			</div>
		</div>
	</form>
</div>
//////////////           APARTIR DE AQUI COMIENZA LA CONSULTA A LA BASE DE DATOS
<?php 
$conexion=mysqli_connect('20.25.134.34','admin_bd','admin1234','proyecto_cafeteria');
?>
<div class="container-fluid">
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