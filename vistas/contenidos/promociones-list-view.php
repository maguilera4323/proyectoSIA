<?php
	require_once "./pruebabitacora.php";
		include ("./cone.php");     

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT * FROM TBL_permisos where id_rol='$id_rol' and id_objeto=2";
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
					"id_objeto" => 2,
					"fecha" => date('Y-m-d H:i:s'),
					"id_usuario" => $_SESSION['id_login'],//cambiar aqui para que me pueda traer el USU conectado
					"accion" => "Cambio de vista",
					"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la Vista de Proveedores"
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
		<i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PROMOCIONES
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<div class="btn btn-dark btn-lg" data-toggle="modal" data-target="#ModalCrear"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PROMOCION</div>
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
		$where="WHERE TBL_promociones.nom_promocion LIKE'%".$busqueda."%'";
	}
  
}


?>

<div class="container-fluid">
  <form class="d-flex" action="../pdf/promocionespdf.php" method="post" accept-charset="utf-8">
  	<input class="form-control me-2 light-table-filter" data-table="table_id" type="text" name="filtropromocion" placeholder="Buscar Promocion">
	<button type="submit" class="btn btn-danger mx-auto btn-lg"><i class="fas fa-file-pdf"></i> &nbsp;Descargar Reporte</button>
      </form>
  </div>
  </div>

  <br>

 
      <table class="table table-striped table-dark table_id text-center" id="tblDatos">
                         <thead>    
                         <tr>
                        <th>NOMBRE</th>
                        <th>FECHA DE INICIO</th>
                        <th>FECHA FINAL</th>
                        <th>ESTADO PROMOCION</th>
                        <th>PRECIO PROMOCION</th>
						<th>ACTUALIZAR</th>
						<TH>ELIMINAR</TH>
                        </tr>
                        </thead>
                        <tbody>

						
				<?php

include ("./cone.php");              
 $SQL="SELECT  * FROM TBL_promociones;
 $where";
$dato = mysqli_query($conexion, $SQL);

if($dato -> num_rows >0){
    while($fila=mysqli_fetch_array($dato)){
    
?>

<!-- validación para verificar fecha de vencimiento -->
	<?php
		include ("./cone.php");   
		$fecha_actual = new DateTime(date('Y-m-d'));//nueva variable para vencimiento//
		$fecha_final = new DateTime($fila['fech_fin_promo']);
        $dias = $fecha_actual->diff($fecha_final)->format('%r%a');
		if ($dias <= 0) {
			$SQL="UPDATE TBL_promociones SET id_estado_promocio=5 WHERE id_promociones=24";

			}

			$dato = mysqli_query($conexion, $SQL);
	?>


<td><?php echo $fila['nom_promocion']; ?></td>
<td><?php echo $fila['fech_ini_promo']; ?></td>
<td><?php echo $fila['fech_fin_promo']; ?></td>
<td><?php echo $fila['id_estado_promocio']; ?></td>
<td><?php echo $fila['precio_promocion']; ?></td>
<td>
				<div class="btn btn-success" data-toggle="modal" data-target="#ModalActualizar<?php echo $fila['id_promociones'];?>">
					<i class="fas fa-sync-alt"> </i>
				</div>
						<!-- Modal actualizar-->
						<div class="modal fade" id="ModalActualizar<?php echo $fila['id_promociones'];?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<?php
							if(!isset($permiso_act)){
								echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para actualizar un proveedor</div>';
								echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
							//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
							}else if($permiso_act==0){
								echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para actualizar una promoción
								<button type="button" class="close" data-dismiss="alert" onclick="window.location.reload()">X</button>
								</div>';
							}else{
						?>	
						<div class="modal-dialog" role="document">
								<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Actualizar Promocion</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form action="<?php echo SERVERURL; ?>ajax/promocionesAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
									<div class="form-group">
											<label class="color-label">Nombre Promoción</label>
											<input type="text" class="form-control" name="nombre_promo_actu" id="promo_nom" value="<?php echo $fila['nom_promocion']?>"  required>
										</div>
										<div class="form-group">
											<label class="color-label">Fecha Inicio</label>
											<input type="date" class="form-control" name="fecha_inicio_actu" id="inicio_promo" value="<?php echo $fila['fech_ini_promo']?>" required>
										</div>
										<div class="form-group">
											<label class="color-label">Fecha Final</label>
											<input type="date" class="form-control" name="fecha_fin_actu" id="fin_promo" value="<?php echo $fila['fech_fin_promo']?>" required>
										</div>
										<div class="form-group">
											<label class="color-label">Estado Promocion</label>
															<select class="form-control" name="estado_promo_actu" id="Id_producto_nuevo" value="<?php echo $fila['id_estado_promocio']?>"required>
																<!-- <option value="0">Seleccione una opción</option> -->
																<option >activa</option>
																<option >caducada</option>

															</select>
										</div>
<!-- 										<div class="form-group">
											<label class="color-label">Estado Promoción</label>											
											<input type="text" class="form-control" name="estado_promo_actu" id="estado_promo" value="<?php echo $fila['id_estado_promocio']?>" required>
										</div> -->
										<div class="form-group">
											<label class="color-label">Precio Promoción</label>
											<input type="text" class="form-control" name="precio_promo_actu" id="estado_promo" value="<?php echo $fila['precio_promocion']?>" required>
										</div>
										<div class="form-group">
											<input type="hidden" class="form-control" name="id_actualizacion" value="<?php echo $fila['id_promociones']?>">
										</div>
										<button type="submit" class="btn btn-primary">Guardar</button>
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
										</form>
									</div>
								</div>
							</div>
					</div>
					<?php
								}
							?>
			</td>
<td>
	<form class="FormularioAjax" action="<?php echo SERVERURL; ?>ajax/promocionesAjax.php" method="POST" data-form="delete" autocomplete="off">
	<input type="hidden" pattern="" class="form-control" name="id_promociones_del" value="<?php echo $fila['id_promociones'] ?>">
	<input type="hidden" pattern="" class="form-control" name="promocion_del" value="<?php echo $fila['nom_promocion'] ?>">	
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
		echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para crear una promocion</div>';
		echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
	//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
	}else if($permiso_in==0){
		echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorización para crear una promocion
		<button type="button" class="close" data-dismiss="alert" onclick="window.location.reload()">X</button>
		</div>';
	}else{
?>
<div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nueva Promoción</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>

      </div>
      <div class="modal-body text-center">
			<form action="<?php echo SERVERURL; ?>ajax/promocionesAjax.php" class="FormularioAjax" method="POST" data-form="save" autocomplete="off">
			<div class="form-group">
				<label class="color-label">Nombre</label>
				<input type="text" class="form-control" name="nombre_promo_nuevo" id="cliente_dni" maxlength="20" required>
			</div>
			<div class="form-group">
				<label class="color-label">Fecha Inicio</label>
				<input type="date" class="form-control" name="fecha_inicio_nuevo" id="cliente_dni" maxlength="27" required>
			</div>
			<div class="form-group">
				<label class="color-label">Fecha Final</label>
				<input type="date" class="form-control" name="fecha_final_nuevo" id="cliente_dni" maxlength="27" required>
			</div>
			<div class="form-group">
			<label class="color-label">Estado Promocion</label>
							<select class="form-control" name="estado_promo_nuevo" id="Id_producto_nuevo" required>
								<!-- <option value="0">Seleccione una opción</option> -->
								<option >activa</option>
								<option >caducada</option>

							</select>
			</div>
			<div class="form-group">
				<label class="color-label">Precio Promoción</label>
				<input type="text" class="form-control" onkeypress="return solonumeros (event)"  name="precio_promo_nuevo" id="cliente_dni" maxlength="4" required>
			</div>
			<br>
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