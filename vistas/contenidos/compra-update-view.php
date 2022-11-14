<div class="full-box page-header">
    <h3 class="text-left">
        <i class="fas fa-cart-plus"></i> &nbsp; EDITAR COMPRA
    </h3>
</div>
<!-- NavBar Horizontal para agregar, buscar o listado compra -->
<div class="container-fluid">
    <ul class="full-box list-unstyled page-nav-tabs">
        <li>
            <a href="<?php echo SERVERURL; ?>compra-new/"><i class="fas fa-cart-plus"></i> &nbsp; AGREGAR COMPRA</a>
        </li>
        <li>
            <a href="<?php echo SERVERURL; ?>compra-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE COMPRAS</a>
        </li>
    </ul>
</div>

<div class="container-fluid">
	<form action="" class="form-neon" autocomplete="off">
		<fieldset>
			<legend><i class="fas fa-cart-plus"></i> &nbsp; Datos de Compra</legend>
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 col-md-3">
						<div class="form-group">
							<label for="nombre_insumo" class="bmd-label-floating">Nombre Insumo</label>
							<input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,40}" class="form-control" name="insumo_nombre_actu" id="nombre_insumo" maxlength="27">
						</div>
					</div>
					<div class="col-12 col-md-3">
						<div class="form-group">
							<label for="cantidadcompra" class="bmd-label-floating">Cantidad</label>
							<input type="text" pattern= "[0-9-]{1,27}" class="form-control" name="insumo_cantidad_actu" id="cantidadcompra" maxlength="40">
						</div>
					</div>
                    <div class="col-12 col-md-3">
						<div class="form-group">
							<label for="precioinsumo" class="bmd-label-floating">Precio Unitario  HNL</label>
							<input type="text" pattern= "[0-9-]{1,27}" class="form-control" name="insumo_precio_actu" id="precioinsumo" maxlength="40">
							<!-- <?php 
								// $numero = 15200.67;
								// number_format($numero,2);
							?>-->
						</div>
					</div>
					<div class="col-12 col-md-3">
						<div class="form-group">
							<label for="fecha_caducidad" class="bmd-label-floating">Fecha de Caducidad</label>
							<input type="date" pattern="" class="form-control" name="fechacaducidad_insumo_actu" id="fecha_caducidad"  maxlength="40">
						</div>
					</div>
                    <div class="col-12 col-md-3">
						<div class="form-group">
							<label for="fecha_compra" class="bmd-label-floating">Fecha de Compra</label>
							<input type="date" pattern="" class="form-control" name="fechacompra_insumo_actu" id="fecha_compra"  maxlength="40">
							<!-- <?php $time = time(); 
							// echo date("d-m-Y (H:i:s)", $time);
							// ?>	-->			
						</div>
					</div>
					<div class="col-12 col-md-3">
						<div class="form-group">
							<label for="proveedor_insumo" class="bmd-label-floating">Proveedor</label>
							<input type="text" pattern="[0-9()+]{8,20}" class="form-control" name="proveedor_actu" id="proveedor_insumo" maxlength="20">
						</div>
					</div>

					<div class="form-group col-md-3">
						<label for="estado_compra" class="bmd-label-floating">Estado Compra</label>
							<select class="form-control" name="estadocompra_insumo_actu">
								<option value="" selected="" disabled="">Seleccione una opción</option>
								<option value="1">En Proceso</option>
								<option value="2">Finalizada</option>
							</select>
						</div>
                    <div class="col-12 col-md-3">
						<div class="form-group">
							<label for="total_compra" class="bmd-label-floating">Total Compra</label>
							<input type="text" pattern="[0-9]{1,14}" class="form-control" name="totalcompra_insumo_actu" id="total_compra" maxlength="150">
						</div>
					</div>
				</div>
			</div>
            </fieldset>
		<br><br><br>
		<p class="text-center" style="margin-top: 20px;">
			<button type="reset" class="btn btn-raised btn-secondary btn-sm"><i class="fas fa-paint-roller"></i> &nbsp; LIMPIAR</button>
			&nbsp; &nbsp;
			<button type="submit" class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i> &nbsp; GUARDAR</button>
		</p>
	</form>
</div>