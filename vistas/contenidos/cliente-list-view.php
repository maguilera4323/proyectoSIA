<?php
	require_once "./pruebabitacora.php";
		include ("./cone.php");     

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT permiso_consulta FROM TBL_permisos where id_rol='$id_rol' and id_objeto=2";
			$dato = mysqli_query($conexion, $SQL);

			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
					$permiso=$fila['permiso_consulta'];
				}
			}

			//valida si el query anterior no retornó ningún valor
			//en este caso no había un permiso registrado del objeto para el rol del usuario conectado
			if(!isset($permiso)){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene acceso autorizado a esta vista</div>';
				echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
			//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
			}else if($permiso==0){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene acceso autorizado a esta vista</div>';
				echo "<script> window.location.href='".SERVERURL."home/'; </script>";
			}else{
				$datos_bitacora = 
				[
					"id_objeto" => 2,
					"fecha" => date('Y-m-d H:i:s'),
					"id_usuario" => $_SESSION['id_login'],//cambiar aqui para que me pueda traer el USU conectado
					"accion" => "Cambio de vista",
					"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la Vista de Proveedores"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			}
?>

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE CLIENTES
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>cliente-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR CLINTE</a>
		</li>
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>cliente-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE CLIENTE</a>
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
		$where="WHERE TBL_Clientes.nom_cliente LIKE'%".$busqueda."%'";
	}
  
}


?>

			</form>
      <div class="container-fluid">
  <form class="d-flex">
      <input class="form-control me-2 light-table-filter" data-table="table_id" type="text" 
      placeholder="Buscar cliente">
      <hr>
      </form>
  </div>

  <br>

 
      <table class="table table-striped table-dark table_id text-center" id="tblDatos">
                         <thead>    
                         <tr>
                        <th>NOMBRE</th>
                        <th>RTN</th>
						<th>DNI</th>
                        <th>TELEFONO</th>
                    	<th>ACTUALIZAR</th>
						<th>ELIMINAR</th>
                        </tr>
                        </thead>
                        <tbody>

				<?php

include ("./cone.php");              
$SQL="SELECT * FROM TBL_Clientes 
$where";
$dato = mysqli_query($conexion, $SQL);

if($dato -> num_rows >0){
    while($fila=mysqli_fetch_array($dato)){
    
?>
<tr>
<td><?php echo $fila['nom_cliente']; ?></td>
<td><?php echo $fila['rtn_cliente']; ?></td>
<td><?php echo $fila['dni_clinte']; ?></td>
<td><?php echo $fila['tel_cliente']; ?></td>
<td>
	<a href="<?php echo SERVERURL; ?>cliente-update/<?php echo $fila['id_clientes']?>" class="btn btn-success">
		<i class="fas fa-sync-alt"></i>	
	</a>
</td>
<td>
	<form class="FormularioAjax" action="<?php echo SERVERURL; ?>ajax/clienteAjax.php" method="POST" data-form="delete" autocomplete="off">
	<input type="hidden" pattern="" class="form-control" name="id_clientes_del" value="<?php echo $fila['id_clientes'] ?>">
	<input type="hidden" pattern="" class="form-control" name="cliente_del" value="<?php echo $fila['nom_cliente'] ?>">	
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
<div class="container-fluid"></div>