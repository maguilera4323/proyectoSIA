<?php
	require_once "./pruebabitacora.php";

	$datos_bitacora = [
		"id_objeto" => 0,
		"fecha" => date('Y-m-d H:i:s'),
		"id_usuario" => $_SESSION['id_login'],
		"accion" => "Cambio de vista",
		"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la vista de Insumos"
	];
	Bitacora::guardar_bitacora($datos_bitacora); 
?>

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-pallet fa-fw"></i> &nbsp; INSUMOS
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>insumos-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; NUEVO INSUMO</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>inventario-list/"><i class="fas fa-warehouse"></i> &nbsp; INVENTARIO DISPONIBLE</a>
		</li>
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>user-list/"><i class="fas fa-dolly-flatbed"></i> &nbsp; MOVIMIENTOS DE INVENTARIO</a>
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
		$where="WHERE TBL_insumos.nom_insumo LIKE'%".$busqueda."%'";
	}
  
}


?>

			</form>
      <div class="container-fluid">
  <form class="d-flex">
      <input class="form-control me-2 light-table-filter" data-table="table_id" type="text" 
      placeholder="Buscar insumo">
      <hr>
      </form>
  </div>
 
      <table class="table table-striped table-dark table_id " id="tblDatos">
                         <thead>    
                         <tr>
                        <th>ID</th>
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
<td><?php echo $fila['id_insumos']; ?></td>
<td><?php echo $fila['nom_insumo']; ?></td>
<td><?php echo $fila['nom_categoria']; ?></td>
<td><?php echo $fila['cant_max']; ?></td>
<td><?php echo $fila['cant_min']; ?></td>
<td><?php echo $fila['unidad_medida']; ?></td>
<td>
	<a href="<?php echo SERVERURL; ?>insumos-update/<?php echo $fila['id_insumos']?>" class="btn btn-success">
		<i class="fas fa-sync-alt"></i>	
	</a>
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

<div class="container-fluid">




		

</div>