<?php
	require_once "./pruebabitacora.php";

	$datos_bitacora = [
		"id_objeto" => 0,
		"fecha" => date('Y-m-d H:i:s'),
		"id_usuario" => $_SESSION['id_login'],
		"accion" => "Cambio de vista",
		"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la vista de Inventario Disponible"
	];
	Bitacora::guardar_bitacora($datos_bitacora); 
?>

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-warehouse"></i> &nbsp; INVENTARIO
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>insumos-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE INSUMOS</a>
		</li>
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>user-list/"><i class="fas fa-warehouse"></i> &nbsp; MOVIMIENTOS DE INVENTARIO</a>
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
		$where="WHERE TBL_inventario.id_insumo LIKE'%".$busqueda."%'";
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
                        <th>ID INVENTARIO</th>
						<th>ID INSUMO</th>
                        <th>NOMBRE INSUMO</th>
                        <th>EXISTENCIAS</th>
                        <th>UNIDAD DE MEDIDA</th>
                        </tr>
                        </thead>
                        <tbody>
				<?php

include ("./cone.php");              
$SQL="SELECT iv.id_inventario, iv.id_insumo, i.nom_insumo, iv.cant_existencia,i.unidad_medida FROM TBL_inventario iv
inner JOIN TBL_insumos i ON i.id_insumos = iv.id_insumo
$where";
$dato = mysqli_query($conexion, $SQL);

if($dato -> num_rows >0){
    while($fila=mysqli_fetch_array($dato)){
    
?>
<tr>
<td><?php echo $fila['id_inventario']; ?></td>
<td><?php echo $fila['id_insumo']; ?></td>
<td><?php echo $fila['nom_insumo']; ?></td>
<td><?php echo $fila['cant_existencia']; ?></td>
<td><?php echo $fila['unidad_medida']; ?></td>
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