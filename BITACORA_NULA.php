<?php
/*colocar en el mainmodel*/
/* los que estan despues de VALUES son los marcadores */

protected function guardar_bitacora($datos){
    $sql=self::conectar()->prepare("INSERT INTO bitacora(bitacoracodigo,bitacorafecha,
    bitacoraHoraInicio,bitacoraHoraFinal,bitacoraTipo,bitacorayear,cuentaCodigo)
    VALUES (:codigo,:fecha,:HoraInicio,:HoraFinal,:tipo,:year,:cuenta)" );
    $sql->bindParam(":codigo",$datos['codigo']);
    $sql->bindParam(":fecha",$datos['fecha']);
    $sql->bindParam(":HoraInicio",$datos['HoraInicio']);
    $sql->bindParam(":HoraFinal",$datos['HoraFina']);
    $sql->bindParam(":tipo",$datos['tipo']);
    $sql->bindParam(":year",$datos['year']);
    $sql->bindParam(":cuenta",$datos['cuenta']);
    $sql->execute();
	return $sql;
}

/*esta funcion se crea para actualizar la bitacora y llenara el campo de hora final
o hora de cierre de sesion */

protected function actualizar_bitacora($codigo,$hora){
    $sql=self::conectar()->prepare("UPDATE bitacora SET bitacoraHoraFinal=:Hora 
    WHERE bitacoracodigo=:codigo");//AQUI SE HACE LA ACTUALIZACION DE LA COLUMNA bitacoraHoraFinal
    
    $sql->bindParam(":hora",$hora);
    $sql->bindParam(":codigo",$codigo);
    $sql->execute();
	return $sql; 
}

//LIMINAR DATOS DE LA BITACORA
protected function eliminar_bitacora($codigo,$hora){
    $sql=self::conectar()->prepare("DELETE FROM bitacora WHERE cuentaCodigo:codigo");
    $sql->bindParam(":codigo",$codigo);
    $sql->execute();
	return $sql; 
}




//PAGINADOR DE BITACORA




<div class="full-box page-header">
	<h3 class="text-center">
		<i class="fas fa-book-reader"></i> BITACORA
	</h3>
    

</div>



<div class="container-fluid">
	<div class="table-responsive">
    <caption>Aqui Encontraremos Toda la Informacion de Ingresos, Actualizaciones y  Eliminacion de Datos</caption>
	<table class="table table-dark table-sm">
		<thead>
			<tr class="text-center roboto-medium">
				<th>#</th>
				<th>OBJETO</th>
				<th>FECHA</th>
				<th>USUARIO</th>
				<th>ACCION</th>
				<th>DESCRIPCION</th>				
				<!-- <th>ACTUALIZAR</th>
				<th>ELIMINAR</th> -->
			</tr>
		</thead>
		<?php
			include ("./cone.php");
			/* paginador */



			$sql_registe = mysqly_query($conexion,"SELECT COUNT(*) as total_reg 
			FROM TBL_bitacora;")//realiza el conteo de todos los datos de la tabla y los guarda en la variable ----total_reg ----\
			$result_register=mysqli_fetch_array($sql_registe);//guardamos los datos en la variable de la consulta
			$total_reg=$result_register['total_reg'];//acceso al resultado de la consulta
			$por_pagina=10;

			if(empty($_GET['pagina']))
			{
				$pagina=1;
			}else
			{
				$pagina=$_GET['pagina'];
			}
			$desde = ($pagina-1) * $por_pagina;
			$total_paginas = ceil($total_reg / $por_pagina);


			

			/* fin paginador */ 

			$sql="SELECT * FROM TBL_bitacora WHERE id_bitacora LIMIT $desde,$por_pagina ORDER BY id_bitacora DESC ";
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
	<div class="paginador">
		<ul>
			<li><a href="#">|<</a></li>
			<li><a href="#"><<</a></li>
			<li class="pageSelected">1</li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">>></a></li>
			<li><a href="#">>|</a></li>
		</ul>
	</div>



<!-- 	</div>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">Previous</a></li>
			
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>

			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>
</div> -->