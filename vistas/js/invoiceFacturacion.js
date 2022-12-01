//función de cálculo de la factura

$(document).ready(function(){
	$(document).on('click', '#checkAllFactura', function() {          	
		$(".itemRowFactura").prop("checked", this.checked);
	});	

	//función para generar filas al presionar el botón de agregar más
	$(document).on('click', '.itemRowFactura', function() {  	
		if ($('.itemRowFactura:checked').length == $('.itemRowFactura').length) {
			$('#checkAllFactura').prop('checked', true);
		} else {
			$('#checkAllFactura').prop('checked', false);
		}
	});

	//inicia función que sirve para agregar datos al select que se genere en cada nueva fila
	var count = $(".itemRowFactura").length;
	$(document).on('click', '#addRowsFactura', function() { 
		//variable count para generar valores unicos para el id de cada input o select
		count++;
		$(document).ready(function(){
			let $producto=document.querySelector("#nombreProducto_"+count);

			function cargarInsumo(){
				$.ajax({
					type:'GET',
					url:"../controladores/obtenerproducto.php",
					success:function(response){
						const productos=JSON.parse(response)

						let template='<option value=\"\" data-price=\"\" selected>Seleccione una opción</option>';

						productos.forEach(producto => {
							template+=`<option value=\"${producto.idProducto}\" data-price=\"${producto.precioProducto}\">${producto.nomProducto}</option>`
						})

						$producto.innerHTML=template;
					}
				});
			}

			cargarInsumo();
		})


		//se generan las filas para un nuevo insumo
		var htmlRows = '';
		htmlRows += '<tr>';
		htmlRows += '<td><input class="itemRowFactura" type="checkbox"></td>';                   
		htmlRows += '<td><select name="nombreProducto[]" id="nombreProducto_'+count+'" class="form-control">\
							<option value="" selected="" disabled="">Seleccione una opción</option>\
					</select></td>';
		htmlRows += '<td><input type="number" name="cantidad[]" id="cantidad_'+count+'" class="form-control quantity" autocomplete="off"></td>';   		
		htmlRows += '<td><input type="number" name="precio[]" id="precio_'+count+'" class="form-control price" autocomplete="off"></td>';		 
		htmlRows += '<td><input type="number" name="total[]" id="total_'+count+'" class="form-control total" autocomplete="off"></td>';          
		htmlRows += '</tr>';
		$('#invoiceItemFactura').append(htmlRows);

//funciones para las promociones


		//funcion para obtener el precio del segundo producto en adelante
		//usando un elemento de atributo
		document.getElementById("nombreProducto_"+count).onchange = function() {
			/* Referencia a los atributos data de la opción seleccionada */
			
			var mData = this.options[this.selectedIndex].dataset;
		  
			/* Referencia a los input */
			var elPrice = document.getElementById("precio_"+count);
		  
			/* Asignamos cada dato a su input*/
			elPrice.value = mData.price;
		  };
	}); 

	//funcion que se encarga de eliminar la fila y todos los registros guardados en esta
	$(document).on('click', '#removeRowsFactura', function(){
		$(".itemRowFactura:checked").each(function() {
			$(this).closest('tr').remove();
		});


		$('#checkAllFactura').prop('checked', false);
		calculateTotal();
	});		
	$(document).on('blur', "[id^=cantidad_]", function(){
		calculateTotal();
	});	
	$(document).on('blur', "[id^=precio_]", function(){
		calculateTotal();
	});	
	$(document).on('blur', "#nomdesc", function(){		
		calculateTotal();
	});
	$(document).on('blur', "#taxRate", function(){		
		calculateTotal();
	});	
	$(document).on('blur', "#amountPaid", function(){
		var amountPaid = $(this).val();
		var totalAftertax = $('#totalAftertax').val();	
		if(amountPaid && totalAftertax) {
			totalAftertax = amountPaid-totalAftertax;			
			$('#amountDue').val(totalAftertax);
		} else {
			$('#amountDue').val(totalAftertax);
		}	
	});	
	$(document).on('click', '.deleteInvoice', function(){
		var id = $(this).attr("id");
		if(confirm("¿Deseas eliminar este registro?")){
			$.ajax({
				url:"action.php",
				method:"POST",
				dataType: "json",
				data:{id:id, action:'delete_invoice'},				
				success:function(response) {
					if(response.status == 1) {
						$('#'+id).closest("tr").remove();
					}
				}
			});
		} else {
			return false;
		}
	});
});	


// funciones para las promociones
//función de cálculo de la factura

$(document).ready(function(){
	$(document).on('click', '#checkAllPromo', function() {          	
		$(".itemRowPromociones").prop("checked", this.checked);
	});	

	//función para generar filas al presionar el botón de agregar más
	$(document).on('click', '.itemRowPromociones', function() {  	
		if ($('.itemRowPromociones:checked').length == $('.itemRowPromociones').length) {
			$('#checkAllPromo').prop('checked', true);
		} else {
			$('#checkAllPromo').prop('checked', false);
		}
	});

	//inicia función que sirve para agregar datos al select que se genere en cada nueva fila
	var count = $(".itemRowPromociones").length;
	$(document).on('click', '#addRowsPromocion', function() { 
		//variable count para generar valores unicos para el id de cada input o select
		count++;
		$(document).ready(function(){
			let $promocion=document.querySelector("#nombrePromocion_"+count);

			function cargarPromocion(){
				$.ajax({
					type:'GET',
					url:"../controladores/obtenerPromocion.php",
					success:function(response){
						const promociones=JSON.parse(response)

						let template='<option value=\"\" data-price=\"\" selected>Seleccione una opción</option>';

						promociones.forEach(promocion => {
							template+=`<option value=\"${promocion.idPromocion}\" data-price=\"${promocion.precioPromocion}\">${promocion.nomPromocion}</option>`
						})

						$promocion.innerHTML=template;
					}
				});
			}

			cargarPromocion();
		})


		//se generan las filas para una nueva promocion
		var htmlRows = '';
		htmlRows += '<tr>';
		htmlRows += '<td><input class="itemRowPromociones" type="checkbox"></td>';                   
		htmlRows += '<td><select name="nombrePromocion[]" id="nombrePromocion_'+count+'" class="form-control">\
							<option value="" selected="" disabled="">Seleccione una opción</option>\
					</select></td>';
		htmlRows += '<td><input type="number" name="cantidadpromo[]" id="cantidadpromo_'+count+'" class="form-control quantitypromo" autocomplete="off"></td>';   		
		htmlRows += '<td><input type="number" name="preciopromo[]" id="preciopromo_'+count+'" class="form-control pricepromo" autocomplete="off"></td>';		 
		htmlRows += '<td><input type="number" name="totalpromo[]" id="totalpromo_'+count+'" class="form-control totalpromo" autocomplete="off"></td>';          
		htmlRows += '</tr>';
		$('#invoiceItemPromociones').append(htmlRows);

		//funcion para obtener el precio del segundo producto en adelante
		//usando un elemento de atributo
		document.getElementById("nombrePromocion_"+count).onchange = function() {
			/* Referencia a los atributos data de la opción seleccionada */
			
			var mData = this.options[this.selectedIndex].dataset;
		  
			/* Referencia a los input */
			var elPrice = document.getElementById("preciopromo_"+count);
		  
			/* Asignamos cada dato a su input*/
			elPrice.value = mData.price;
		  };
	}); 

	//funcion que se encarga de eliminar la fila y todos los registros guardados en esta
	$(document).on('click', '#removeRowsPromociones', function(){
		$(".itemRowPromociones:checked").each(function() {
			$(this).closest('tr').remove();
		});

	//funciones de instancia a la función CalculateTotal()
	//la funcion encargada de realizar los calculos en la factura
		$('#checkAllPromo').prop('checked', false);
		calculateTotal();
	});		
	$(document).on('blur', "[id^=cantidadpromo_]", function(){
		calculateTotal();
	});	
	$(document).on('blur', "[id^=preciopromo_]", function(){
		calculateTotal();
	});	
	
});	



//funcion que realiza los cálculos de las filas
function calculateTotal(){
	//la variable totalVenta es la que recaba la suma de los productos y promciones
	//este valor se transfiere al subtotal
	var totalVenta = 0; 
	//se toman los valores de los productos y sus cantidades
	$("[id^='precio_']").each(function() {
		var id = $(this).attr('id');
		id = id.replace("precio_",'');
		var price = $('#precio_'+id).val();
		var quantity  = $('#cantidad_'+id).val();
		if(!quantity) {
			quantity = 1;
		}
		var total_producto = price*quantity;
		//se manda al textbox de total individual de cada producto
		$('#total_'+id).val(parseFloat(total_producto));
		//se actualiza la variable de totalVenta con los valores de todos los productos
		totalVenta += total_producto;			
	});

	//se toman los valores de las promociones y sus cantidades
	$("[id^='preciopromo_']").each(function() {
		var id = $(this).attr('id');
		id = id.replace("preciopromo_",'');
		var pricepromo = $('#preciopromo_'+id).val();
		var quantitypromo  = $('#cantidadpromo_'+id).val();
		if(!quantitypromo) {
			quantitypromo = 1;
		}
		var total_promocion = pricepromo*quantitypromo;
		//se manda al textbox de total individual de cada promocion
		$('#totalpromo_'+id).val(parseFloat(total_promocion));	
		//se actualiza la variable de totalVenta con los valores de todos las promociones
		//estas se suman a los valores de los productos si existen	
		totalVenta += total_promocion;
	});

	//el valor de totalVenta se envia al textbox del subtotal para que se muestre en pantalla
	$('#subTotal').val(parseFloat(totalVenta));	
	var taxRate = $("#taxRate").val();
	var subTotal = $('#subTotal').val();
	var descuento = $('#nomdesc').val();	 
	if(subTotal) {
		 if (descuento){
			montoDescuento=subTotal*descuento;
			subTotalDes=subTotal-montoDescuento;
			$('#descuentomonto').val(subTotalDes);
		}else{
			subTotalDes=subTotal*1;
			
		}
		
		var taxAmount = subTotalDes*taxRate/100;
		$('#taxAmount').val(taxAmount);
		subTotalDes = parseFloat(subTotalDes)+parseFloat(taxAmount);
		$('#totalAftertax').val(subTotalDes);		
		var amountPaid = $('#amountPaid').val();
		var totalAftertax = $('#totalAftertax').val();	
		if(amountPaid && totalAftertax) {
			totalAftertax = amountPaid-totalAftertax;			
			$('#amountDue').val(totalAftertax);
		} else {		
			$('#amountDue').val(subTotalDes);
		}
	}
}
