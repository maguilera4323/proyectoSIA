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
					"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la Vista de Compras"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			}

			//llamado al controlador de la factura
			require_once 'controladores/compraControlador.php';
			$factura = new Invoice();
			if (isset($_POST['boton'])) {
				$factura->anularCompra($_POST);
			} 
?>

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE COMPRAS
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>compra-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR COMPRA</a>
		</li>
		<li>
			<form class="d-flex" action="<?php echo SERVERURL; ?>excel/exportarCompras.php" method="post" accept-charset="utf-8">
				<button type="submit" class="btn btn-success mx-auto btn-lg"><i class="fas fa-file-excel"></i> &nbsp;Descargar Excel</button>
			</form>
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

<!-- para la parte de búsqueda-->
<div class="container-fluid">
  <form class="d-flex" action="../pdf/comprapdf.php" method="post" accept-charset="utf-8">
  	<input class="form-control me-2 light-table-filter" data-table="table_id" type="text" name="filtrocompra" placeholder="Buscar Compra">
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
				<th>Proveedor</th>
				<th>Usuario</th>
				<th>Estado Compra</th>
				<th>Fecha Compra</th>
				<th>Total Compra</th>
				<th>Detalle Compra</th>
				<th>Editar Compra</th>
				<th>Eliminar Compra</th>
			</tr>
		</thead>
		<tbody>
		
			<?php
				$SQL="SELECT c.id_compra, c.id_estado_compra, c.id_proveedor, p.nom_proveedor,u.usuario,e.nom_estado_compra,c.fech_compra,
				c.total_compra FROM TBL_compras c
				inner JOIN TBL_Proveedores p ON p.id_Proveedores = c.id_proveedor
				inner JOIN TBL_usuarios u ON u.id_usuario = c.id_usuario
				inner JOIN TBL_estado_compras e ON e.id_estado_compra = c.id_estado_compra
				ORDER BY c.id_compra DESC 
				$where";
				$dato = mysqli_query($conexion, $SQL);

				if($dato -> num_rows >0){
					while($fila=mysqli_fetch_array($dato)){

			?>
				<tr>
				<td><?php echo $fila['nom_proveedor']; ?></td>
				<td><?php echo $fila['usuario']; ?></td>
				<td><?php echo $fila['nom_estado_compra']; ?></td>
				<td><?php echo $fila['fech_compra']; ?></td>
				<td><?php echo $fila['total_compra']; ?></td>

				<td>
					<a href="<?php echo SERVERURL; ?>detallecompra-list/<?php echo $fila['id_compra']?>" class="btn btn-success">
					<i class="fas fa-info-circle"></i>
					</a>
				</td>
				<td>
					<a href="<?php echo SERVERURL; ?>compra-update/<?php echo $fila['id_compra']?>" class="btn btn-success">
						<i class="fas fa-sync-alt"></i>	
					</a>
				</td>
				<td>
				<form action="" id="invoice-form" method="post" class="invoice-form" data-form="save">
					<input type="hidden" pattern="" class="form-control" name="id_compra_del" id="id_compra_del" value="<?php echo $fila['id_compra'] ?>">
					<input type="hidden" pattern="" class="form-control" name="id_proveedor_del" id="id_proveedor_del" value="<?php echo $fila['id_proveedor'] ?>">
					<input type="hidden" pattern="" class="form-control" name="id_estado_del" id="id_estado_del" value="<?php echo $fila['id_estado_compra'] ?>">	
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