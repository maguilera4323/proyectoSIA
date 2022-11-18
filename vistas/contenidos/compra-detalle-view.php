
<title>baulphp : Sistema facturación PHP & MySQL</title>

<div class="container content-invoice">
<form action="" id="invoice-form" method="post" class="invoice-form" role="form" novalidate> 
<div class="load-animate animated fadeInUp">
<div class="row">
<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
<h3 class="text-left">
		<i class="fas fa-pallet fa-fw"></i> &nbsp; DETALLE COMPRA
	</h3>
</div>		    		
</div>
<input id="currency" type="hidden" value="$">
<div class="row">
<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    <div class="form-group">
		<label >Proveedor</label>
		<input type="text" class="form-control" name="nombre_insumo_act" id="cliente_apellido" maxlength="40" 
		style="text-transform:uppercase;" >
	</div>	
    <div class="form-group">
		<label >Usuario</label>
		<input type="text" class="form-control" name="nombre_insumo_act" id="cliente_apellido" maxlength="40" 
		style="text-transform:uppercase;" >
	</div>	
</div>      		
<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 pull-right">
    <div class="form-group">
		<label >Estado de Compra</label>
		<select class="form-control" name="categoria_insumo_act" required>
			<option value="1">Comestibles</option>
		    <option value="2">Equipo</option>
		</select>
	</div>
    <div class="form-group">
		<label>Vencimiento</label>
		<input type="hidden" pattern="" class="form-control" name="usuario_creacion" value="<?php echo $_SESSION['usuario_login']?>">
		<?php $fcha = date("Y-m-d");?>
		<input type="date" class="form-control" name="fecha_vencimiento_reg" id="fecha_vencimiento" value="<?php echo date("Y-m-d",strtotime($fcha))?>" disabled>
    </div>
    
</div>
</div>
<div class="row">
<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
    <button class="btn btn-danger delete" id="removeRows" type="button">- Borrar</button>
    <button class="btn btn-success" id="addRows" type="button">+ Agregar Más</button>
</div>
</div>
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
    <table class="table table-bordered table-hover" id="invoiceItem">	
        <tr>
            <th width="2%"><input id="checkAll" class="formcontrol" type="checkbox"></th>
            <th width="15%">Prod. No</th>
            <th width="38%">Nombre Producto</th>
            <th width="15%">Cantidad</th>
            <th width="15%">Precio</th>								
            <th width="15%">Total</th>
        </tr>							
        <tr>
            <td><input class="itemRow" type="checkbox"></td>
            <td><input type="text" name="productCode[]" id="productCode_1" class="form-control" autocomplete="off"></td>
            <td><input type="text" name="productName[]" id="productName_1" class="form-control" autocomplete="off"></td>			
            <td><input type="number" name="quantity[]" id="quantity_1" class="form-control quantity" autocomplete="off"></td>
            <td><input type="number" name="price[]" id="price_1" class="form-control price" autocomplete="off"></td>
            <td><input type="number" name="total[]" id="total_1" class="form-control total" autocomplete="off"></td>
        </tr>						
    </table>
</div>
</div>

<div class="row">	
<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
    <br>
    <div class="form-group">
        <input type="hidden" value="<?php echo $_SESSION['userid']; ?>" class="form-control" name="userId">
        <input data-loading-text="Guardando factura..." type="submit" name="invoice_btn" value="Guardar Factura" class="btn btn-success submit_btn invoice-save-btm">						
    </div>
    
</div>
<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
    <span class="form-inline">
        <div class="form-group">
            <label>Total: &nbsp;</label>
            <div class="input-group">
                <div class="input-group-addon currency">L.</div>
                <input value="" type="number" class="form-control" name="subTotal" id="subTotal" placeholder="Subtotal">
            </div>
        </div>
    </span>
</div>
</div>
<div class="clearfix"></div>		      	
</div>
</form>			
</div>
</div>	