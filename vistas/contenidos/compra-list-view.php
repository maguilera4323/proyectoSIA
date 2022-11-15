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

<!-- para la parte de búsqueda-->
	</form>
	<div class="container-fluid">
  <form class="d-flex">
      <input class="form-control me-2 light-table-filter" data-table="table_id" type="text" 
      placeholder="Buscar Compra">
      <hr>
      </form>
  </div>

  <br>

	<table class="table table-striped table-dark table_id text-center" id="tblDatos">
		<!-- Encabezado de la tabla -->
		<thead>
			<tr>
				<th>ID Compra</th>
				<th>Nombre Insumo</th>
				<th>Cantidad</th>
				<th>Precio Unitario HNL</th>
				<th>Fecha Compra</th>
				<th>Estado Compra</th>
				<th>Total Compra</th>
				<th>Detalle Compra</th>
				<th>Editar Compra</th>
				<th>Eliminar Compra</th>
			</tr>
		</thead>
		<tbody>
			<tr class="text-center" >
					<td>0001</td>
					<td>Nombre Insumo</td>
					<td>10</td>
					<td>100.00</td>
					<td>Fecha Compra</td>
					<td>Estado Compra</td>
					<td>1,000.00</td>
					<td>
						<!-- Enlace para la vistaa de detalle compra -->
						<a href="<?php echo SERVERURL; ?>compra-detalle/" class="btn btn-success">	
						<i class="fas fa-info-circle"></i>
						</button>
					</td>
					<td>
						<!-- Enlace para la vista de editar compra -->
						<a href="<?php echo SERVERURL; ?>compra-update/" class="btn btn-success">
								<i class="fas fa-sync-alt"></i>	
						</a>
					</td>
					<td>
						<form action="">
							<!-- Enlace para eliminar -->
							<button type="button" class="btn btn-warning">
									<i class="far fa-trash-alt"></i>
							</button>
						</form>
					</td>
				</tr>
		</tbody>
	</table>

<!--  
<div class="container-fluid">
	<div class="table-responsive">
		<table class="table table-dark table-sm">
			<thead>
				<tr class="text-center roboto-medium">
					<th>ID</th>
					<th>Nombre Insumo</th>
					<th>Cantidad</th>
					<th>Precio Unitario HNL</th>
					<th>Fecha Compra</th>
					<th>Estado Compra</th>
					<th>Total Compra</th>
					<th>Detalle Compra</th>
					<th>Editar Compra</th>
					<th>Eliminar Compra</th>
				</tr>
			</thead>
			<tbody>
				<tr class="text-center" >
					<td>0001</td>
					<td>Nombre Insumo</td>
					<td>10</td>
					<td>100.00</td>
					<td>Fecha Compra</td>
					<td>Estado Compra</td>
					<td>1,000.00</td>
					<td>
						<button type="button" class="btn btn-info" data-toggle="popover" data-trigger="hover" title="Detalle de la Compra">
							<i class="fas fa-info-circle"></i>
						</button>
					</td>
					<td>
						<a href="client-update.html" class="btn btn-success">
								<i class="fas fa-sync-alt"></i>	
						</a>
					</td>
					<td>
						<form action="">
							<button type="button" class="btn btn-warning">
									<i class="far fa-trash-alt"></i>
							</button>
						</form>
					</td>
				</tr>
				<tr class="text-center" >
					<td>0002</td>
					<td>Nombre Insumo</td>
					<td>10</td>
					<td>100.00</td>
					<td>Fecha Compra</td>
					<td>Estado Compra</td>
					<td>1,000.00</td>
					<td>
						<button type="button" class="btn btn-info" data-toggle="popover" data-trigger="hover" title="Nombre del cliente" data-content="Direccion completa del cliente">
							<i class="fas fa-info-circle"></i>
						</button>
					</td>
					<td>
						<a href="client-update.html" class="btn btn-success">
								<i class="fas fa-sync-alt"></i>	
						</a>
					</td>
					<td>
						<form action="">
							<button type="button" class="btn btn-warning">
									<i class="far fa-trash-alt"></i>
							</button>
						</form>
					</td>
				</tr>
				<tr class="text-center" >
					<td>0003</td>
					<td>Nombre Insumo</td>
					<td>10</td>
					<td>100.00</td>
					<td>Fecha Compra</td>
					<td>Estado Compra</td>
					<td>1,000.00</td>
					<td>
						<button type="button" class="btn btn-info" data-toggle="popover" data-trigger="hover" title="Nombre del cliente" data-content="Direccion completa del cliente">
							<i class="fas fa-info-circle"></i>
						</button>
					</td>
					<td>
						<a href="client-update.html" class="btn btn-success">
								<i class="fas fa-sync-alt"></i>	
						</a>
					</td>
					<td>
						<form action="">
							<button type="button" class="btn btn-warning">
									<i class="far fa-trash-alt"></i>
							</button>
						</form>
					</td>
				</tr>
				<tr class="text-center" >
					<td>0004</td>
					<td>Nombre Insumo</td>
					<td>10</td>
					<td>100.00</td>
					<td>Fecha Compra</td>
					<td>Estado Compra</td>
					<td>1,000.00</td>
					<td>
						<button type="button" class="btn btn-info" data-toggle="popover" data-trigger="hover" title="Nombre del cliente" data-content="Direccion completa del cliente">
							<i class="fas fa-info-circle"></i>
						</button>
					</td>
					<td>
						<a href="client-update.html" class="btn btn-success">
								<i class="fas fa-sync-alt"></i>	
						</a>
					</td>
					<td>
						<form action="">
							<button type="button" class="btn btn-warning">
									<i class="far fa-trash-alt"></i>
							</button>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled">
				<a class="page-link" href="#" tabindex="-1">Previous</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item">
				<a class="page-link" href="#">Next</a>
			</li>
		</ul>
	</nav>
</div>