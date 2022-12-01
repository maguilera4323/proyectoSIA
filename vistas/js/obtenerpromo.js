	//funcion para obtener el precio del primer producto
	//usando un elemento de atributo
	document.getElementById('nombrePromocion_1').onchange = function() {
		/* Referencia a los atributos data de la opción seleccionada */
		var mData = this.options[this.selectedIndex].dataset;
	  
		/* Referencia a los input */
		var elPrice = document.getElementById('preciopromo_1');
	  
		/* Asignamos cada dato a su input*/
		elPrice.value = mData.price;
	  };
