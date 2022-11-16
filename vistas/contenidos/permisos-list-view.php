<?php
	require_once "./pruebabitacora.php";

	$datos_bitacora = [
		"id_objeto" => 0,
		"fecha" => date('Y-m-d H:i:s'),
		"id_usuario" => $_SESSION['id_login'],
		"accion" => "Cambio de vista",
		"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la vista de Permisos"
	];
	Bitacora::guardar_bitacora($datos_bitacora); 
?>

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-id-card-alt"></i> &nbsp; PERMISOS
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<div class="btn btn-dark btn-lg" data-toggle="modal" data-target="#ModalCrear"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PERMISO</div>
		</li>
		</ul>	
</div>

<?php
	include ("./cone.php");
	$where="";

	if(isset($_GET['enviar'])){
	$busqueda = $_GET['busqueda'];


		if (isset($_GET['busqueda'])){
			$where="WHERE TBL_ms_roles.rol LIKE'%".$busqueda."%'";
		}
	}
?>

</form>
<div class="container-fluid">
  <form class="d-flex">
      <input class="form-control me-2 light-table-filter" data-table="table_id" type="text" 
      placeholder="Buscar rol">
      <hr>
</form>
</div>
      <table class="table table-striped table-dark table_id text-center" id="tblDatos">
        <thead>    
        <tr>
			<th>ROL</th>
            <th>OBJETO</th>
            <th>PERMISO INSERCION</th>
			<th>PERMISO ACTUALIZACION</th>
			<th>PERMISO ELIMINACION</th>
			<th>PERMISO CONSULTA</th>
            <th>ACTUALIZAR</th>
			<th>ELIMINAR</th>
            </tr>
        </thead>
        <tbody>

		<?php
			include ("./cone.php");              
			$SQL="SELECT r.id_rol,r.rol, o.objeto, p.permiso_insercion,p.permiso_actualizacion,
			p.permiso_eliminacion, p.permiso_consulta,o.id_objeto FROM TBL_permisos p
					inner JOIN TBL_ms_roles r ON r.id_rol = p.id_rol
					inner JOIN TBL_objetos o ON o.id_objeto = p.id_objeto;
			$where";
			$dato = mysqli_query($conexion, $SQL);

			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
				
			?>
		<tr>
			<td><?php echo $fila['rol']; ?></td>
			<td><?php echo $fila['objeto']; ?></td>
			<?php
				if($fila['permiso_insercion']==1){
			?>
			<td><i class="fas fa-check"></i></td>
			<?php
				}else{
			?>
			<td><i class="fas fa-ban" style="color: red;"></i></td>
			<?php
				}
			?>
			<?php
				if($fila['permiso_actualizacion']==1){
			?>
			<td><i class="fas fa-check"></i></td>
			<?php
				}else{
			?>
			<td><i class="fas fa-ban" style="color: red;"></i></td>
			<?php
				}
			?>
			<?php
				if($fila['permiso_eliminacion']==1){
			?>
			<td><i class="fas fa-check"></i></td>
			<?php
				}else{
			?>
			<td><i class="fas fa-ban" style="color: red;"></i></td>
			<?php
				}
			?>
			<?php
				if($fila['permiso_consulta']==1){
			?>
			<td><i class="fas fa-check"></i></td>
			<?php
				}else{
			?>
			<td><i class="fas fa-ban" style="color: red;"></i></td>
			<?php
				}
			?>
			<td>
				<div class="btn btn-success" data-toggle="modal" data-target="#ModalActualizar<?php echo $fila['id_rol'];?><?php echo $fila['id_objeto'];?>">
					<i class="fas fa-sync-alt"> </i>
				</div>
						<!-- Modal actualizar-->
						<div class="modal fade" id="ModalActualizar<?php echo $fila['id_rol'];?><?php echo $fila['id_objeto'];?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Actualizar Permiso</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
								<div class="modal-body ">
									<form action="<?php echo SERVERURL; ?>ajax/permisoAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
									<div class="form-group">
										<input type="hidden" class="form-control" name="id_objeto" value="<?php echo $fila['id_objeto']?>">
										<input type="hidden" class="form-control" name="id_rol" value="<?php echo $fila['id_rol']?>">
									</div>
									<div class="form-group">
										<label>Rol</label>
										<input type="text" class="form-control" id="cliente_dni" style="text-transform:uppercase;" value="<?php echo $fila['rol']?>" disabled>
									</div>
									<div class="form-group">
										<label>Objeto</label>
										<input type="text" class="form-control" id="cliente_dni" style="text-transform:uppercase;"
										value="<?php echo $fila['objeto']?>" disabled>
									</div>
									<div class="form-group">
										<div class="form-group">
										<label>Permisos</label>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" name="insertar_permiso_act" value="1" id="defaultCheck1">
											<label class="form-check-label" for="defaultCheck1" value="<?php echo $fila['permiso_insercion']?>">Insertar</label>
											</div>
											<div class="form-check">
											<input class="form-check-input" type="checkbox" name="actualizar_permiso_act" value="1" id="defaultCheck1">
											<label class="form-check-label" for="defaultCheck1">Actualizar</label>
											</div>
											<div class="form-check">
											<input class="form-check-input" type="checkbox" name="eliminar_permiso_act" value="1" id="defaultCheck1">
											<label class="form-check-label" for="defaultCheck1">Eliminar</label>
											</div>
											<div class="form-check">
											<input class="form-check-input" type="checkbox" name="consultar_permiso_act" value="1" id="defaultCheck1">
											<label class="form-check-label" for="defaultCheck1">Consultar</label>
											</div>
											</div>
											<button type="submit" class="btn btn-primary text-center">Guardar</button>
											<button type="button" class="btn btn-secondary text-center" data-dismiss="modal">Cerrar</button>
										</form>
									</div>
								</div>
							</div>
					</div>
			</td>
			<td>
			<form class="FormularioAjax" action="<?php echo SERVERURL; ?>ajax/permisoAjax.php" method="POST" data-form="delete" autocomplete="off">
				<input type="hidden" pattern="" class="form-control" name="id_objeto_del" value="<?php echo $fila['id_objeto'] ?>">
				<input type="hidden" pattern="" class="form-control" name="id_rol_del" value="<?php echo $fila['id_rol'] ?>">
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
		</tbody>
  </table>

<div id="paginador" class=""></div>	
<div class="container-fluid"></div>


<!-- Modal crear-->
<div class="modal fade" id="ModalCrear" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Otorgar Permisos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body ">
			<form action="<?php echo SERVERURL; ?>ajax/permisoAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
			<div class="form-group">
				<label>Rol</label>
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
			<div class="form-group">
				<label>Objeto</label>
				<select class="form-control" name="objeto_nuevo" required>
					<option value="" selected="" disabled="">Seleccione una opción</option>
					<?php
					$SQL="SELECT * FROM TBL_objetos";
						$dato = mysqli_query($conexion, $SQL);
			
						if($dato -> num_rows >0){
							while($fila=mysqli_fetch_array($dato)){
								echo '<option value="'.$fila['id_objeto'].'">'.$fila['objeto'].'</option>';
								}
							}
						?>
				</select>
			</div>
			<div class="form-group">
				<div class="form-group">
				<label>Permisos</label>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" name="insertar_permiso" value="1" id="defaultCheck1">
					<label class="form-check-label" for="defaultCheck1">Insertar</label>
					</div>
					<div class="form-check">
					<input class="form-check-input" type="checkbox" name="actualizar_permiso" value="1" id="defaultCheck1">
					<label class="form-check-label" for="defaultCheck1">Actualizar</label>
					</div>
					<div class="form-check">
					<input class="form-check-input" type="checkbox" name="eliminar_permiso" value="1" id="defaultCheck1">
					<label class="form-check-label" for="defaultCheck1">Eliminar</label>
					</div>
					<div class="form-check">
					<input class="form-check-input" type="checkbox" name="consultar_permiso" value="1" id="defaultCheck1">
					<label class="form-check-label" for="defaultCheck1">Consultar</label>
					</div>
			</div>
			<button type="submit" class="btn btn-primary text-center">Guardar</button>
			<button type="button" class="btn btn-secondary text-center" data-dismiss="modal">Cerrar</button>
			</form>
      </div>
    </div>
  </div>
</div>