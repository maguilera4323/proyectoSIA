<?php
	require_once "./pruebabitacora.php";
		include ("./cone.php");     

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT * FROM TBL_permisos where id_rol='$id_rol' and id_objeto=6";
			$dato = mysqli_query($conexion, $SQL);

			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
					$permiso_in=$fila['permiso_insercion'];
					$permiso_act=$fila['permiso_actualizacion'];
					$permiso_eli=$fila['permiso_eliminacion'];
					$permiso_con=$fila['permiso_consulta'];
				}
			}

			//valida si el query anterior no retornó ningún valor
			//en este caso no había un permiso registrado del objeto para el rol del usuario conectado
			if(!isset($permiso_con)){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene acceso autorizado a esta vista</div>';
				echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
			//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
			}else if($permiso_con==0){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene acceso autorizado a esta vista</div>';
				echo "<script> window.location.href='".SERVERURL."home/'; </script>";
			}else{
				$datos_bitacora = 
				[
					"id_objeto" =>6,
					"fecha" => date('Y-m-d H:i:s'),
					"id_usuario" => $_SESSION['id_login'],//cambiar aqui para que me pueda traer el USU conectado
					"accion" => "Cambio de vista",
					"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la Vista de Mantenimiento de Usuarios"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			}

			$SQL_parametro="SELECT valor FROM TBL_ms_parametros where parametro='ADMIN_DIAS_VIGENCIA'";
			$dato_parametro = mysqli_query($conexion, $SQL_parametro);

			if($dato_parametro -> num_rows >0){
				while($fila=mysqli_fetch_array($dato_parametro)){
					$vigencia=$fila['valor'];

				}
			}
?>

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-users-cog"></i> &nbsp; USUARIOS
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<div class="btn btn-dark btn-lg" data-toggle="modal" data-target="#ModalCrear"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR USUARIO</div>
		</li>
	</ul>	
</div>


<?php
include ("./cone.php");
$where="";

if(isset($_GET['enviar'])){
  $busqueda = $_GET['busqueda'];


	if (isset($_GET['busqueda'])){
		$where="WHERE TBL_usuarios.usuario LIKE'%".$busqueda."%' OR nombre_usuario  LIKE'%".$busqueda."%'";
	}
}
?>

		</form>
<div class="container-fluid">
  <form class="d-flex">
      <input class="form-control me-2 light-table-filter" data-table="table_id" type="text" 
      placeholder="Buscar usuario">
      <hr>
      </form>
</div>
      <table class="table table-striped table-dark table_id text-center" id="tblDatos">
                <thead>    
					<tr>
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
                <tbody>

				<?php
					include ("./cone.php");              
					$SQL="SELECT u.id_usuario, u.usuario, u.nombre_usuario, u.estado_usuario, r.rol,u.correo_electronico,
					u.creado_por FROM TBL_usuarios u
					inner JOIN TBL_ms_roles r ON r.id_rol = u.id_rol
					$where";
					$dato = mysqli_query($conexion, $SQL);

					if($dato -> num_rows >0){
						while($fila=mysqli_fetch_array($dato)){
					
				?>
				<tr>
				<td><?php echo $fila['usuario']; ?></td>
				<td><?php echo $fila['nombre_usuario']; ?></td>
				<td><?php echo $fila['estado_usuario']; ?></td>
				<td><?php echo $fila['rol']; ?></td>
				<td><?php echo $fila['correo_electronico']; ?></td>
				<td><?php echo $fila['creado_por']?></td>
				<td>
				<div class="btn btn-success" data-toggle="modal" data-target="#ModalActualizar<?php echo $fila['id_usuario'];?>">
					<i class="fas fa-sync-alt"> </i>
				</div>
						<!-- Modal actualizar-->
						<div class="modal fade" id="ModalActualizar<?php echo $fila['id_usuario'];?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<?php
							if(!isset($permiso_act)){
								echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para actualizar un usuario</div>';
								echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
							//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
							}else if($permiso_act==0){
								echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para actualizar un usuario
								<button type="button" class="close" data-dismiss="alert" onclick="window.location.reload()">X</button>
								</div>';
							}else{
						?>
							<div class="modal-dialog" role="document">
								<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Actualizar Usuario</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form action="<?php echo SERVERURL; ?>ajax/usuarioAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
									<div class="row">
										<div class="col-10 col-md-6">
											<div class="form-group">
												<label class="color-label">Usuario</label>
												<input type="text" class="form-control" name="usuario_actu" id="nom_usuario" 
												style="text-transform:uppercase;" value="<?php echo $fila['usuario']?>" >
											</div>
										</div>
										
										<div class="col-12 col-md-6">
											<div class="form-group">
												<label class="color-label">Nombre</label>
												<input type="text" class="form-control" name="nombre_usuario_actu" id="nombre_usuario" 
												style="text-transform:uppercase;" value="<?php echo $fila['nombre_usuario']?>" >
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="color-label">Correo</label>
										<input type="email" class="form-control" name="correo_electronico_actu" id="correo_electronico" 
										 value="<?php echo $fila['correo_electronico']?>">
									</div>
									<div class="form-group">
										<input type="hidden" pattern="" class="form-control" name="id_actualizacion" value="<?php echo $fila['id_usuario'];?>">
										<input type="hidden" pattern="" class="form-control" name="usuario_modificacion" value="<?php echo $_SESSION['usuario_login']?>">					
									</div>
									<div class="row">
										<div class="col-10 col-md-4">
											<div class="form-group">
												<label class="color-label">Vencimiento</label>
												<input type="hidden" pattern="" class="form-control" name="usuario_creacion" value="<?php echo $_SESSION['usuario_login']?>">
												<?php $fcha = date("Y-m-d");?>
												<input type="date" class="form-control" name="fecha_vencimiento_actu" id="fecha_vencimiento" 
												value="<?php echo date("Y-m-d",strtotime($fcha."+ 360 days"))?>" disabled>
											</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="form-group">
													<label class="color-label">Estado</label>
													<select class="form-control" name="estado_actu" required>
														<option value="1">Activo</option>
														<option value="2">Inactivo</option>
														<option value="3">Bloqueado</option>
														<option value="4">Nuevo</option> 
													</select>
												</div>
										</div>
										<div class="col-12 col-md-4">
											<div class="form-group">
												<label class="color-label">Roles</label>
													<select class="form-control" name="id_rol_actu">
														<option value="1">ADMIN SISTEMA</option>
														<option value="2">ADMIN INVENTARIO</option>
														<option value="3">VENDEDOR</option>
														<option value="4">DEFAULT</option>
													</select>
												</div>
										</div>
									</div>
									<br>
										<button type="submit" class="btn btn-primary">Guardar</button>
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
										</form>
									</div>
								</div>
							</div>
							<?php
								}
							?>
					</div>
			</td>
				<td>
					<form class="FormularioAjax" action="<?php echo SERVERURL; ?>ajax/usuarioAjax.php" method="POST" data-form="delete" autocomplete="off">
					<input type="hidden" pattern="" class="form-control" name="id_usuario_del" value="<?php echo $fila['id_usuario'] ?>">
					<input type="hidden" pattern="" class="form-control" name="usuario_del" value="<?php echo $fila['usuario'] ?>">	
					<button type="submit" class="btn btn-warning">
						<i class="far fa-trash-alt"></i>
					</button>
					</form>
				</td>
				</tr>


		<?php
			}
		}else{
		?>
    <tr class="text-center">
    <td colspan="16">No existen registros</td>
    </tr>

    <?php 
		}
	?>
	</body>
  </table>
<div id="paginador" class=""></div>	
<div class="container-fluid"></div>


<!-- Modal crear-->
<div class="modal fade" id="ModalCrear" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<?php
	if(!isset($permiso_in)){
		echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para crear un usuario</div>';
		echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
	//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
	}else if($permiso_in==0){
		echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para crear un usuario
		<button type="button" class="close" data-dismiss="alert" onclick="window.location.reload()">X</button>
		</div>';
	}else{
?>  
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo Usuario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>

      </div>
      <div class="modal-body text-center">
			<form action="<?php echo SERVERURL; ?>ajax/usuarioAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
			<div class="row">
					<div class="col-10 col-md-6">
						<div class="form-group">
							<label class="color-label">Usuario</label>
							<input type="text" class="form-control" name="usuario_reg" id="nom_usuario" 
							style="text-transform:uppercase;" required="" >
						</div>
					</div>
					
					<div class="col-12 col-md-6">
						<div class="form-group">
							<label class="color-label">Nombre</label>
							<input type="text" class="form-control" name="nombre_usuario_reg" id="nombre_usuario" 
							style="text-transform:uppercase;" required="" >
						</div>
					</div>
				</div>
						<div class="form-group">
							<label class="color-label">Correo</label>
							<input type="email" class="form-control" name="correo_electronico_reg" id="correo_electronico" required="">
						</div>
				<div class="row">
					<div class="col-10 col-md-6">
						<div class="form-group">
							<label class="color-label">Contraseña</label>
							<input type="password" class="form-control" name="contrasena_reg" id="contrasena" pattern="[a-zA-Z0-9!#%&/()=?¡*+_$@.-]{8,100}" maxlength="10" required="" >
						</div>
					</div>
					<div class="col-12 col-md-6">
						<div class="form-group">
							<label class="color-label">Confirmar Contraseña</label>
							<input type="password" class="form-control" name="conf_contrasena_reg" id="conf_contrasena" pattern="[a-zA-Z0-9!#%&/()=?¡*+_$@.-]{8,100}" maxlength="10" required="" >
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-10 col-md-4">
						<div class="form-group">
							<label class="color-label">Vencimiento</label>
							<input type="hidden" pattern="" class="form-control" name="usuario_creacion" value="<?php echo $_SESSION['usuario_login']?>">
							<?php $fcha = date("Y-m-d");?>
							<input type="date" class="form-control" name="fecha_vencimiento_reg" id="fecha_vencimiento" value="<?php echo date("Y-m-d",strtotime($fcha."+ 360 days"))?>" disabled>
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
								<label class="color-label">Estado</label>
								<select class="form-control" name="estado" disabled>
									<option value="" disabled>Seleccione...</option>
									<option value="1">Activo</option>
									<option value="2">Inactivo</option>
									<option value="3">Bloqueado</option>
									<option value="4" selected="">Nuevo</option> 
								</select>
							</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label class="color-label">Roles</label>
							<select class="form-control" name="rol_nuevo" required>
								<option value="" selected="" disabled="">Seleccione una opción</option>
								<?php
								$SQL="SELECT * FROM TBL_ms_roles";
									$dato = mysqli_query($conexion, $SQL);
						
									if($dato -> num_rows >0){
										while($fila=mysqli_fetch_array($dato)){
											echo '<option value="'.$fila['id_rol'].'">'.$fila['rol'].'</option>';
											}
										}
								?>
							</select>
							</div>
					</div>
				</div>
				<br>
			<button type="submit" class="btn btn-primary">Guardar</button>
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			</form>
      </div>
    </div>
  </div>
  <?php
		}
	?>
</div>