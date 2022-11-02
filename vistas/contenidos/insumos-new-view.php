<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR INSUMO
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a href="<?php echo SERVERURL; ?>proveedor-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE INSUMOS</a>
		</li>
	</ul>	
</div>

<div class="container-fluid">
	<form action="<?php echo SERVERURL; ?>ajax/insumoAjax.php" class="form-neon FormularioAjax" method="POST" data-form="save" autocomplete="off">
		<fieldset>
			<legend><i class="fas fa-user"></i> &nbsp; Información básica</legend>
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="cliente_apellido" class="bmd-label-floating">Nombre</label>
							<input type="text" class="form-control" name="nombre_insumo_nuevo" id="cliente_apellido" maxlength="40" 
							style="text-transform:uppercase;" required/>
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="cliente_telefono" class="bmd-label-floating">Categoria</label>
							<select class="form-control" name="categoria_insumo_nuevo" required>
								<option value="" selected="" disabled="">Seleccione una opción</option>
								<option value="1">Comestibles</option>
								<option value="2">Equipo</option>
							</select>
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="cliente_direccion" class="bmd-label-floating">Cantidad Maxima</label>
							<input type="text" class="form-control" name="cantidadmax_insumo_nuevo" id="cliente_direccion" maxlength="150" required/>
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="cliente_telefono" class="bmd-label-floating">Cantidad Minima</label>
							<input type="text" class="form-control" name="cantidadmin_insumo_nuevo" id="cliente_telefono" maxlength="20" required/>
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="cliente_telefono" class="bmd-label-floating">Unidad de medida</label>
							<select class="form-control" name="unidad_insumo_nuevo" required>
								<option value="" selected="" disabled="">Seleccione una opción</option>
								<option value="1">LB</option>
								<option value="2">UN</option>
								<option value="2">L</option>
								<option value="2">GAL</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
		<br>
		<p class="text-center" style="margin-top: 40px;">
			<button type="reset" class="btn btn-raised btn-secondary btn-sm"><i class="fas fa-paint-roller"></i> &nbsp; LIMPIAR</button>
			&nbsp; &nbsp;
			<button type="submit" class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i> &nbsp; GUARDAR</button>
		</p>
	</form>
</div>