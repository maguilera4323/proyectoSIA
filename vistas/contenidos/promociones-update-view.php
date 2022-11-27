<?php
		include ("./cone.php");     

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT permiso_actualizacion FROM TBL_permisos where id_rol='$id_rol' and id_objeto=2";
			$dato = mysqli_query($conexion, $SQL);

			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
					$permiso=$fila['permiso_actualizacion'];
				}
			}

			//valida si el query anterior no retornó ningún valor
			//en este caso no había un permiso registrado del objeto para el rol del usuario conectado
			if(!isset($permiso)){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorizado actualizar proveedores</div>';
				echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
			//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
			}else if($permiso==0){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene autorizado actualizar proveedores</div>';
				echo "<script> window.location.href='".SERVERURL."promociones-list/'; </script>";
			}
			
?>
<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PROVEEDOR
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>promociones/"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PROMOCION</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>promociones-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PROMOCIONES</a>
		</li>
	</ul>	
</div>

<div class="container-fluid">

<p><?php 
				require_once "./controladores/promocionesControlador.php";
				$ins_promocion=new promocionesControlador();
					$host= $_SERVER["HTTP_HOST"];
					$url= $_SERVER["REQUEST_URI"];
					$url_completa="http://" . $host . $url; //variable con la url del sitio completa
					$id_editar = explode('/',$url_completa)[5]; 

					//instancia para obtener los datos ya guardados en la tabla de usuarios
					//para realizar los cambios de un registro
					$datos_promocion=$ins_promocion->datospromocionesControlador("unico",$id_editar);

					if($datos_promocion->rowCount()==1){
						$campos=$datos_promocion->fetch();
					}
				?></p>
	<div class="container-fluid">
	<form action="<?php echo SERVERURL; ?>ajax/promocionesAjax.php" class="form-neon FormularioAjax" method="POST" data-form="save" autocomplete="off">
		<fieldset>
			<legend><i class="fas fa-user"></i> &nbsp; Información básica</legend>
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 col-md-6">
						<div class="form-group">
							<label for="cliente_dni" class="bmd-label-floating">Nombre</label>
							<input type="text" class="form-control" name="nombre_promocion_nuevo" id="cliente_dni" maxlength="27">
						</div>
					</div>
					<div class="col-12 col-md-6">
						<div class="form-group">
							<label for="cliente_nombre" class="bmd-label-floating">Fecha Inicial</label>
							<input type="text" class="form-control" name="fecha_inicial_promocion_nuevo" id="cliente_nombre" maxlength="40">
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="cliente_apellido" class="bmd-label-floating">Fecha Final</label>
							<input type="text" class="form-control" name="fecha_final_promocion_nuevo" id="cliente_apellido" maxlength="40">
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="cliente_telefono" class="bmd-label-floating">id estado promocion</label>
							<input type="text" class="form-control" name="id_estado_promocion_nuevo" id="cliente_telefono" maxlength="20">
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="cliente_direccion" class="bmd-label-floating">Precio con Promocion</label>
							<input type="text" class="form-control" name="precio_promocion_nuevo" id="cliente_direccion" maxlength="150">
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