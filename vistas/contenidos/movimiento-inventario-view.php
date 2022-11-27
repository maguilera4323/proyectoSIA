<?php
	require_once "./pruebabitacora.php";
		include ("./cone.php");     

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT * FROM TBL_permisos where id_rol='$id_rol' and id_objeto=5";
			$dato = mysqli_query($conexion, $SQL);

			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
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
					"id_objeto" => 5,
					"fecha" => date('Y-m-d H:i:s'),
					"id_usuario" => $_SESSION['id_login'],//cambiar aqui para que me pueda traer el USU conectado
					"accion" => "Cambio de vista",
					"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la Vista de Movimientos de Inventario"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			}
?>

<div class="full-box page-header">
	<?php	
		//variables para generar la url completa del sitio y obtener el id del registro
		$host= $_SERVER["HTTP_HOST"];
		$url= $_SERVER["REQUEST_URI"];
		$url_completa="http://" . $host . $url; 
		//variable que contiene el id del insumo
		//esta variable es para mostrar los movimientos de inventario de un solo insumo
		$id_insumo = explode('/',$url_completa)[5]; 
	?>

	<h3 class="text-left">
		<i class="fas fa-dolly-flatbed"></i> &nbsp; MOVIMIENTO DE INVENTARIO
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>insumos-list/"><div class="btn btn-dark btn-lg"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE INSUMOS</div></a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>inventario-list/"><div class="btn btn-dark btn-lg"><i class="fas fa-warehouse"></i> &nbsp; INVENTARIO DISPONIBLE</div></a>
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
  	<form class="d-flex" action="../pdf/movi_inventariopdf.php" method="post" accept-charset="utf-8">
  		<input class="form-control me-2 light-table-filter" data-table="table_id" type="text" name="filtromovi_inventario" placeholder="Buscar Movimientos">
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
						<th>CANTIDAD</th>
                        <th>MOVIMIENTO</th>
                        <th>FECHA</th>
						<th>USUARIO</th>
						<th>COMENTARIO</th>
                        </tr>
                        </thead>
                        <tbody>
				<?php

include ("./cone.php");    

//validación para mostrar la tabla de movimientos de insumos completa o solo los datos de un insumo especifico
//si se cumple la condicion se mostrará la tabla completa
if($id_insumo==''){
	$SQL="SELECT iv.id_cardex, i.id_insumos, i.nom_insumo, iv.cant_movimiento,iv.tipo_movimiento, iv.fecha_movimiento,
	iv.id_usuario, u.usuario,iv.comentario FROM TBL_movi_inventario iv 
		inner JOIN TBL_insumos i ON i.id_insumos = iv.id_insumos
		inner JOIN TBL_usuarios u ON u.id_usuario = iv.id_usuario
		order by iv.id_cardex DESC
	$where";
}else{
	$SQL="SELECT iv.id_cardex, i.id_insumos, i.nom_insumo, iv.cant_movimiento,iv.tipo_movimiento, iv.fecha_movimiento,
		iv.id_usuario, u.usuario,iv.comentario FROM TBL_movi_inventario iv 
		inner JOIN TBL_insumos i ON i.id_insumos = iv.id_insumos
		inner JOIN TBL_usuarios u ON u.id_usuario = iv.id_usuario
		where iv.id_insumos='$id_insumo'";
}

$dato = mysqli_query($conexion, $SQL);

if($dato -> num_rows >0){
    while($fila=mysqli_fetch_array($dato)){
    
?>
<tr>
<td><?php echo $fila['nom_insumo']; ?></td>
<td><?php echo $fila['cant_movimiento']; ?></td>
<td><?php echo $fila['tipo_movimiento']; ?></td>
<td><?php echo $fila['fecha_movimiento']; ?></td>
<td><?php echo $fila['usuario']; ?></td>
<td><?php echo $fila['comentario']; ?></td>
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