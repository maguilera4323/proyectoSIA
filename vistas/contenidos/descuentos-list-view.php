<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE DESCUENTOS
	</h3>
</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<div class="btn btn-dark btn-lg" data-toggle="modal" data-target="#ModalCrear"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR DESCUENTO</div>
		</li>
		</ul>
	</ul>	
</div>

<?php
include ("./cone.php");
$where="";

if(isset($_GET['enviar'])){
  $busqueda = $_GET['busqueda'];
	if (isset($_GET['busqueda']))
	{
		$where="WHERE TBL_descuentos.nom_descuento LIKE'%".$busqueda."%'";
	}
  
}


?>

<div class="container-fluid">
  <form class="d-flex" action="../pdf/productopdf.php" method="post" accept-charset="utf-8">
  	<input class="form-control me-2 light-table-filter" data-table="table_id" type="text" name="filtroproducto" placeholder="Buscar descuento">
	<button type="submit" class="btn btn-danger mx-auto btn-lg"><i class="fas fa-file-pdf"></i> &nbsp;Descargar Reporte</button>
      </form>
  </div>
  </div>

  </div>


      <table class="table table-striped table-dark table_id " id="tblDatos">                   
                    <thead>    
                         <tr>
                        <th>NOMBRE</th>
                        <th>PORCENTAJE</th>
                    	<th>ACTUALIZAR</th>
						<th>ELIMINAR</th>
                        </tr>
                    </thead>
                        <tbody>
				<?php

include ("./cone.php");              
$SQL="SELECT * FROM TBL_descuentos;
$where";
$dato = mysqli_query($conexion, $SQL);

if($dato -> num_rows >0){
    while($fila=mysqli_fetch_array($dato)){
    
?>
<tr>
<td><?php echo $fila['nom_descuento']; ?></td>
<td><?php echo $fila['porcentaje_descuento']; ?></td>
<td>
				<div class="btn btn-success" data-toggle="modal" data-target="#ModalActualizar<?php echo $fila['id_descuentos'];?>">
					<i class="fas fa-sync-alt"> </i>
				</div>
						<!-- Modal actualizar-->
						<div class="modal fade" id="ModalActualizar<?php echo $fila['id_descuentos'];?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						
							<div class="modal-dialog" role="document">
								<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Actualizar Pregunta</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
								<form action="<?php echo SERVERURL; ?>ajax/productoAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
								<div class="form-group">
									<label class="color-label">Nombre</label>
									<input type="text" class="form-control" name="nombre_producto_actu" id="nombre_pro" 
									style="text-transform:uppercase;" value="<?php echo $fila['nom_producto'] ?>" required>
								</div>
								<div class="form-group">
								<label class="color-label">Tipo Producto</label>
									<select class="form-control" name="id_tipo_producto_actu" id="id_tipo_producto_act">
										<?php
										include ("./cone.php");   
										$tipo="SELECT * FROM TBL_tipo_producto";
										$resultado=mysqli_query($conexion, $tipo);
											while ($valores = mysqli_fetch_array($resultado)){
												echo '<option value="'.$valores['id_tipo_produ'].'">'.$valores['tipo_producto'].'</option>';
											}
										?>
									</select>
								</div>
								<div class="form-group">
									<label for="descripcion_producto_nuevo" class="color-label">Descripcion</label>
									<input type="text" class="form-control" name="descripcion_producto_actu" id="descripcion_pro" 
									value="<?php echo $fila['des_produ'] ?>" required>
								</div>
								<div class="form-group">
									<label for="precio_producto_nuevo" class="color-label">Precio</label>
									<input type="text" class="form-control" name="precio_producto_actu" id="precio_pro" 
									value="<?php echo $fila['precio_produ'] ?>" required>
								</div>
								<div class="form-group">
									<label for="archivo" class="color-label">Agregar Imagen</label>
									<input type="file" class="form-control" name="foto" id="archivo" accept="image/*" 
									value="<?php echo $fila['foto_produ'] ?>" required>
								</div>
								<div class="form-group">
									<input type="hidden" class="form-control" name="id_actualizacion" value="<?php echo $fila['id_producto']?>">
								</div>
								<button type="submit" class="btn btn-primary justify-content-center">Guardar</button>
								<button type="button" class="btn btn-secondary justify-content-center" data-dismiss="modal">Cerrar</button>
								</form>
									</div>
								</div>
							</div>
					</div>
			</td>
<td>
	<form class="FormularioAjax" action="<?php echo SERVERURL; ?>ajax/productoAjax.php" method="POST" data-form="delete" autocomplete="off">
	<input type="hidden" pattern="" class="form-control" name="id_producto_del" value="<?php echo $fila['id_producto'] ?>">
	<input type="hidden" pattern="" class="form-control" name="producto_del" value="<?php echo $fila['nom_producto'] ?>">	
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

<div class="modal fade" id="ModalCrear" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo Descuento</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
			<form action="<?php echo SERVERURL; ?>ajax/descuentosAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
			<div class="form-group">
				<label class="color-label">Nombre del descuento</label>
				<input type="text" class="form-control" name="nombre_descuento_nuevo" id="nombre_pro" style="text-transform:uppercase;" required>
			</div>
			<div class="form-group">
				<label for="precio_producto_nuevo" class="color-label">% del descuento</label>
				<input type="number" class="form-control" name="porcentaje_descuento_nuevo" step="any" id="precio_pro" required>
			</div>
			<button type="submit" class="btn btn-primary">Guardar</button>
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			</form>
      </div>
    </div>
  </div>
</div>