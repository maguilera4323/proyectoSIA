<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
}?>


<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-sync-alt fa-fw"></i> &nbsp; ACTUALIZAR USUARIO
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>user-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; NUEVO USUARIO</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>user-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE USUARIOS</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>user-search/"><i class="fas fa-search fa-fw"></i> &nbsp; BUSCAR USUARIO</a>
		</li>
	</ul>	
</div>

<div class="container-fluid">
	<!-- //codigo php para extraer el id del usuario a editar de la url -->
			<p><?php 
				require_once "./controladores/usuarioControlador.php";
				$ins_usuario=new UsuarioControlador();
					$host= $_SERVER["HTTP_HOST"];
					$url= $_SERVER["REQUEST_URI"];
					$url_completa="http://" . $host . $url; //variable con la url del sitio completa
					$id_editar = explode('/',$url_completa)[5]; 

					//instancia para obtener los datos ya guardados en la tabla de usuarios
					//para realizar los cambios de un registro
					$datos_usuario=$ins_usuario->datosUsuarioControlador("unico",$id_editar);

					if($datos_usuario->rowCount()==1){
						$campos=$datos_usuario->fetch();
					}
				?></p>
	<form class="form-neon FormularioAjax" action="<?php echo SERVERURL; ?>ajax/usuarioAjax.php" method="POST" data-form="save" autocomplete="off">
		<fieldset>
			<legend><i class="far fa-address-card"></i> &nbsp; Información personal</legend>
			
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="nom_usuario" class="bmd-label-floating">Usuario</label>
							<input type="text" pattern="[A-Z]{5,15}" class="form-control" name="usuario_actu" id="nom_usuario" maxlength="15" 
							value="<?php echo $campos['usuario']?>" required="" >
						</div>
					</div>
					
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="nombre_usuario" class="bmd-label-floating">Nombre</label>
							<input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,20}" class="form-control" name="nombre_usuario_actu" 
							id="nombre_usuario" maxlength="20" value="<?php echo $campos['nombre_usuario']?>">
						</div>

					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="nombre_usuario" class="bmd-label-floating">Estado</label>
							<select class="form-control" name="estado_actu" >
								<option value="" selected="" disabled="">Seleccione una opción</option>
								<option value="1">Activo</option>
								<option value="2">Inactivo</option>
								<option value="3">Bloqueado</option>
								<option value="4">Nuevo</option>
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
							<input type="email" class="form-control" name="correo_electronico_actu" id="correo_electronico" 
							value="<?php echo $campos['correo_electronico']?>"maxlength="70" >
						</div>
				</div>
				<div class="col-12 col-md-4">
					<div class="form-group">
					<input type="hidden" pattern="" class="form-control" name="id_actualizacion" value="<?php echo $id_editar ?>">
					<input type="hidden" pattern="" class="form-control" name="usuario_modificacion" value="<?php echo $_SESSION['usuario_login']?>">					
					<label for="contrasena" class="bmd-label-floating">Contraseña</label>
						<input type="password" class="form-control" name="contrasena_actu" id="contrasena" pattern="[a-zA-Z0-9!#%&/()=?¡*+_$@.-]{8,100}" 
						value="<?php echo $campos['contrasena']?>" maxlength="100">
					</div>
					<div class="col-12 col-md-6">
						<div class="form-group">
							<label for="primer_ingreso" class="bmd-label-floating">Ingreso</label>
							<input type="text" pattern="[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ().,#\- ]{1,20}" class="form-control" name="primer_ingreso_actu" id="primer_ingreso"
							value="<?php echo $campos['primer_ingreso']?>" maxlength="20">
						</div>
					</div>	

				<div class="col-12 col-md-6">
					<div class="form-group">
						<label for="fecha_vencimiento" class="label-floating">Vencimiento</label>
						<input type="date" pattern="" class="form-control" name="fecha_vencimiento_actu" id="fecha_vencimiento" 
						value="<?php echo $campos['fecha_vencimiento']?>" maxlength="190" disabled>
					</div>
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
					<div class="col-12">
					<div class="form-group">
						<label for="nombre_usuario" class="bmd-label-floating">Roles</label>
							<select class="form-control" name="id_rol_actu">
								<option value="" selected="" disabled="">Seleccione una opción</option>
								<option value="1">Administrador</option>
								<option value="2">Vendedor</option>
								<option value="3">Inventario</option>
							</select>
						</div>
					</div>
					</div>
				</div>
			</div>
		</fieldset>
		<p class="text-center" style="margin-top: 40px;">
			<button type="reset" class="btn btn-raised btn-secondary btn-sm"><i class="fas fa-paint-roller"></i> &nbsp; LIMPIAR</button>
			&nbsp; &nbsp;
			<button type="submit" class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i> &nbsp; GUARDAR</button>
		</p>
	</form>
</div>