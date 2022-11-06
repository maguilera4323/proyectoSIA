<?php
	require_once "./pruebabitacora.php";

	$datos_bitacora = [
		"id_objeto" => 0,
		"fecha" => date('Y-m-d H:i:s'),
		"id_usuario" => $_SESSION['id_login'],
		"accion" => "Cambio de vista",
		"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la vista de Roles"
	];
	Bitacora::guardar_bitacora($datos_bitacora); 
?>

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-user-tie"></i> &nbsp; ROLES
	</h3>
</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<div class="btn btn-dark btn-lg" data-toggle="modal" data-target="#ModalCrear"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR ROL</div>
		</li>
	</ul>	
</div>

<?php
	include ("./cone.php");
	$where="";

	if(isset($_GET['enviar'])){
	$busqueda = $_GET['busqueda'];


		if (isset($_GET['busqueda']))
		{
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
            <th>ID</th>
            <th>ROL</th>
            <th>DESCRIPCION</th>
            <th>CREADO POR</th>
            <th>ACTUALIZAR</th>
			<th>ELIMINAR</th>
            </tr>
        </thead>
        <tbody>

		<?php
			include ("./cone.php");              
			$SQL="SELECT * FROM TBL_ms_roles 
			$where";
			$dato = mysqli_query($conexion, $SQL);

			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
				
			?>
		<tr>
			<td><?php echo $fila['id_rol']; ?></td>
			<td><?php echo $fila['rol']; ?></td>
			<td><?php echo $fila['descripcion']; ?></td>
			<td><?php echo $fila['creado_por']; ?></td>
			<td>
				<div class="btn btn-success" data-toggle="modal" data-target="#ModalActualizar<?php echo $fila['id_rol'];?>">
					<i class="fas fa-sync-alt"> </i>
				</div>
						<!-- Modal actualizar-->
						<div class="modal fade" id="ModalActualizar<?php echo $fila['id_rol'];?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Actualizar Rol</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form action="<?php echo SERVERURL; ?>ajax/rolAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
										<div class="form-group">
											<label>Nombre del rol</label>
											<input type="text" class="form-control" name="nombre_rol_act" id="cliente_dni" maxlength="27" 
											value="<?php echo $fila['rol']?>" required>
										</div>
										<div class="form-group">
											<label>Descripción</label>
											<input type="text" class="form-control" name="desc_rol_act" id="cliente_dni" maxlength="100" 
											value="<?php echo $fila['descripcion']?>" required>
											<input type="hidden" class="form-control" name="id_actualizacion" value="<?php echo $fila['id_rol']?>">
										</div>
										<button type="submit" class="btn btn-primary">Guardar</button>
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
										</form>
									</div>
								</div>
							</div>
					</div>
			</td>
			<td>
				<form class="FormularioAjax" action="<?php echo SERVERURL; ?>ajax/rolAjax.php" method="POST" data-form="delete" autocomplete="off">
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
        <h5 class="modal-title" id="exampleModalLabel">Nuevo Rol</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
			<form action="<?php echo SERVERURL; ?>ajax/rolAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
			<div class="form-group">
				<label>Nombre del rol</label>
				<input type="text" class="form-control" name="nombre_rol_nuevo" id="cliente_dni" maxlength="27" required>
			</div>
			<div class="form-group">
				<label>Descripción</label>
				<textarea class="form-control" rows="3" name="desc_rol_nuevo" id="cliente_dni" maxlength="100" required></textarea>
			</div>
			<button type="submit" class="btn btn-primary">Guardar</button>
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			</form>
      </div>
    </div>
  </div>
</div>





