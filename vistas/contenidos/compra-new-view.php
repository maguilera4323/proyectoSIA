<div class="full-box page-header">
    <h3 class="text-left">
        <i class="fas fa-cart-plus"></i> &nbsp; AGREGAR NUEVA COMPRA
    </h3>
</div>
<!-- NavBar Horizontal para agregar, buscar o listado compra -->
<div class="container-fluid">
    <ul class="full-box list-unstyled page-nav-tabs">
        <li>
            <a class="active" href="<?php echo SERVERURL; ?>compra-new/"><i class="fas fa-cart-plus"></i> &nbsp; AGREGAR COMPRA</a>
        </li>
        <li>
            <a href="<?php echo SERVERURL; ?>compra-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE COMPRAS</a>
        </li>
    </ul>
</div>

<div class="container-fluid">
	<form action="<?php echo SERVERURL; ?>ajax/compraAjax.php" class="form-neon FormularioAjax" method="POST" enctype="multipart/for-data" data-form="save" autocomplete="off">
		<fieldset>
			<legend><i class="fas fa-cart-plus"></i> &nbsp; Datos de Compra</legend>
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 col-md-3">
						<div class="form-group">
							<label for="nombre_insumo" class="bmd-label-floating">PROVEEDOR</label>
							<select class="form-control" name="idproveedor" id="proveedorid">
								<option value="0"> Seleccione una opción</option>
								<?php
								include ("./cone.php");   
								$tipo="SELECT * FROM TBL_Proveedores";
								$resultado=mysqli_query($conexion, $tipo);
								while ($valores = mysqli_fetch_array($resultado)){
									echo '<option value="'.$valores['id_Proveedores'].'">'.$valores['id_Proveedores'].'</option>';
								}
								?>
							</select>
						</div>
					</div>
					<div class="col-12 col-md-3">
						<div class="form-group">
							<label for="cantidadcompra" class="bmd-label-floating">ID USUARIO</label>
							<input type="text" pattern= "[0-9-]{1,27}" class="form-control" name="usuarioid" id="idusuario" maxlength="40">
						</div>
					</div>
                    <div class="col-12 col-md-3">
					<div class="form-group">
							<label for="nombre_insumo" class="bmd-label-floating"> ESTADO COMPRA</label>
							<select class="form-control" name="idestadocompra" id="idcompraestado">
								<option value="0"> Seleccione una opción</option>
								<?php
								include ("./cone.php");   
								$tipo="SELECT * FROM TBL_estado_compras";
								$resultado=mysqli_query($conexion, $tipo);
								while ($valores = mysqli_fetch_array($resultado)){
									echo '<option value="'.$valores['id_estado_compra'].'">'.$valores['id_estado_compra'].'</option>';
								}
								?>
							</select>
						</div>
					</div>
                    <div class="col-12 col-md-3">
						<div class="form-group">
							<label for="fecha_compra" class="bmd-label-floating">Fecha de Compra</label>
							<input type="hidden" pattern="" class="form-control" name="usuario_creacion" value="<?php echo $_SESSION['usuario_login']?>">
								<?php $fcha = date("Y-m-d");?>
							<input type="date" class="form-control" name="fechacompra_insumo" id="fecha_compra" value="<?php echo date("Y-m-d",strtotime($fcha))?>" disabled>
						</div>
					</div>
                    <div class="col-12 col-md-3">
						<div class="form-group">
							<label for="total_compra" class="bmd-label-floating">Total Compra</label>
							<input type="text" pattern="[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ().,#\- ]{1,150}" class="form-control" name="totalcompra_insumo" id="total_compra" maxlength="150">
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