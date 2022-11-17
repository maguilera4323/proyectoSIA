<div class="full-box page-header">
    <h3 class="text-left">
        <i class="fas fa-clipboard-list fa-fw"></i>FACTURACIÓN</h1>
    </h3>
       
      
</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>facturacion/"><i class="fas fa-plus fa-fw"></i> &nbsp; NUEVA VENTA</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>proveedor-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE FACTURAS</a>
		</li>
		</ul>	
</div>       
        <!-- BOTON PARA HACER LA BUSQUEDA DE CLIENTE -->
        <div class="container-fluid">
             <form class="d-flex">
                <input class="form-control me-2 light-table-filter" data-table="table_id" type="text" 
                placeholder="Buscar Cliente">
                <hr>
             </form>
        </div>
        
        <div class="container-fluid">
    <form action="" class="form-neon" autocomplete="off">
        <fieldset>
            <legend><i class="fas fa-user"></i> &nbsp; Información Factura</legend>
             
            <!-- BOTON PARA AGREGAR CLIENTE -->              
             <a class="active" href="<?php echo SERVERURL; ?>client-update/"><i class="fas fa-plus fa-fw"></i> &nbsp; Agregar Nuevo</a>            
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="cliente_nombre" class="bmd-label-floating">Nombre de Cliente</label>
                            <input type="text" pattern="[a-zA-z0-9áéíóúÁÉÍÓÚñÑ. ]{1,70}" class="form-control" name="empresa_nombre_reg" id="empresa_nombre" maxlength="70">
                        </div>
                    </div>

                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="RTN_cliente" class="bmd-label-floating">RTN</label>
                            <input type="text" pattern="[0-9()+]{8,20}" class="form-control" name="RTN_cliente_reg" id="RTN_cliente" maxlength="14">
                        </div>
                    </div>
                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="numero_factura" class="bmd-label-floating">Numero de factura</label>
                            <input type="text" pattern="[0-9()+]{8,20}" class="form-control" name="numero_factura" id="numero_factura" maxlength="14">
                        </div>
                    </div>
                    <div class="col-12 col-md-3">
						<div class="form-group">
							<label for="fecha_pedido" class="bmd-label-floating">Fecha de pedido</label>
							<input type="date" pattern="" class="form-control" name="fecha_pedido" id="fecha_caducidad"  maxlength="40">
						</div>
					</div>
                    <div class="col-12 col-md-3">
						<div class="form-group">
							<label for="fecha_entrega" class="bmd-label-floating">Fecha entrega</label>
							<input type="date" pattern="" class="form-control" name="fecha_entrega" id="fecha_entrega"  maxlength="14">
						</div>
					</div>
                    <div class="col-12 col-md-3">
                        <div class="form-group">
                            <label for="sitio_entrega" class="bmd-label-floating">Sitio de Entrega</label>
                            <input type="text" pattern="[a-zA-z0-9áéíóúÁÉÍÓÚñÑ. ]{1,70}" class="form-control" name="sitio_entrega" id="siito_entrega" maxlength="70">
                        </div>
                    </div>
                    <div class="col-12 col-md-3">
                        <div class="form-group">
						    <label for="estado_pedido" class="bmd-label-floating">Estado de Pedido</label>
							    <select class="form-control" name="estado_pedido">
								    <option value="" selected="" disabled="">Seleccione una opción</option>
								    <option value="1">En Proceso</option>
								    <option value="2">Finalizada</option>
							    </select>
					    </div>
                    </div>
                    <div class="col-12 col-md-3">    
                        <div class="form-group">
						    <label for="forma_pago" class="bmd-label-floating">Forma de Pago</label>
							    <select class="form-control" name="forma_pago">
								    <option value="" selected="" disabled="">Seleccione una opción</option>
								    <option value="1">Tarjeta de Credito</option>
								    <option value="2">Efectivo</option>
                                    <option value="3">Transferencia</option>
                                    <option value="4">Boton de Pago</option>
							    </select>
						</div>
                    </div>
                </div>
            </div>
        </fieldset>
        
    </form>
</div>       
        <section>
            <table class="table table-striped table-dark table_id text-center" id="tbldatos">
                    <thead>    
                         <tr>
                            <th>CODIGO</th>
                            <th colspan="2">DESCRIPCIÓN</th>
                            <th >CANTIDAD</th>
                            <th>PRECIO</th>
                            <th>PRECIO TOTAL</th>
                    	    <th>ACCIÓN</th>
						   
                        </tr>

                        <tr>
                            <td><input type="text" name="txt_cod_producto" id="txt_cod_producto"></td>
                            <td colspan="2"><input type="text" name="txt_descripcion" id="txt_descripcion" value="-"></td>
                            <td><input type="text" name="txt_cant_producto" id="txt_cant_producto" value="0" min="1" disabled></td>
                            <td><input type="text" name="txt_precio" id="txt_precio" value="0.00" disabled></td>
                            <td><input type="text" name="txt_precio_total" id="txt_precio_total" value="0.00" disabled></td>
                            <td><a href="#" id="add_producto_venta" class="link_add"><i class="fas fa-plus">Agregar</i></a> </td>
                        </tr>

                        <tr>
                            <th>CÓDIGO</th>
                            <th colspan="2">DESCRIPCIÓN</th>
                            <th>CANTIDAD</th>
                            <th class="textrigth">PRECIO</th>
                            <th class="textrigth">PRECIO TOTAL</th>
                            <th>ACCIÓN</th>
                        </tr> 
                    </thead>
                    <tbody id="detalle venta">
                        <td>1</td>
                        <td colspan="2">Mouse USB</td>
                        <td class="textcentre">1</td>
                        <td class="textrigth">100.00</td>
                        <td class="textrigth">100.00</td>
                        <td class="">
                            <a class="link_delete" href="#" onclick="event.preventDefault();
                            del_producto_detalle(1);"><i class="far fa-trash-alt"></i></a>
                        </td>                       
                    </tbody>    
                    
                        <tr>
                            <td colspan="5" class="textrigth">SUBTOTAL L.</td>
                            <td class="textrigth">1000.00</td>
                        </tr>
                        <tr>
                            <td colspan="5" class="textrigth">ISV (15%)</td>
                            <td class="textrigth">15</td>
                        </tr>
                        <tr>
                            <td colspan="5" class="textrigth">TOTAL A PAGAR L.</td>
                            <td class="textrigth">800.00</td>
                        </tr>
                                                                                                                                                                                                         
            </table>  
            <p class="text-center" style="margin-top: 40px;">
                <button type="reset" class="btn btn-raised btn-secondary btn-sm"><i class="fas fa-paint-roller"></i> &nbsp; LIMPIAR</button>
                &nbsp; &nbsp;
                <button type="submit" class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i> &nbsp; GUARDAR</button>
            </p>

        </section>
            
                        