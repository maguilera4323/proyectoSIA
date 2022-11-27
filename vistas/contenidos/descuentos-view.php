<?php
		include ("./cone.php");     

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT permiso_insercion FROM TBL_permisos where id_rol='$id_rol' and id_objeto=2";
			$dato = mysqli_query($conexion, $SQL);

			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
					$permiso=$fila['permiso_insercion'];
				}
			}

			//valida si el query anterior no retornó ningún valor
			//en este caso no había un permiso registrado del objeto para el rol del usuario conectado
			if(!isset($permiso)){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorizado registrar descuentos</div>';
				echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
			//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
			}else if($permiso==0){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorizado registrar descuentos</div>';
				echo "<script> window.location.href='".SERVERURL."descuentos-list/'; </script>";
			}
?>

<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-plus fa-fw"></i> &nbsp; NUEVO DESCUENTO
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>descuentos/"><i class="fas fa-plus fa-fw"></i> &nbsp; REGISTRAR DESCUENTO</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>descuentos-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE DESCUENTOS</a>
		</li>
	</ul>	
</div>

<div class="container-fluid">
	<form action="<?php echo SERVERURL; ?>ajax/descuentosAjax.php" class="form-neon FormularioAjax" method="POST" data-form="save" autocomplete="off">
		<fieldset>
			<legend><i class="fas fa-user"></i> &nbsp; Información básica</legend>
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 col-md-6">
						<div class="form-group">
							<label for="cliente_dni" class="bmd-label-floating">Nombre del descuento</label>
							<input type="text" class="form-control" name="nombre_descuento_nuevo" id="cliente_dni" maxlength="27">
						</div>
					</div>
					<div class="col-12 col-md-6">
						<div class="form-group">
							<label for="cliente_nombre" class="bmd-label-floating">% del descuento</label>
							<input type="text" class="form-control" name="porcentaje_descuento_nuevo" id="cliente_nombre" maxlength="40">
						</div>
					</div>
				</div>
			</div>
		</fieldset>
		<br><br><br>
		<p class="text-center" style="margin-top: 40px;">
			<button type="reset" class="btn btn-raised btn-secondary btn-sm"><i class="fas fa-paint-roller"></i> &nbsp; LIMPIAR</button>
			&nbsp; &nbsp;
			<button type="submit" class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i> &nbsp; GUARDAR</button>
		</p>
	</form>
</div>