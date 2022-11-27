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
  <form class="d-flex" action="../pdf/descuentopdf.php" method="post" accept-charset="utf-8">
  	<input class="form-control me-2 light-table-filter" data-table="table_id" type="text" name="filtrodescuento" placeholder="Buscar descuento">
	<button type="submit" class="btn btn-danger mx-auto btn-lg"><i class="fas fa-file-pdf"></i> &nbsp;Descargar Reporte</button>
      </form>
  </div>
  </div>

  </div>


      <table class="table table-striped table-dark table_id text-center" id="tblDatos">                   
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
<td><?php echo ($fila['porcentaje_descuento']*100); ?>%</td>
<td>
				<div class="btn btn-success" data-toggle="modal" data-target="#ModalActualizar<?php echo $fila['id_descuentos'];?>">
					<i class="fas fa-sync-alt"> </i>
				</div>
						<!-- Modal actualizar-->
						<div class="modal fade" id="ModalActualizar<?php echo $fila['id_descuentos'];?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						
							<div class="modal-dialog" role="document">
								<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Actualizar Descuento</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
								<form action="<?php echo SERVERURL; ?>ajax/descuentosAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
								<div class="form-group">
									<label class="color-label">Nombre del descuento</label>
									<input type="text" class="form-control" name="nombre_descuento_actu" id="nombre_pro" style="text-transform:uppercase;" 
									value="<?php echo $fila['nom_descuento'] ?>" required>
								</div>
								<div class="form-group">
									<label for="precio_producto_nuevo" class="color-label">% del descuento</label>
									<input type="number" class="form-control" name="porcentaje_descuento_nuevo" step="any" id="precio_pro" 
									value="<?php echo ($fila['porcentaje_descuento']*100) ?>" required>
								</div>
								<div class="form-group">
									<input type="hidden" class="form-control" name="id_actualizacion" value="<?php echo $fila['id_descuentos']?>">
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
	<input type="hidden" pattern="" class="form-control" name="id_producto_del" value="<?php echo $fila['id_descuentos'] ?>">
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