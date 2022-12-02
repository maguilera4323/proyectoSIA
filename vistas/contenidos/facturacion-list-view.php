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
					"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la Vista de lista de facturas"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			}

			//llamado al controlador de la factura
			require_once 'controladores/facturacionControlador.php';
			$factura = new Invoice();
			if (isset($_POST['boton'])) {
				$factura->anularPedido($_POST);
			} 
?>

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE FACTURAS
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>facturacion/"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PEDIDO</a>
		</li>
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>facturacion-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE FACTURAS</a>
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
		$where="WHERE TBL_pedidos.usuario LIKE'%".$busqueda."%' OR nombre_usuario  LIKE'%".$busqueda."%'";
	}
  
}

?>
</form>

<!-- para la parte de búsqueda-->
	<div class="container-fluid">
	<div class="container-fluid">
  <form class="d-flex" action="<?php echo SERVERURL; ?>pdf/pdfFacturas.php" method="post" accept-charset="utf-8">
  	<input class="form-control me-2 light-table-filter" data-table="table_id" type="text" name="filtrofactura" placeholder="Buscar facturas">
	<button type="submit" class="btn btn-danger mx-auto btn-lg"><i class="fas fa-file-pdf"></i> &nbsp;Descargar Reporte</button>
      </form>
  </div>
  </div>

  <br>
<!-- tabla  -->
	<table class="table table-striped table-dark table_id text-center" id="tblDatos">
		<!-- Encabezado de la tabla -->
		<thead>
			<tr>
				<th>N° de Factura</th>
				<th>Cliente</th>
				<th>DNI</th>
				<th>Fecha de Pedido</th>
				<th>Fecha de entrega</th>
				<th>Estado Pedido</th>
				<th>Total Pedido</th>
				<th>Detalle Pedido</th>
				<th>Actualizar</th>
				<th>Imprimir</th>
				<th>Eliminar</th>
			</tr>
		</thead>
		<tbody>
		
		<?php
		
				$SQL="SELECT p.id_pedido,p.num_factura, p.fech_pedido, p.fech_entrega, p.total,
							p.nom_cliente,p.dni_cliente,
							e.estado_pedido FROM TBL_pedidos p
						inner join TBL_estado_pedido e on p.id_estado_pedido=e.id_estado_pedido
						ORDER BY p.id_pedido DESC
						$where";						
				$dato = mysqli_query($conexion, $SQL);

				if($dato -> num_rows >0){
					while($fila=mysqli_fetch_array($dato)){

				?>
				<tr>
				<td><?php echo $fila['num_factura']; ?></td>
				<td><?php echo $fila['nom_cliente']; ?></td>
				<td><?php echo $fila['dni_cliente']; ?></td>
				<td><?php echo $fila['fech_pedido']; ?></td>
				<td><?php echo $fila['fech_entrega']; ?></td>
				<td><?php echo $fila['estado_pedido']; ?></td>
				<td><?php echo $fila['total']; ?></td>

				<td>
					<a href="<?php echo SERVERURL; ?>detalleventa-list/<?php echo $fila['id_pedido']?>" class="btn btn-success">
					<i class="fas fa-info-circle"></i>
					</a>
				</td>
				<td>
					<a href="<?php echo SERVERURL; ?>facturacion-update/<?php echo $fila['id_pedido']?>" class="btn btn-success">
						<i class="fas fa-sync-alt"></i>	
					</a>
				</td>
				<td>
				<form action="<?php echo SERVERURL; ?>pdf/pdfFacturaUnica.php" method="post" accept-charset="utf-8">
					<input type="hidden" name="id_factura" value="<?php echo $fila['id_pedido']?>">
					<button type="submit" class="btn btn-danger" ><i class="fas fa-file-pdf"></i></button>
					</form>
				</td>
				<td>
				<form action="" id="invoice-form" method="post" class="invoice-form" data-form="save">
					<input type="hidden" pattern="" class="form-control" name="id_pedido_del" id="id_pedido_del" value="<?php echo $fila['id_pedido'] ?>">
					<button type="submit" class="btn btn-warning" name="boton">
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
		</tbody>

	</table>
	<div id="paginador" class=""></div>