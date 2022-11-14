<div class="full-box page-header">
	<h3 class="text-center">
		<i class="fas fa-book-reader"></i> BITACORA
	</h3>
    

</div>



<div class="container-fluid">
	<div class="table-responsive">
    <caption>Aqui Encontraremos Toda la Informacion de Ingresos, Actualizaciones y  Eliminacion de Datos</caption>
	<table class="table table-dark table-sm" id="tblDatos"> <!-- AGREGAMOS EL id="tblDatos" para poder hacer el llamdo y recorrdio en el js -->
		<thead>
			<tr class="text-center roboto-medium">
				<th>#</th>
				<th>OBJETO</th>
				<th>FECHA</th>
				<th>USUARIO</th>
				<th>ACCION</th>
				<th>DESCRIPCION</th>				

			</tr>
		</thead>
		<?php
			include ("./cone.php");
			$sql="SELECT * FROM TBL_bitacora WHERE id_bitacora ORDER BY id_bitacora DESC ";
			$result=mysqli_query($conexion,$sql);
			while($mostrar=mysqli_fetch_assoc ($result)){
		?>
				<tbody>
					<tr class="text-center" >
						<td><?php echo $mostrar['id_bitacora']?></td>
						<td><?php echo $mostrar['id_objeto']?></td>
						<td><?php echo $mostrar['fecha']?></td>
						<td><?php echo $mostrar['id_usuario']?></td>
						<td><?php echo $mostrar['accion']?></td>
						<td><?php echo $mostrar['descripcion']?></td>
					</tr>
				</tbody>
		<?php
			}
			
		?>
		
	</table>

	<div id="paginador" class=""></div> <!-- este es el div del paginador utilizado en el js -->




