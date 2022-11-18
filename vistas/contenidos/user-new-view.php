<?php
		include ("./cone.php");     

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT permiso_insercion FROM TBL_permisos where id_rol='$id_rol' and id_objeto=6";
			$dato = mysqli_query($conexion, $SQL);

			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
					$permiso=$fila['permiso_insercion'];
				}
			}

			//valida si el query anterior no retornó ningún valor
			//en este caso no había un permiso registrado del objeto para el rol del usuario conectado
			if(!isset($permiso)){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorizado crear usuarios</div>';
				echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
			//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
			}else if($permiso==0){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorizado crear usuarios</div>';
				echo "<script> window.location.href='".SERVERURL."user-list/'; </script>";
			}
?>



<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-plus fa-fw"></i> &nbsp; NUEVO USUARIO
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>user-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; NUEVO USUARIO</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>user-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE USUARIOS</a>
		</li>
<!-- 		<li>
			<a href="<?php echo SERVERURL; ?>user-search/"><i class="fas fa-search fa-fw"></i> &nbsp; BUSCAR USUARIO</a>
		</li> -->
	</ul>	
</div>

<div class="container-fluid">
	<form class="form-neon FormularioAjax" action="<?php echo SERVERURL; ?>ajax/usuarioAjax.php" method="POST" data-form="save" autocomplete="off">
		<fieldset>
			<legend><i class="far fa-address-card"></i> &nbsp; Información personal</legend>
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="nom_usuario" class="bmd-label-floating">Usuario</label>
							<input type="text" class="form-control" name="usuario_reg" id="nom_usuario" maxlength="15" 
							style="text-transform:uppercase;" required="" >
						</div>
					</div>
					
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="nombre_usuario" class="bmd-label-floating">Nombre</label>
							<input type="text" class="form-control" name="nombre_usuario_reg" id="nombre_usuario" 
							style="text-transform:uppercase;" maxlength="20" required="" >
						</div>
					</div>

					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="nombre_usuario" class="bmd-label-floating">Estado</label>
							<select class="form-control" name="estado" disabled>
								<option value="" disabled>Seleccione una opción</option>
							 	<option value="1">Activo</option>
								<option value="2">Inactivo</option>
								<option value="3">Bloqueado</option>
								<option value="4" selected="">Nuevo</option> 
							</select>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
		<br><br><br>
		<fieldset>
			<legend><i class="fas fa-user-lock"></i> &nbsp; Información de la cuenta</legend>
			<div class="container-fluid">
				<div class="row">
				</div>
				<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="correo_electronico" class="bmd-label-floating">Correo</label>
							<input type="email" class="form-control" name="correo_electronico_reg" id="correo_electronico" maxlength="70" required="">
						</div>
				</div>
				<div class="col-12 col-md-4">
					<div class="form-group">
						<label for="contrasena" class="bmd-label-floating">Contraseña</label>
						<input type="password" class="form-control" name="contrasena_reg" id="contrasena" pattern="[a-zA-Z0-9!#%&/()=?¡*+_$@.-]{8,100}" maxlength="100" required="" >
					</div>
					<div class="form-group">
						<label for="contrasena" class="bmd-label-floating">Confirmar Contraseña</label>
						<input type="password" class="form-control" name="conf_contrasena_reg" id="conf_contrasena" pattern="[a-zA-Z0-9!#%&/()=?¡*+_$@.-]{8,100}" maxlength="100" required="" >
					</div>
				</div>
				<div class="col-12 col-md-4">
					<div class="form-group">
						<label for="fecha_vencimiento" class="label-floating">Vencimiento</label>
						<input type="hidden" pattern="" class="form-control" name="usuario_creacion" value="<?php echo $_SESSION['usuario_login']?>">
						<?php $fcha = date("Y-m-d");?>
						<input type="date" class="form-control" name="fecha_vencimiento_reg" id="fecha_vencimiento" value="<?php echo date("Y-m-d",strtotime($fcha."+ 360 days"))?>" disabled>
					</div>
				</div>	
			</div>
		</fieldset>
		<br><br><br>
		<fieldset>
			<legend><i class="fas fa-medal"></i> &nbsp; Roles de Usuario</legend>
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<!-- p><span class="badge badge-info">Control total</span> Permisos para registrar, actualizar y eliminar</p>
						<p><span class="badge badge-success">Edición</span> Permisos para registrar y actualizar</p> -->
						<!-- <p><span class="badge badge-dark">Registrar</span> Solo permisos para registrar</p> -->
						<div class="form-group">
						<label for="nombre_usuario" class="bmd-label-floating">Roles</label>
							<select class="form-control" name="id_rol">
								<option value="" selected="" disabled="">Seleccione una opción</option>
								<option value="1">Administrador</option>
								<option value="2">Inventario</option>
								<option value="3">Vendedor</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
		<p class="text-center" style="margin-top: 40px;">
			<button type="reset" class="btn btn-raised btn-secondary btn-sm"><i class="fas fa-paint-roller"></i> &nbsp; LIMPIAR</button>
			&nbsp; &nbsp;
			<button type="submit" class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i> &nbsp; GUARDAR</button>
		<!--<button type="submit" class="btn btn-raised btn-info btn-sm"><a onclick="location. href='<?php echo SERVERURL; ?>user-list/'"><i class="far fa-save"> GUARDAR</i></button>-->

		</p>
	</form>
</div>