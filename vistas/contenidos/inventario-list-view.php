<?php
	require_once "./pruebabitacora.php";
		include ("./cone.php");     

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT permiso_consulta FROM TBL_permisos where id_rol='$id_rol' and id_objeto=4";
			$dato = mysqli_query($conexion, $SQL);

			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
					$permiso=$fila['permiso_consulta'];
				}
			}

			//valida si el query anterior no retornó ningún valor
			//en este caso no había un permiso registrado del objeto para el rol del usuario conectado
			if(!isset($permiso)){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene acceso autorizado a esta vista</div>';
				echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
			//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
			}else if($permiso==0){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene acceso autorizado a esta vista</div>';
				echo "<script> window.location.href='".SERVERURL."insumos-list/'; </script>";
			}else{
				$datos_bitacora = 
				[
					"id_objeto" => 4,
					"fecha" => date('Y-m-d H:i:s'),
					"id_usuario" => $_SESSION['id_login'],//cambiar aqui para que me pueda traer el USU conectado
					"accion" => "Cambio de vista",
					"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la Vista de Inventario"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			}

?>

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-warehouse"></i> &nbsp; INVENTARIO
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>insumos-list/"><div class="btn btn-dark btn-lg"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE INSUMOS</div></a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>movimiento-inventario/"><div class="btn btn-danger btn-lg"><i class="fas fa-dolly-flatbed"></i> &nbsp; MOVIMIENTOS DE INVENTARIO</div></a>
		</li>
		<li>
			<form class="d-flex" action="<?php echo SERVERURL; ?>excel/exportarInventario.php" method="post" accept-charset="utf-8">
				<button type="submit" class="btn btn-success mx-auto btn-lg"><i class="fas fa-file-excel"></i> &nbsp;Descargar Excel</button>
			</form>
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
  <form class="d-flex" action="../pdf/inventariopdf.php" method="post" accept-charset="utf-8">
  	<input class="form-control me-2 light-table-filter" data-table="table_id" type="text" name="filtroinventario" placeholder="Buscar inventario">
	<button type="submit" class="btn btn-danger mx-auto btn-lg"><i class="fas fa-file-pdf"></i> &nbsp;Descargar Reporte</button>
      </form>
  </div>
  </div>
      <hr>
      </form>
  </div>
 
      <table class="table table-striped table-dark table_id text-center" id="tblDatos">
                         <thead>    
                         <tr>
                        <th>NOMBRE INSUMO</th>
                        <th>EXISTENCIAS</th>
                        <th>UNIDAD DE MEDIDA</th>
						<th>VER MÁS</th>
                        </tr>
                        </thead>
                        <tbody>
				<?php

include ("./cone.php");              
$SQL="SELECT iv.id_insumo, i.nom_insumo, iv.cant_existencia,i.unidad_medida FROM TBL_inventario iv
inner JOIN TBL_insumos i ON i.id_insumos = iv.id_insumo
$where";
$dato = mysqli_query($conexion, $SQL);

if($dato -> num_rows >0){
    while($fila=mysqli_fetch_array($dato)){
    
?>
<tr>
<td><?php echo $fila['nom_insumo']; ?></td>
<td><?php echo $fila['cant_existencia']; ?></td>
<td><?php echo $fila['unidad_medida']; ?></td>
<td>
	<a href="<?php echo SERVERURL; ?>movimiento-inventario/<?php echo $fila['id_insumo']?>" class="btn btn-success">
	<i class="fas fa-info-circle"></i></a>
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