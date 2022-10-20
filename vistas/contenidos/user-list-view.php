

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-clipboard-list fa-fw"></i> &nbsp; USUARIOS
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


<div class="container-fluid">



<div class="table-responsive">
	<!-- BOTON DE BUSQUEDA-->
	<form action="buscar_usuario.php" method="get" class="" >
		<input type="text" name="busqueda" id="busqueda" placeholder="Usuario a Buscar">
		<input type="submit" value="buscar" class="btn_search">
	</form>
	<!-- AQUI TERMINA EL BOTON DE BUSQUEDA-->
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
			include ("./cone.php");
			$sql="SELECT u.id_usuario, u.usuario, u.nombre_usuario, u.estado_usuario, u.correo_electronico,
			u.creado_por, r.rol FROM TBL_usuarios u
			inner JOIN TBL_ms_roles r ON u.id_rol = r.id_rol";
			$result=mysqli_query($conexion,$sql);
			while($mostrar=mysqli_fetch_assoc($result)){			
		?>
				<tbody>
					<tr class="text-center" >
						<td><?php echo $mostrar['id_usuario']?></td>
						<td><?php echo $mostrar['usuario']?></td>
						<td><?php echo $mostrar['nombre_usuario']?></td>
						<td><?php echo $mostrar['estado_usuario']?></td>
						<td><?php echo $mostrar['rol']?></td>
						<td><?php echo $mostrar['correo_electronico']?></td>
						<td><?php echo $mostrar['creado_por']?></td>
						<td>
						<?php $_SESSION['id_update']=$mostrar['id_usuario']?>
						<a href="<?php echo SERVERURL; ?>user-update?id=<?php echo $_SESSION['id_update']?>" class="btn btn-success">
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