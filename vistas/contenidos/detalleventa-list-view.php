<?php
	require_once "./pruebabitacora.php";
		include ("./cone.php");     

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT * FROM TBL_permisos where id_rol='$id_rol' and id_objeto=12";
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
					"id_objeto" => 12,
					"fecha" => date('Y-m-d H:i:s'),
					"id_usuario" => $_SESSION['id_login'],//cambiar aqui para que me pueda traer el USU conectado
					"accion" => "Cambio de vista",
					"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la Vista de Detalle de Facturación"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			}
?>

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE DETALLE DE FACTURAS
	</h3>

</div>

<!-- BUscar compra -->
<?php
$where="";

if(isset($_GET['enviar'])){
  $busqueda = $_GET['busqueda'];


	if (isset($_GET['busqueda']))
	{
		$where="WHERE TBL_detalle_compra.id_detalle_compra LIKE'%".$busqueda."%' OR id_detalle_compra  LIKE'%".$busqueda."%'";
	}
  
}

?>
</form>

<!-- para la parte de búsqueda-->
	<div class="container-fluid">
  <form class="d-flex">
      <input class="form-control me-2 light-table-filter" data-table="table_id" type="text" 
      placeholder="Buscar Compra">
      <hr>
      </form>
  </div>

  <br>
<!-- tabla  -->
	<table class="table table-striped table-dark table_id text-center" id="tblDatos">
		<!-- Encabezado de la tabla -->
		<thead>
			<tr>
				<th>ID DETALLE</th>
				<th>PRODUCTO</th>
				<th>CANTIDAD</th>
				<th>PRECIO</th>
			</tr>
		</thead>
		<tbody>
		
		<?php
		//variables para generar la url completa del sitio y obtener el id del registro
		$host= $_SERVER["HTTP_HOST"];
		$url= $_SERVER["REQUEST_URI"];
		$url_completa="http://" . $host . $url; 
		//variable que contiene el id de la compra a editar
		$id_pedido = explode('/',$url_completa)[5]; 

				$SQL="SELECT dp.id_detalle_pedido, p.nom_producto, dp.cantidad, dp.precio_venta FROM TBL_detalle_pedido dp
						inner join TBL_producto p on p.id_producto=dp.id_producto
						where dp.id_pedido='$id_pedido'";			
				$dato = mysqli_query($conexion, $SQL);

				if($dato -> num_rows >0){
					while($fila=mysqli_fetch_array($dato)){

				?>
				<tr>
				<td><?php echo $fila['id_detalle_pedido']; ?></td>
				<td><?php echo $fila['nom_producto']; ?></td>
				<td><?php echo $fila['cantidad']; ?></td>
				<td><?php echo $fila['precio_venta']; ?></td>

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