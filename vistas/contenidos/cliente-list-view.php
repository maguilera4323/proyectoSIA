<?php
	require_once "./pruebabitacora.php";
		include ("./cone.php");     

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT *FROM TBL_permisos where id_rol='$id_rol' and id_objeto=18";
			$dato = mysqli_query($conexion, $SQL);

			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
					$permiso_in=$fila['permiso_insercion'];
					$permiso_act=$fila['permiso_actualizacion'];
					$permiso_eli=$fila['permiso_eliminacion'];
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
					"id_objeto" => 18,
					"fecha" => date('Y-m-d H:i:s'),
					"id_usuario" => $_SESSION['id_login'],//cambiar aqui para que me pueda traer el USU conectado
					"accion" => "Cambio de vista",
					"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la Vista de Clientes"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			}
?>
<script>
	function solonumeros(e)
	{
		key=e.keyCode || e.which;
		teclado=String.fromCharCode(key);
		numeros="0123456789";
		
		especiales="8-37-38-46";
		teclado_especial=false;
		for(var i in especiales){
			if(key==especiales[i]){
				teclado_especial=true;
			}
		}
		if(numeros.indexOf(teclado)==-1 && !teclado_especial){
			return false;
		}
	}
</script>
<script>
	function sololetras(e)
	{
		key=e.keyCode || e.which;
		teclado=String.fromCharCode(key);
		letras="abcdefghijklmnñopqrstuvwxyz";		
		especiales="";
		teclado_especial=false;
		for(var i in especiales){
			if(key==especiales[i]){
				teclado_especial=true;
			}
		}
		if(letras.indexOf(teclado)==-1 && !teclado_especial){
			return false;
		}
	}
</script>


<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE CLIENTES
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<div class="btn btn-dark btn-lg" data-toggle="modal" data-target="#ModalCrear"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR CLIENTE</div>
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
  <form class="d-flex" action="../pdf/clientepdf.php" method="post" accept-charset="utf-8">
  	<input class="form-control me-2 light-table-filter" data-table="table_id" type="text" name="filtrocliente" placeholder="Buscar cliente">
	<button type="submit" class="btn btn-danger mx-auto btn-lg"><i class="fas fa-file-pdf"></i> &nbsp;Descargar Reporte</button>
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
				<div class="btn btn-success" data-toggle="modal" data-target="#ModalActualizar<?php echo $fila['id_clientes'];?>">
					<i class="fas fa-sync-alt"> </i>
				</div>
						<!-- Modal actualizar-->
						<div class="modal fade" id="ModalActualizar<?php echo $fila['id_clientes'];?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<?php
							if(!isset($permiso_act)){
								echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para actualizar un cliente</div>';
								echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
							//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
							}else if($permiso_act==0){
								echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para actualizar un cliente
								<button type="button" class="close" data-dismiss="alert" onclick="window.location.reload()">X</button>
								</div>';
							}else{
						?>	
						<div class="modal-dialog" role="document">
								<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Actualizar Cliente</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body text-center">
									<form action="<?php echo SERVERURL; ?>ajax/clienteAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
									<div class="form-group">
										<label class="color-label">Nombre</label>
										<input type="text" class="form-control" name="nombre_cliente_actu" id="cliente_dni" 
										value="<?php echo $fila['nom_cliente']?>" style="text-transform:uppercase;" required>
									</div>
									<div class="form-group">
										<label class="color-label">DNI</label>
										<input type="text" class="form-control" name="dni_cliente_actu" id="cliente_nombre" 
										value="<?php echo $fila['dni_clinte']?>" required>
									</div>
									<div class="form-group">
										<label class="color-label">RTN</label>
										<input type="text" class="form-control" name="rtn_cliente_actu" id="cliente_apellido" 
										value="<?php echo $fila['rtn_cliente']?>" required>
									</div>
									<div class="form-group">
										<label class="color-label">Telefono</label>
										<input type="text" class="form-control" name="telefono_actu" id="cliente_telefono" 
										value="<?php echo $fila['tel_cliente']?>"required>
									</div>
									<div class="form-group">
											<input type="hidden" class="form-control" name="id_actualizacion" value="<?php echo $fila['id_clientes']?>">
									</div>
									<button type="submit" class="btn btn-primary">Guardar</button>
									<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
									</form>
      							</div>
							</div>
							<?php
								}
							?>
					</div>
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

<!-- Modal crear-->
<div class="modal fade" id="ModalCrear" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<?php
	if(!isset($permiso_in)){
		echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para crear un cliente</div>';
		echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
	//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
	}else if($permiso_in==0){
		echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para crear un cliente
		<button type="button" class="close" data-dismiss="alert" onclick="window.location.reload()">X</button>
		</div>';
	}else{
?>  
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo Cliente</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
			<form action="<?php echo SERVERURL; ?>ajax/clienteAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
			<div class="form-group">
				<label class="color-label">Nombre</label>
				<input type="text" class="form-control" onkeypress="return sololetras (event)" name="nombre_cliente_nuevo" id="cliente_dni" style="text-transform:uppercase;" maxlength="20" required>
			</div>
			<div class="form-group">
				<label class="color-label">DNI</label>
				<input type="text" class="form-control" onkeypress="return solonumeros (event)" pattern="[0-9]{13,13}" name="dni_cliente" id="cliente_nombre" maxlength="13"required>
			</div>
			<div class="form-group">
				<label class="color-label">RTN</label>
				<input type="text" class="form-control" onkeypress="return solonumeros (event)" pattern="[0-9]{14,14}" name="rtn_cliente" id="cliente_apellido" maxlength="14" required>
			</div>
			<div class="form-group">
				<label class="color-label">Telefono</label>
				<input type="text" class="form-control" onkeypress="return solonumeros (event)" pattern="[0-9]{8,8}" name="telefono_nuevo" id="cliente_telefono" maxlength="8" required>
			</div>
			<button type="submit" class="btn btn-primary">Guardar</button>
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			</form>
      </div>
    </div>
  </div>
  <?php
		}
	?>
</div>
