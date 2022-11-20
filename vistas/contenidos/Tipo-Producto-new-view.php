<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR TIPO DE PRODUCTO
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a  href="<?php echo SERVERURL; ?>producto-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PRODUCTO</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>producto-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PRODUCTOS</a>
		</li>
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>Tipo-Producto-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR TIPO DE PRODUCTO</a>
		</li>
	</ul>	
</div>

<div class="container-fluid">
	<form action="<?php echo SERVERURL; ?>ajax/TipoproductoAjax.php" class="form-neon FormularioAjax" method="POST" enctype="multipart/for-data" data-form="save" autocomplete="off">
		<fieldset>
			<legend><i class="fas fa-user"></i> &nbsp; Información básica</legend>
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 col-md-6">
						<div class="form-group">
							<label for="cliente_dni" class="bmd-label-floating">Tipo</label>
							<input type="text" class="form-control" name="tipo_producto_nuevo" id="cliente_dni" maxlength="27">
						</div>
					</div>
					<div class="col-12 col-md-6">
						<div class="form-group">
							<label for="cliente_nombre" class="bmd-label-floating">Tamaño Producto</label>
							<input type="text" class="form-control" name="tamaño_producto_nuevo" id="cliente_nombre" maxlength="40">
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="cliente_apellido" class="bmd-label-floating">Clasificacion</label>
							<input type="text" class="form-control" name="clasificacion_producto_nuevo" id="cliente_apellido" maxlength="40">
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