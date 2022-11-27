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

//funcion que realiza los cálculos de las filas
function calculateTotal(){
	var totalAmount = 0; 
	$("[id^='precio_']").each(function() {
		var id = $(this).attr('id');
		id = id.replace("precio_",'');
		var price = $('#precio_'+id).val();
		var quantity  = $('#cantidad_'+id).val();
		if(!quantity) {
			quantity = 1;
		}
		var total = price*quantity;
		$('#total_'+id).val(parseFloat(total));
		totalAmount += total;			
	});
	$('#subTotal').val(parseFloat(totalAmount));	
	var taxRate = $("#taxRate").val();
	var subTotal = $('#subTotal').val();	
	if(subTotal) {
		var taxAmount = subTotal*taxRate/100;
		$('#taxAmount').val(taxAmount);
		subTotal = parseFloat(subTotal)+parseFloat(taxAmount);
		$('#totalAftertax').val(subTotal);		
		var amountPaid = $('#amountPaid').val();
		var totalAftertax = $('#totalAftertax').val();	
		if(amountPaid && totalAftertax) {
			totalAftertax = amountPaid-totalAftertax;			
			$('#amountDue').val(totalAftertax);
		} else {		
			$('#amountDue').val(subTotal);
		}
	}
}
