<?php
	require_once "./pruebabitacora.php";
	include ("./cone.php");  
	
		//verifica si hay sesiones iniciadas
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}    

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT * FROM TBL_permisos where id_rol='$id_rol' and id_objeto=3";
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
					"id_objeto" => 3,
					"fecha" => date('Y-m-d H:i:s'),
					"id_usuario" => $_SESSION['id_login'],//cambiar aqui para que me pueda traer el USU conectado
					"accion" => "Cambio de vista",
					"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la Vista de Insumos"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			}
?>


<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-pallet fa-fw"></i> &nbsp; INSUMOS
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<div class="btn btn-dark btn-lg" data-toggle="modal" data-target="#ModalCrear"><i class="fas fa-plus fa-fw"></i> &nbsp; NUEVO INSUMO</div>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>inventario-list/"><div class="btn btn-dark btn-lg"><i class="fas fa-warehouse"></i> &nbsp; INVENTARIO DISPONIBLE</div></a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>movimiento-inventario/"><div class="btn btn-danger btn-lg"><i class="fas fa-dolly-flatbed"></i> &nbsp; MOVIMIENTOS DE INVENTARIO</div></a>
		</li>
		
	</ul>	
</div>

<?php
include ("./cone.php");
$where="";

if(isset($_GET['enviar'])){
  $busqueda = $_GET['busqueda'];


	if (isset($_GET['busqueda'])){
		$where="WHERE TBL_insumos.nom_insumo LIKE'%".$busqueda."%'";
	}
}
?>

<div class="container-fluid">
  <form class="d-flex" action="../pdf/pdfInsumos.php" method="post" accept-charset="utf-8">
  	<input class="form-control me-2 light-table-filter" data-table="table_id" type="text" name="filtroinsumo" placeholder="Buscar Insumo">
	<button type="submit" class="btn btn-danger mx-auto btn-lg"><i class="fas fa-file-pdf"></i> &nbsp;Descargar Reporte</button>
      </form>
  </div>

 
<table class="table table-striped table-dark table_id text-center" id="tblDatos">
        <thead>    
            <tr>
                <th>NOMBRE</th>
                <th>CATEGORIA</th>
                <th>CANTIDAD MAXIMA</th>
                <th>CANTIDAD MINIMA</th>
                <th>UNIDAD DE MEDIDA</th>
				<th>ACTUALIZAR</th>
				<th>ELIMINAR</th>
            </tr>
        </thead>
        <tbody>
			<?php
				include ("./cone.php");              
				$SQL="SELECT i.id_insumos, i.nom_insumo, c.nom_categoria, i.cant_max, i.cant_min,i.unidad_medida FROM TBL_insumos i
				inner JOIN TBL_categoria_produ c ON c.id_categoria = i.id_categoria
				$where";
				$dato = mysqli_query($conexion, $SQL);

				if($dato -> num_rows >0){
					while($fila=mysqli_fetch_array($dato)){
					
			?>
			<tr>
				<td><?php echo $fila['nom_insumo']; ?></td>
				<td><?php echo $fila['nom_categoria']; ?></td>
				<td><?php echo $fila['cant_max']; ?></td>
				<td><?php echo $fila['cant_min']; ?></td>
				<td><?php echo $fila['unidad_medida']; ?></td>
				<td>
				<div class="btn btn-success" data-toggle="modal" data-target="#ModalActualizar<?php echo $fila['id_insumos'];?>">
					<i class="fas fa-sync-alt"> </i>
				</div>
						<!-- Modal actualizar-->
						<div class="modal fade" id="ModalActualizar<?php echo $fila['id_insumos'];?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<?php
							if(!isset($permiso_act)){
								echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para actualizar un insumo</div>';
								echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
							//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
							}else if($permiso_act==0){
								echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para actualizar un insumo
								<button type="button" class="close" data-dismiss="alert" onclick="window.location.reload()">X</button>
								</div>';
							}else{
						?>
							<div class="modal-dialog" role="document">
								<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Actualizar Insumo</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form action="<?php echo SERVERURL; ?>ajax/insumoAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
									<div class="row">
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label class="color-label">Nombre</label>
													<input type="text" class="form-control" name="nombre_insumo_act" id="cliente_apellido"  
													style="text-transform:uppercase;" value="<?php echo $fila['nom_insumo']?>" required>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label class="color-label">Categoria</label>
													<select class="form-control" name="categoria_insumo_act" required>
														<option value="1">Comestibles</option>
														<option value="2">Equipo</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label class="color-label">Cantidad Maxima</label>
													<input type="text" class="form-control" name="cantidadmax_insumo_act" id="cliente_direccion"
													value="<?php echo $fila['cant_max']?>" required>
												</div>
											</div>
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label class="color-label">Cantidad Minima</label>
													<input type="text" class="form-control" name="cantidadmin_insumo_act" id="cliente_telefono" 
													value="<?php echo $fila['cant_min']?>" required>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-12 col-md-6">
												<div class="form-group">
													<label class="color-label">Unidad de medida</label>
													<select class="form-control" name="unidad_insumo_act" required>
														<option value="1">LB</option>
														<option value="2">UN</option>
														<option value="3">L</option>
														<option value="4">GAL</option>
													</select>
												</div>
											</div>
											<div class="col-12 col-md-4">
												<div class="form-group">
													<input type="hidden" pattern="" class="form-control" name="id_actualizacion" value="<?php echo $fila['id_insumos']; ?>>">
												</div>
											</div>
										</div>
										<BR>
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
					<form class="FormularioAjax" action="<?php echo SERVERURL; ?>ajax/insumoAjax.php" method="POST" data-form="delete" autocomplete="off">
					<input type="hidden" pattern="" class="form-control" name="id_insumo_del" value="<?php echo $fila['id_insumos'] ?>">	
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
		echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para crear un insumo</div>';
		echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
	//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
	}else if($permiso_in==0){
		echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para crear un insumo
		<button type="button" class="close" data-dismiss="alert" onclick="window.location.reload()">X</button>
		</div>';
	}else{
?>
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo Insumo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
			<form action="<?php echo SERVERURL; ?>ajax/insumoAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
				<div class="row">
						<div class="col-12 col-md-6">
							<div class="form-group">
								<label class="color-label">Nombre</label>
								<input type="text" class="form-control" name="nombre_insumo_nuevo" id="cliente_apellido" maxlength="40" 
								style="text-transform:uppercase;" required/>
							</div>
						</div>
						<div class="col-12 col-md-6">
							<div class="form-group">
								<label class="color-label">Categoria</label>
								<select class="form-control hola" name="categoria_insumo_nuevo" required>
									<option value="" selected="" disabled="">Seleccione una opción</option>
									<option value="1">Comestibles</option>
									<option value="2">Equipo</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12 col-md-6">
							<div class="form-group">
								<label class="color-label">Cantidad Maxima</label>
								<input type="text" class="form-control" name="cantidadmax_insumo_nuevo" id="cliente_direccion"  required/>
							</div>
						</div>
						<div class="col-12 col-md-6">
							<div class="form-group">
								<label class="color-label">Cantidad Minima</label>
								<input type="text" class="form-control" name="cantidadmin_insumo_nuevo" id="cliente_telefono"  required/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12 col-md-6">
							<div class="form-group">
								<label class="color-label">Unidad de medida</label>
								<select class="form-control" name="unidad_insumo_nuevo" required>
									<option value="" selected="" disabled="">Seleccione una opción</option>
									<option value="1">LB</option>
									<option value="2">UN</option>
									<option value="3">L</option>
									<option value="4">GAL</option>
								</select>
							</div>
						</div>
					</div>
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