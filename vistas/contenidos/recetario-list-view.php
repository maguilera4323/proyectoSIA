<?php
	require_once "./pruebabitacora.php";

	$datos_bitacora = [
		"id_objeto" => 0,
		"fecha" => date('Y-m-d H:i:s'),
		"id_usuario" => $_SESSION['id_login'],
		"accion" => "Cambio de vista",
		"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la vista Recetario"
	];
	Bitacora::guardar_bitacora($datos_bitacora); 
?>

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-tools"></i> &nbsp; RECETARIO
	</h3>
</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<div class="btn btn-dark btn-lg" data-toggle="modal" data-target="#ModalCrear"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR RECETA</div>
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
			$where="WHERE TBL_recetario.receta LIKE'%".$busqueda."%'";
		}
	}
?>

</form>
<div class="container-fluid">
  <form class="d-flex">
      <input class="form-control me-2 light-table-filter" data-table="table_id" type="text" 
      placeholder="Buscar receta">
      <hr>
</form>
</div>
      <table class="table table-striped table-dark table_id text-center" id="tblDatos">
        <thead>    
        <tr>
            <th>ID PRODUCTO</th>
            <th>ID INSUMO</th>
			<th>CANTIDAD INSUMO</th>
            <th>ACTUALIZAR</th>
			<th>ELIMINAR</th>
            </tr>
        </thead>
        <tbody>

		<?php
			include ("./cone.php");              
			$SQL="SELECT * FROM TBL_recetario
			$where";
			$dato = mysqli_query($conexion, $SQL);

			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
				
			?>
		<tr>
			<td><?php echo $fila['id_producto']; ?></td>
			<td><?php echo $fila['id_insumo']; ?></td>
			<td><?php echo $fila['cant_insumo']; ?></td>
			<td>
				<div class="btn btn-success" data-toggle="modal" data-target="#ModalActualizar<?php echo $fila['id_parametro'];?>">
					<i class="fas fa-sync-alt"> </i>
				</div>
						<!-- Modal actualizar-->
						<div class="modal fade" id="ModalActualizar<?php echo $fila['id_parametro'];?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Actualizar Parametro</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form action="<?php echo SERVERURL; ?>ajax/parametroAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
										<div class="form-group">
											<label>Nombre del Parametro</label>
											<input type="text" class="form-control" name="nombre_parametro_act" id="cliente_dni"  style="text-transform:uppercase;"
											value="<?php echo $fila['parametro']?>" required>
										</div>
										<div class="form-group">
											<label>Valor</label>
											<input type="text" class="form-control" name="valor_parametro_act" id="cliente_dni" 
											value="<?php echo $fila['valor']?>" required>
											<input type="hidden" class="form-control" name="id_actualizacion" value="<?php echo $fila['id_parametro']?>">
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
				<form class="FormularioAjax" action="<?php echo SERVERURL; ?>ajax/parametroAjax.php" method="POST" data-form="delete" autocomplete="off">
				<input type="hidden" pattern="" class="form-control" name="id_parametro_del" value="<?php echo $fila['id_parametro'] ?>">
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
        <h5 class="modal-title" id="exampleModalLabel">Nueva Receta</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>

      </div>
      <div class="modal-body text-center">
			<form action="<?php echo SERVERURL; ?>ajax/recetarioAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
			<div class="form-group">
			<label for="id_producto" class="bmd-label-floating">Id Producto</label>
							<select class="form-control" name="recetario_nuevo" id="Id_producto_nuevo">
								<option value="0">Seleccione una opción</option>
								<?php
								include ("./cone.php");   
								$tipo="SELECT * FROM TBL_producto";
								$resultado=mysqli_query($conexion, $tipo);
								while ($valores = mysqli_fetch_array($resultado)){
									echo '<option value="'.$valores['id_producto'].'">'.$valores['nom_producto'].'</option>';
								}
								?>
							</select>
			</div>
			<div class="form-group">
			<label for="id_insumo" class="bmd-label-floating">Id Insumo</label>
							<select class="form-control" name="Id_insumo_nuevo" id="Id_insumo_nuevo">
								<option value="0">Seleccione una opción</option>
								<?php
								include ("./cone.php");   
								$tipo="SELECT * FROM TBL_insumos";
								$resultado=mysqli_query($conexion, $tipo);
								while ($valores = mysqli_fetch_array($resultado)){
									echo '<option value="'.$valores['id_insumos'].'">'.$valores['nom_insumo'].'</option>';
								}
								?>
							</select>
				<div class="form-group">
				<label>Cantidad Insumo</label>
				<input type="text" class="form-control" name="cant_insumo_nuevo" id="id_insumo" required>
			</div>
			<button type="submit" class="btn btn-primary">Guardar</button>
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			</form>
      </div>
    </div>
  </div>
</div>





