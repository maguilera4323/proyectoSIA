
<script>
	let btn_salir=document.querySelector(".btn-exit-system");

	btn_salir.addEventListener('click',function(e){
		e.preventDefault();
		Swal.fire({
			title: 'QUIERE CERRAR SESIÓN?',
			text: "Con esto saldras de sistema, y se cerrara la sesión",
			type: 'question',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Si, Salir',
			cancelButtonText: 'No, cancelar'
		}).then((result) => {
			if(result.value){
				let url='<?php echo SERVERURL; ?>vistas/contenidos/salir/';	
				/* let token='<?php echo $lc->encryption($_SESSION['token_login']); ?>';
				let usuario='<?php echo $lc->encryption($_SESSION['usuario_login']); ?>';

				let datos= new FormData();
				datos.append("token",token);
				datos.append("usuario",usuario);

				fetch(url,{
					method:"POST",
					body:datos
				})
				.then(respuesta=>respuesta.json())
				.then(respuesta=>{
					return alertas_ajax(respuesta);
				}); */
			}
		});
	});
	</script>
    
