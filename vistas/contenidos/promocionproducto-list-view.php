<?php
	require_once "./pruebabitacora.php";
		include ("./cone.php");     

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT * FROM TBL_permisos where id_rol='$id_rol' and id_objeto=13";
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
					"id_objeto" => 13,
					"fecha" => date('Y-m-d H:i:s'),
					"id_usuario" => $_SESSION['id_login'],//cambiar aqui para que me pueda traer el USU conectado
					"accion" => "Cambio de vista",
					"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la Vista del Recetario"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			}
?>

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-tools"></i> &nbsp; PROMOCIONES DE PRODUCTOS
	</h3>
</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<div class="btn btn-dark btn-lg" data-toggle="modal" data-target="#ModalCrear"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PROMOCION DE PRODUCTOS</div>
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
			$where="WHERE TBL_promociones_productos.promocionproducto LIKE'%".$busqueda."%'";
		}
	}
?>

<div class="container-fluid">
  <form class="d-flex" action="../pdf/promocionproductopdf.php" method="post" accept-charset="utf-8">
  	<input class="form-control me-2 light-table-filter" data-table="table_id" type="text" name="filtropromocionproducto" placeholder="Buscar Promocion ">
	<button type="submit" class="btn btn-danger mx-auto btn-lg"><i class="fas fa-file-pdf"></i> &nbsp;Descargar Reporte</button>
      </form>
  </div>
  </div>

      <table class="table table-striped table-dark table_id text-center" id="tblDatos">
        <thead>    
        <tr>
            <th>PROMOCION</th>
            <th>PRODUCTO</th>
			<th>CANTIDAD</th>
            <th>ACTUALIZAR</th>
			<th>ELIMINAR</th>
            </tr>
        </thead>
        <tbody>

		<?php
			include ("./cone.php");              
			$SQL="SELECT pr.id_promociones, pr.nom_promocion, p.id_producto, p.nom_producto, pp.id_promociones_productos, pp.cantidad FROM TBL_promociones_productos pp
			inner JOIN TBL_promociones pr ON pr.id_promociones = pp.id_promociones
			inner JOIN TBL_producto p ON p.id_producto = pp.id_producto
			$where";
			$dato = mysqli_query($conexion, $SQL);
		

			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
				
			?>
		<tr>
			<td><?php echo $fila['nom_promocion']; ?></td>
			<td><?php echo $fila['nom_producto']; ?></td>
			<td><?php echo $fila['cantidad']; ?></td>
			<td>
				<div class="btn btn-success" data-toggle="modal" data-target="#ModalActualizar<?php echo $fila['id_promociones_productos'];?>">
					<i class="fas fa-sync-alt"> </i>
				</div>
						<!-- Modal actualizar-->
						<div class="modal fade" id="ModalActualizar<?php echo $fila['id_id_promociones_productos'];?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<?php
							if(!isset($permiso_act)){
								echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para actualizar una promocion de productos</div>';
								echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
							//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
							}else if($permiso_act==0){
								echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para actualizar una promocion de productos
								<button type="button" class="close" data-dismiss="alert" onclick="window.location.reload()"X</button>
								</div>';
							}else{
						?>
							<div class="modal-dialog" role="document">
								<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Actualizar Promocion de producto</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body text-center">
								<form action="<?php echo SERVERURL; ?>ajax/promocionproductoAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
								<div class="form-group">
								<label class="color-label">Promocion</label>
									<select class="form-control" name="promocionproducto_act" id="Id_promocionproducto_nuevo">
										<?php
											include ("./cone.php");   
											$tipo="SELECT * FROM TBL_promociones";
											$resultado=mysqli_query($conexion, $tipo);
											while ($valores = mysqli_fetch_array($resultado)){
											echo '<option value="'.$valores['id_promociones'].'">'.$valores['nom_promocion'].'</option>';
											}
										?>
									</select>
								</div>
								<div class="form-group">
								<label class="color-label">Producto</label>
								<select class="form-control" name="Id_producto_act" id="Id_producto_act">
									<?php
									include ("./cone.php");   
									$tipo="SELECT * FROM TBL_producto";
									$resultado=mysqli_query($conexion, $tipo);
									while ($valores = mysqli_fetch_array($resultado)){
									echo '<option value="'.$valores['id_producto'].'">'.$valores['nom_producto'].'</option>';
									}
									?>
								</select>
								</select>
								</div>
								
								
								<div class="form-group">
								<label class="color-label">Cantidad</label>
								<input type="text" class="form-control" name="cantidad_act" value="<?php echo $fila['cantidad']; ?>" id="id_insumo" step="any" required>
								<input type="hidden" class="form-control" name="id_actualizacion" value="<?php echo $fila['id_promociones_productos']?>">
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
			</td>
			<td>
				<form class="FormularioAjax" action="<?php echo SERVERURL; ?>ajax/promocionproductoAjax.php" method="POST" data-form="delete" autocomplete="off">
				<input type="hidden" pattern="" class="form-control" name="promocionproducto_del" value="<?php echo $fila['id_promociones_productos'] ?>">
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
<?php
	if(!isset($permiso_in)){
		echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para crear una Promocion de producto</div>';
		echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
	//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
	}else if($permiso_in==0){
		echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para crear una una Promocion de producto
		<button type="button" class="close" data-dismiss="alert" onclick="window.location.reload()">X</button>
		</div>';
	}else{
?>  
<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nueva Promocion de Productos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>

      </div>
      <div class="modal-body text-center">
			<form action="<?php echo SERVERURL; ?>ajax/promocionproductoAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
			<div class="form-group">
			<label class="color-label">Promocion</label>
							<select class="form-control" name="promocionproducto_nuevo" id="Id_promocionproducto_nuevo">
								<option value="0">Seleccione una opción</option>
								<?php
								include ("./cone.php");   
								$tipo="SELECT * FROM TBL_promociones";
								$resultado=mysqli_query($conexion, $tipo);
								while ($valores = mysqli_fetch_array($resultado)){
									echo '<option value="'.$valores['id_promociones'].'">'.$valores['nom_promocion'].'</option>';
								}
								?>
							</select>
			</div>
			<div class="form-group">
			<label class="color-label">Producto</label>
							<select class="form-control" name="Id_producto_nuevo" id="Id_insumo_nuevo">
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
				<label class="color-label">Cantidad</label>
				<input type="text" class="form-control" name="cant_promocionproducto_nuevo" id="id_insumo" step="any" required>
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





