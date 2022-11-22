//función de cálculo de la factura

$(document).ready(function(){
	$(document).on('click', '#checkAll', function() {          	
		$(".itemRow").prop("checked", this.checked);
	});	

	//función para generar filas al presionar el botón de agregar más
	$(document).on('click', '.itemRow', function() {  	
		if ($('.itemRow:checked').length == $('.itemRow').length) {
			$('#checkAll').prop('checked', true);
		} else {
			$('#checkAll').prop('checked', false);
		}
	});

	//inicia función que sirve para agregar datos al select que se genere en cada nueva fila
	var count = $(".itemRow").length;
	$(document).on('click', '#addRows', function() { 
		//variable count para generar valores unicos para el id de cada input o select
		count++;
		$(document).ready(function(){
			let $insumo=document.querySelector("#productName_"+count);

			function cargarInsumo(){
				$.ajax({
					type:'GET',
					url:"../controladores/obtenerInsumos.php",
					success:function(response){
						const insumos=JSON.parse(response)

						let template='<option class="form-control" selected disabled> Seleccione una opción</option>';

						insumos.forEach(insumo => {
							template+=`<option value="${insumo.idInsumo}">${insumo.nomInsumo}</option>`
						})

						$insumo.innerHTML=template;
					}
				});
			}

			cargarInsumo();
		})
		//termina función

		//se generan las filas para un nuevo insumo
		var htmlRows = '';
		htmlRows += '<tr>';
		htmlRows += '<td><input class="itemRow" type="checkbox"></td>';         
		htmlRows += '<td><select name="productName[]" id="productName_'+count+'" class="form-control">\
							<option value="" selected="" disabled="">Seleccione una opción</option>\
					</select></td>';
		htmlRows +='<td><input type="date" name="fechaCaducidad[]" id="fechaCaducidad_'+count+'" class="form-control" autocomplete="off"></td>';
		htmlRows += '<td><input type="number" name="quantity[]" id="quantity_'+count+'" class="form-control quantity" autocomplete="off"></td>';   		
		htmlRows += '<td><input type="number" name="price[]" id="price_'+count+'" class="form-control price" autocomplete="off"></td>';		 
		htmlRows += '<td><input type="number" name="totales[]" id="totales_'+count+'" class="form-control total" autocomplete="off"></td>';          
		htmlRows += '</tr>';
		$('#invoiceItem').append(htmlRows);
	}); 

	//funcion que se encarga de eliminar la fila y todos los registros guardados en esta
	$(document).on('click', '#removeRows', function(){
		$(".itemRow:checked").each(function() {
			$(this).closest('tr').remove();
		});
		$('#checkAll').prop('checked', false);
		calculateTotalCompra();
	});		
	$(document).on('blur', "[id^=quantity_]", function(){
		calculateTotalCompra();
	});	
	$(document).on('blur', "[id^=price_]", function(){
		calculateTotalCompra();
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
function calculateTotalCompra(){
	var totalAmount = 0; 
	$("[id^='price_']").each(function() {
		var id = $(this).attr('id');
		id = id.replace("price_",'');
		var price = $('#price_'+id).val();
		var quantity  = $('#quantity_'+id).val();
		if(!quantity) {
			quantity = 1;
		}
		var total = price*quantity;
		$('#totales_'+id).val(parseFloat(total));
		totalAmount += total;			
	});
	$('#subTotal').val(parseFloat(totalAmount));	
	
}
