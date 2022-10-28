
<br>
<br>
<br>
<br>


<?php
include ("./cone.php");
$where="";

if(isset($_GET['enviar'])){
  $busqueda = $_GET['busqueda'];


	if (isset($_GET['busqueda']))
	{
		$where="WHERE TBL_usuarios.usuario LIKE'%".$busqueda."%' OR nombre_usuario  LIKE'%".$busqueda."%'
    OR telefono  LIKE'%".$busqueda."%'";
	}
  
}


?>
           <br>


			</form>
      <div class="container-fluid">
  <form class="d-flex">
      <input class="form-control me-2 light-table-filter" data-table="table_id" type="text" 
      placeholder="Buscar con JS">
      <hr>
      </form>
  </div>

  <br>

 
      <table class="table table-striped table-dark table_id ">

                   
                         <thead>    
                         <tr>
                        <th>ID</th>
                        <th>USUARIO</th>
                        <th>NOMBRE</th>
                        <th>ESTADO</th>
                        <th>ID</th>
                        <th>CORREO</th>
                        
         
                        </tr>
                        </thead>
                        <tbody>

				<?php

include ("./cone.php");              
$SQL="SELECT TBL_usuarios.id_usuario, TBL_usuarios.usuario, TBL_usuarios.nombre_usuario, TBL_usuarios.estado_usuario, TBL_usuarios.id_rol,
TBL_usuarios.correo_electronico FROM TBL_usuarios $where";
$dato = mysqli_query($conexion, $SQL);

if($dato -> num_rows >0){
    while($fila=mysqli_fetch_array($dato)){
    
?>
<tr>
<td><?php echo $fila['id_usuario']; ?></td>
<td><?php echo $fila['usuario']; ?></td>
<td><?php echo $fila['nombre_usuario']; ?></td>
<td><?php echo $fila['estado_usuario']; ?></td>
<td><?php echo $fila['id_rol']; ?></td>
<td><?php echo $fila['correo_electronico']; ?></td>




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







</html>