<?php
	require_once "./pruebabitacora.php";

	$datos_bitacora = [
		"id_objeto" => 0,
		"fecha" => date('Y-m-d H:i:s'),
		"id_usuario" => $_SESSION['id_login'],
		"accion" => "Cambio de vista",
		"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la vista de Mantenimiento de Usuarios"
	];
	Bitacora::guardar_bitacora($datos_bitacora); 
?>

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-users-cog"></i> &nbsp; USUARIOS
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>user-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; NUEVO USUARIO</a>
		</li>
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>user-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE USUARIOS</a>
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
		$where="WHERE TBL_usuarios.usuario LIKE'%".$busqueda."%' OR nombre_usuario  LIKE'%".$busqueda."%'";
	}
  
}


?>

			</form>
      <div class="container-fluid">
  <form class="d-flex">
      <input class="form-control me-2 light-table-filter" data-table="table_id" type="text" 
      placeholder="Buscar usuario">
      <hr>
      </form>
  </div>

  <br>

 
      <table class="table table-striped table-dark table_id text-center" id="tblDatos">
                         <thead>    
                         <tr>
                        <th>USUARIO</th>
                        <th>NOMBRE</th>
                        <th>ESTADO</th>
                        <th>ROL</th>
                        <th>CORREO</th>
                        <th>CREADO POR</th>
						<th>ACTUALIZAR</th>
						<th>ELIMINAR</th>
                        </tr>
                        </thead>
                        <tbody>

				<?php

include ("./cone.php");              
$SQL="SELECT u.id_usuario, u.usuario, u.nombre_usuario, u.estado_usuario, r.rol,u.correo_electronico,
u.creado_por FROM TBL_usuarios u
inner JOIN TBL_ms_roles r ON r.id_rol = u.id_rol
$where";
$dato = mysqli_query($conexion, $SQL);

if($dato -> num_rows >0){
    while($fila=mysqli_fetch_array($dato)){
    
?>
<tr>
<td><?php echo $fila['usuario']; ?></td>
<td><?php echo $fila['nombre_usuario']; ?></td>
<td><?php echo $fila['estado_usuario']; ?></td>
<td><?php echo $fila['rol']; ?></td>
<td><?php echo $fila['correo_electronico']; ?></td>
<td><?php echo $fila['creado_por']?></td>
<td>
	<a href="<?php echo SERVERURL; ?>user-update/<?php echo $fila['id_usuario']?>" class="btn btn-success">
		<i class="fas fa-sync-alt"></i>	
	</a>
</td>
<td>
	<form class="FormularioAjax" action="<?php echo SERVERURL; ?>ajax/usuarioAjax.php" method="POST" data-form="delete" autocomplete="off">
	<input type="hidden" pattern="" class="form-control" name="id_usuario_del" value="<?php echo $fila['id_usuario'] ?>">
	<input type="hidden" pattern="" class="form-control" name="usuario_del" value="<?php echo $fila['usuario'] ?>">	
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


	</body>
  </table>
  <div id="paginador" class=""></div>	

<div class="container-fluid">




		

</div>