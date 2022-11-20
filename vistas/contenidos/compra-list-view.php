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
			<a class="active" href="<?php echo SERVERURL; ?>compra-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE COMPRAS</a>
		</li>
	</ul>	
</div>

<!-- BUscar compra -->
<?php
include ("./cone.php");
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
				include ("./cone.php");  
				$SQL="SELECT c.id_compra,  c.id_proveedor, p.nom_proveedor,u.usuario,e.nom_estado_compra,c.fech_compra,
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
					<a href="<?php echo SERVERURL; ?>compra-detalle/<?php echo $fila['id_compra']?>" class="btn btn-success">
					<i class="fas fa-info-circle"></i>
					</a>
				</td>
				<td>
					<a href="<?php echo SERVERURL; ?>compra-update/<?php echo $fila['id_compra']?>" class="btn btn-success">
						<i class="fas fa-sync-alt"></i>	
					</a>
				</td>
				<td>
				<form class="FormularioAjax" action="<?php echo SERVERURL; ?>ajax/compraAjax.php" method="POST" data-form="delete" autocomplete="off">
				<input type="hidden" pattern="" class="form-control" name="id_compra_del" value="<?php echo $fila['id_compra'] ?>">
				<input type="hidden" pattern="" class="form-control" name="id_proveedor_del" value="<?php echo $fila['id_proveedor'] ?>">	
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
		</tbody>

	</table>
	<div id="paginador" class=""></div>