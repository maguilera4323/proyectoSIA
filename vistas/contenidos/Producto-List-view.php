<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PROVEEDORES
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>proveedor-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PROVEEDOR</a>
		</li>
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>proveedor-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PROVEEDORES</a>
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
		$where="WHERE TBL_Proveedores.nom_proveedor LIKE'%".$busqueda."%' OR correo_proveedor LIKE'%".$busqueda."%'";
	}
  
}


?>

			</form>
      <div class="container-fluid">
  <form class="d-flex">
      <input class="form-control me-2 light-table-filter" data-table="table_id" type="text" 
      placeholder="Buscar Proveedor">
      <hr>
      </form>
  </div>

  <br>

 
      <table class="table table-striped table-dark table_id " id="tblDatos">

                   
                         <thead>    
                         <tr>
                        <th>ID</th>
                        <th>NOMBRE</th>
                        <th>RTN</th>
                        <th>TELEFONO</th>
                        <th>CORREO</th>
                        <th>DIRECCION</th>
                    	<th>ACTUALIZAR</th>
						<th>ELIMINAR</th>
                        </tr>
                        </thead>
                        <tbody>

				<?php

include ("./cone.php");              
$SQL="SELECT * FROM TBL_Proveedores 
$where";
$dato = mysqli_query($conexion, $SQL);

if($dato -> num_rows >0){
    while($fila=mysqli_fetch_array($dato)){
    
?>
<tr>
<td><?php echo $fila['id_Proveedores']; ?></td>
<td><?php echo $fila['nom_proveedor']; ?></td>
<td><?php echo $fila['rtn_proveedor']; ?></td>
<td><?php echo $fila['tel_proveedor']; ?></td>
<td><?php echo $fila['correo_proveedor']; ?></td>
<td><?php echo $fila['dir_proveedor']; ?></td>
<td> <img src="productos_img/<?php echo $fila['foto_produ']; ?>" style="width:150px; height:150px";></td> 


<td>
	<a href="<?php echo SERVERURL; ?>proveedor-update/<?php echo $fila['id_Proveedores']?>" class="btn btn-success">
		<i class="fas fa-sync-alt"></i>	
	</a>
</td>
<td>
	<form class="FormularioAjax" action="<?php echo SERVERURL; ?>ajax/proveedorAjax.php" method="POST" data-form="delete" autocomplete="off">
	<input type="hidden" pattern="" class="form-control" name="id_proveedor_del" value="<?php echo $fila['id_Proveedores'] ?>">
	<input type="hidden" pattern="" class="form-control" name="proveedor_del" value="<?php echo $fila['nom_proveedor'] ?>">	
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