<?php
	require_once "./pruebabitacora.php";
		include ("./cone.php");     

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT * FROM TBL_permisos where id_rol='$id_rol' and id_objeto=15";
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
					"id_objeto" => 15,
					"fecha" => date('Y-m-d H:i:s'),
					"id_usuario" => $_SESSION['id_login'],//cambiar aqui para que me pueda traer el USU conectado
					"accion" => "Cambio de vista",
					"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la Vista de Detalle de Compras"
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
	//variable que contiene el id de la compra seleccionada
	//para poder ver todos los insumos relacionados a esta
	$id_compra = explode('/',$url_completa)[5]; 
?>
	<h3 class="text-left">
		<i class="fas fa-clipboard-list fa-fw"></i> &nbsp; DETALLE DE COMPRAS
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>compra-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE COMPRAS</a>
		</li>
	</ul>	
</div>

<!-- BUscar compra -->
<?php
$where="";

if(isset($_GET['enviar'])){
  $busqueda = $_GET['busqueda'];


	if (isset($_GET['busqueda']))
	{
		$where="WHERE TBL_usuarios.usuario LIKE'%".$busqueda."%' OR nombre_usuario  LIKE'%".$busqueda."%'";
	}
  
}

?>
</form>

  <br>
<!-- tabla  -->
	<table class="table table-striped table-dark table_id text-center" id="tblDatos">
		<!-- Encabezado de la tabla -->
		<thead>
			<tr>
				<th>ID DETALLE</th>
				<th>INSUMO</th>
				<th>CANTIDAD</th>
				<th>PRECIO</th>
				<th>FECHA DE CADUCIDAD</th>
			</tr>
		</thead>
		<tbody>
		
			<?php
				$SQL="SELECT dc.id_detalle_compra, i.nom_insumo,  dc.cantidad_comprada, dc.precio_costo,dc.fecha_caducidad
				FROM TBL_detalle_compra dc
				inner JOIN TBL_insumos i ON i.id_insumos = dc.id_insumos
				inner JOIN TBL_compras c ON c.id_compra = dc.id_compra
				WHERE c.id_compra='$id_compra'";
				
				$dato = mysqli_query($conexion, $SQL);

				if($dato -> num_rows >0){
					while($fila=mysqli_fetch_array($dato)){

			?>
				<tr>
				<td><?php echo $fila['id_detalle_compra']; ?></td>
				<td><?php echo $fila['nom_insumo']; ?></td>
				<td><?php echo $fila['cantidad_comprada']; ?></td>
				<td><?php echo $fila['precio_costo']; ?></td>
				<td><?php echo $fila['fecha_caducidad']; ?></td>
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