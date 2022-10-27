$(obtener_registros());

function obtener_registros(TBL_bitacora)
{
	$.ajax({
		url : 'consulta.php',
		type : 'POST',
		dataType : 'thml',
		data : { TBL_bitacora: TBL_bitacora },
		})

	.done(function(resultado){
		$("#tabla_resultado").html(resultado);
	})
}

$(document).on('keyup', '#busqueda', function()
{
	var valorBusqueda=$(this).val();
	if (valorBusqueda!="")
	{
		obtener_registros(valorBusqueda);
	}
	else
		{
			obtener_registros();
		}
});