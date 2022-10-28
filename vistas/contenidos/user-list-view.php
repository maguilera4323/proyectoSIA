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
		<i class="fas fa-clipboard-list fa-fw"></i> &nbsp; USUARIOS
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
		<li>
			<a href="<?php echo SERVERURL; ?>user-search/"><i class="fas fa-search fa-fw"></i> &nbsp; BUSCAR USUARIO</a>
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
      placeholder="Buscar usuario">
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
$SQL="SELECT TBL_usuarios.id_usuario, TBL_usuarios.usuario, TBL_usuarios.nombre_usuario, TBL_usuarios.estado_usuario, TBL_usuarios.id_rol,
TBL_usuarios.correo_electronico,TBL_usuarios.creado_por FROM TBL_usuarios $where";
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


<div class="container-fluid">



<!-- <div class="table-responsive">

	<form action="buscar_usuario.php" method="get" class="" >
		<input type="text" name="busqueda" id="busqueda" placeholder="Usuario a Buscar">
		<input type="submit" value="buscar" class="btn_search">
	</form>

	<table class="table table-dark table-sm">
		<thead>
			<tr class="text-center roboto-medium">
				<th>#</th>
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
		<?php
			include ("./cone.php");
			$sql="SELECT u.id_usuario, u.usuario, u.nombre_usuario, u.estado_usuario, u.correo_electronico,
			u.creado_por, r.rol FROM TBL_usuarios u
			inner JOIN TBL_ms_roles r ON u.id_rol = r.id_rol";
			$result=mysqli_query($conexion,$sql);
			while($mostrar=mysqli_fetch_assoc($result)){			
		?>
				<tbody>
					<tr class="text-center" >
						<td><?php echo $mostrar['id_usuario']?></td>
						<td><?php echo $mostrar['usuario']?></td>
						<td><?php echo $mostrar['nombre_usuario']?></td>
						<td><?php echo $mostrar['estado_usuario']?></td>
						<td><?php echo $mostrar['rol']?></td>
						<td><?php echo $mostrar['correo_electronico']?></td>
						<td><?php echo $mostrar['creado_por']?></td>
						<td>
						<a href="<?php echo SERVERURL; ?>user-update/<?php echo $mostrar['id_usuario']?>" class="btn btn-success">
									<i class="fas fa-sync-alt"></i>	
							</a>
						</td>
						<td>
							<form class="FormularioAjax" action="<?php echo SERVERURL; ?>ajax/usuarioAjax.php" method="POST" data-form="delete" autocomplete="off">
							<input type="hidden" pattern="" class="form-control" name="id_usuario_del" value="<?php echo $mostrar['id_usuario'] ?>">
							<input type="hidden" pattern="" class="form-control" name="usuario_del" value="<?php echo $mostrar['usuario'] ?>">	
							<button type="submit" class="btn btn-warning">
										<i class="far fa-trash-alt"></i>
								</button>
							</form>
						</td>
					</tr>
				</tbody>
		<?php
			}
			
		?>
		
	</table> -->
		

</div>