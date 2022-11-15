<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PRODUCTOS
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>producto-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PRODUCTO</a>
		</li>
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>producto-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PRODUCTOS</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>Tipo-Producto-new/"><i class="fas fa-search fa-fw"></i> &nbsp; AGREGAR TIPO DE PRODUCTO</a>
		</li>
		</ul>	
</div>

<<?php
include ("./cone.php");
$where="";

if(isset($_GET['enviar'])){
  $busqueda = $_GET['busqueda'];


	if (isset($_GET['busqueda']))
	{
		$where="WHERE TBL_Producto.nom_producto LIKE'%".$busqueda."%' OR id_tipo_produ LIKE'%".$busqueda."%'";
	}
  
}


?>

			</form>
      <div class="container-fluid">
  <form class="d-flex">
      <input class="form-control me-2 light-table-filter" data-table="table_id" type="text" 
      placeholder="Buscar Producto">
      <hr>
      </form>
  </div>

  <br>

 
      <table class="table table-striped table-dark table_id " id="tblDatos">

                   
                         <thead>    
                         <tr>
                        <th>ID</th>
                        <th>NOMBRE</th>
                        <th>ID TIPO PRODUCTO</th>
                        <th>DESCRIPCION</th>
                        <th>PRECIO</th>
                        <th>FOTO</th>
                    	<th>ACTUALIZAR</th>
						<th>ELIMINAR</th>
                        </tr>
                        </thead>
                        <tbody>

				<?php

include ("./cone.php");              
$SQL="SELECT * FROM TBL_producto 
$where";
$dato = mysqli_query($conexion, $SQL);

if($dato -> num_rows >0){
    while($fila=mysqli_fetch_array($dato)){
    
?>
<tr>
<td><?php echo $fila['id_producto']; ?></td>
<td><?php echo $fila['nom_producto']; ?></td>
<td><?php echo $fila['id_tipo_produ']; ?></td>
<td><?php echo $fila['des_produ']; ?></td>
<td><?php echo $fila['precio_produ']; ?></td>
<td> <img src="productos_img/<?php echo $fila['foto_produ']; ?>" style="width:150px; height:150px";></td> 


<td>
	<a href="<?php echo SERVERURL; ?>Producto-update/<?php echo $fila['id_producto']?>" class="btn btn-success">
		<i class="fas fa-sync-alt"></i>	
	</a>
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