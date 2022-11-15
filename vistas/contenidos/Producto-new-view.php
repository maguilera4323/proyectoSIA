<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PRODUCTO
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>producto-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR PRODUCTO</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>producto-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE PRODUCTOS</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>Tipo-Producto-new/"><i class="fas fa-search fa-fw"></i> &nbsp; AGREGAR TIPO DE PRODUCTO</a>
		</li>
	</ul>	
</div>

<div class="container-fluid">
	<form action="<?php echo SERVERURL; ?>ajax/productoAjax.php" class="form-neon FormularioAjax" method="POST" enctype="multipart/for-data" data-form="save" autocomplete="off">
		<fieldset>
			<legend><i class="fas fa-user"></i> &nbsp; Información básica</legend>
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 col-md-6">
						<div class="form-group">
							<label for="nombre_producto_nuevo" class="bmd-label-floating">Nombre</label>
							<input type="text" class="form-control" name="nombre_producto_nuevo" id="nombre_pro" pattern="[a-zA-Z]{2,100}"maxlength="27">
						</div>
					</div>
					<div class="col-12 col-md-6">
						<div class="form-group">
							<label for="id_tipo_producto_nuevo" class="bmd-label-floating">Id Tipo Producto</label>
							<input type="text" class="form-control" name="id_tipo_producto_nuevo" id="id_pro" maxlength="20">
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="descripcion_producto_nuevo" class="bmd-label-floating">Descripcion</label>
							<input type="text" class="form-control" name="descripcion_producto_nuevo" id="descripcion_pro" maxlength="20">
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="precio_producto_nuevo" class="bmd-label-floating">Precio</label>
							<input type="text" class="form-control" name="precio_producto_nuevo" id="precio_pro" pattern="[0-9]{1,6}" maxlength="6">
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="archivo" class="bmd-label-floating">Agregar Imagen</label>
							<input type="file" class="form-control" name="imagen" id="imagen" accept="image/*">
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