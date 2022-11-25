
	function mifuncion(valor) {
		$.ajax({     
		url : '../controladores/obtenerPrecioProducto.php',     
		data : { valor : valor },
		type : 'POST',
		dataType : 'json',
		success : function(json) {
			$('#subTotal').val(json.precio);
		},
			error : function(xhr, status) {
			alert('Disculpe, existió un problema');
		}
		});
	}   
