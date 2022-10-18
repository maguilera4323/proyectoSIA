$(document).ready(function(){

	/*  Show/Hidden Submenus */
	$('.nav-btn-submenu').on('click', function(e){
		e.preventDefault();
		var SubMenu=$(this).next('ul');
		var iconBtn=$(this).children('.fa-chevron-down');
		if(SubMenu.hasClass('show-nav-lateral-submenu')){
			$(this).removeClass('active');
			iconBtn.removeClass('fa-rotate-180');
			SubMenu.removeClass('show-nav-lateral-submenu');
		}else{
			$(this).addClass('active');
			iconBtn.addClass('fa-rotate-180');
			SubMenu.addClass('show-nav-lateral-submenu');
		}
	});

	/*  Show/Hidden Nav Lateral */
	$('.show-nav-lateral').on('click', function(e){
		e.preventDefault();
		var NavLateral=$('.nav-lateral');
		var PageConten=$('.page-content');
		if(NavLateral.hasClass('active')){
			NavLateral.removeClass('active');
			PageConten.removeClass('active');
		}else{
			NavLateral.addClass('active');
			PageConten.addClass('active');
		}
	});

	/*  Exit system buttom */
	/* $('.btn-exit-system').on('click', function(e){
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
			if (result.value) {
				let url='<?php echo SERVERURL; ?>ajax/loginAjax.php';
				let token='<?php echo $lc->encryption($_SESSION["token_login"])';
				let usuario='<?php echo $lc->encryption($_SESSION["usuario_login"])';

				let datos=new FormData();
				datos.append("token",token);
				datos.append("usuario",usuario);

				fetch(url,{
					method:'POST',
					body:datos
				})
				.then(respuesta=>respuesta.json())
				.then(respuesta=>{
					return alertas_ajax(respuesta)
				});
			}
		});
	}); */
    
});
(function($){
    $(window).on("load",function(){
        $(".nav-lateral-content").mCustomScrollbar({
        	theme:"light-thin",
        	scrollbarPosition: "inside",
        	autoHideScrollbar: true,
        	scrollButtons: {enable: true}
        });
        $(".page-content").mCustomScrollbar({
        	theme:"dark-thin",
        	scrollbarPosition: "inside",
        	autoHideScrollbar: true,
        	scrollButtons: {enable: true}
        });
    });
})(jQuery);

$(function(){
  $('[data-toggle="popover"]').popover()
});