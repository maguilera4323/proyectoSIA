//funciones para poder ver la contraseña con el icono del ojo
function mostrarContrasena(){
        let tipo = document.getElementById("clave");
        if(tipo.type == "password"){
            tipo.type = "text";
            $('.icon-clave').removeClass('fas fa-eye-slash').addClass('fas fa-eye');
        }else{
            tipo.type = "password";
            $('.icon-clave').removeClass('fas fa-eye').addClass('fas fa-eye-slash');
        }
    }


function mostrarContrasenaNueva(){
     let tipo = document.getElementById("clave_new");
    if(tipo.type === "password"){
        tipo.type = "text";
        $('.icono_nuevo').removeClass('fas fa-eye-slash').addClass('fas fa-eye');
    }else{
        tipo.type = "password";
        $('.icono_nuevo').removeClass('fas fa-eye').addClass('fas fa-eye-slash');
    }
}

function mostrarConfContrasenaNueva(){
    let tipo = document.getElementById("conf_clave_new");
   if(tipo.type == "password"){
       tipo.type = "text";
       $('.icono_nuevoconf').removeClass('fas fa-eye-slash').addClass('fas fa-eye');
   }else{
       tipo.type = "password";
       $('.icono_nuevoconf').removeClass('fas fa-eye').addClass('fas fa-eye-slash');
   }
}


//funciones para validar el texto ingresado en las cajas de texto

// La siguiente funcion valida el elemento input
function validarUsuario() {
    // Variable que usaremos para determinar si el input es valido
    let isValid = false;

    // El input que queremos validar
    const input = document.forms['loginForm']['usuario'];

    //El div con el mensaje de advertencia:
    const message = document.getElementById('message_usuario');

    input.willValidate = false;

    // El tamaño maximo para nuestro input
    const maximo = 35;

    // El pattern que vamos a comprobar
    const pattern = new RegExp('^[A-ZÑ]+$');

    // Primera validacion, si input esta vacio entonces no es valido
    if(!input.value) {
      isValid = false;
    } else {
      // Segunda validacion, si input es mayor que 35
      if(input.value.length > maximo) {
        isValid = false;
      } else {
        // Tercera validacion, si input contiene caracteres diferentes a los permitidos
        if(!pattern.test(input.value)){ 
        // Si queremos agregar letras acentuadas y/o letra ñ debemos usar
        // codigos de Unicode (ejemplo: Ñ: \u00D1  ñ: \u00F1)
          isValid = false;
        } else {
          // Si pasamos todas la validaciones anteriores, entonces el input es valido
          isValid = true;
        }
      }
    }

    //Ahora coloreamos el borde de nuestro input
    if(!isValid) {
      // mostramos mensaje
      message.hidden = false;
    } else {
      // ocultamos mensaje;
      message.hidden = true;
    }

    // devolvemos el valor de isValid
    return isValid;
  }

  

function validarContrasena() {
    // Variable que usaremos para determinar si el input es valido
    let isValid = false;

    // El input que queremos validar
    const input = document.forms['loginForm']['clave'];

    //El div con el mensaje de advertencia:
    const message = document.getElementById('message_contrasena');

    input.willValidate = false;

    // El tamaño maximo para nuestro input
    const maximo = 35;

    // El pattern que vamos a comprobar
    const pattern = new RegExp('^[A-ZÑ!#$%&/()=?¡*+-_.@]+$','i');

    // Primera validacion, si input esta vacio entonces no es valido
    if(!input.value) {
      isValid = false;
    } else {
      // Segunda validacion, si input es mayor que 35
      if(input.value.length > maximo) {
        isValid = false;
      } else {
        // Tercera validacion, si input contiene caracteres diferentes a los permitidos
        if(!pattern.test(input.value)){ 
        // Si queremos agregar letras acentuadas y/o letra ñ debemos usar
        // codigos de Unicode (ejemplo: Ñ: \u00D1  ñ: \u00F1)
          isValid = false;
        } else {
          // Si pasamos todas la validaciones anteriores, entonces el input es valido
          isValid = true;
        }
      }
    }

    //Ahora coloreamos el borde de nuestro input
    if(!isValid) {
      // mostramos mensaje
      message.hidden = false;
    } else {
      // ocultamos mensaje;
      message.hidden = true;
    }

    // devolvemos el valor de isValid
    return isValid;
  }


function modalContrasena(){
  const formularios_ajax = document.querySelectorAll("#loginForm");

function enviar_formulario_ajax(e){
	e.preventDefault();

	let data = new FormData(this);
	let method = this.getAttribute("method");
	let action = this.getAttribute("action");
	let tipo = this.getAttribute("data-form");

	let encabezados = new Headers();

	let config = {
		method: method,
		headers: encabezados,
		mode: 'cors',
		cache: 'no-cache',
		body: data
	}

	let texto_alerta;

	if(tipo==="save"){
		texto_alerta="Los datos quedaran guardados en el sistema";
	}else if(tipo==="delete"){
		texto_alerta="Los datos serán eliminados completamente del sistema";
	}else if(tipo==="update"){
		texto_alerta="Los datos del sistema serán actualizados";
	}else if(tipo==="search"){
		texto_alerta="Se eliminará el término de búsqueda y tendrás que escribir uno nuevo";
	}else if(tipo==="loans"){
		texto_alerta="Desea remover los datos seleccionados para préstamos o reservaciones";
	}else{
		texto_alerta="Quieres realizar la operación solicitada";
	}

	Swal.fire({
		title: '¿Estás seguro?',
		text: texto_alerta,
		type: 'question',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: 'Aceptar',
		cancelButtonText: 'Cancelar'
	}).then((result) => {
		if(result.value){
			fetch(action,config)
			.then(respuesta => respuesta.json())
			.then(respuesta => {
				return alertas_ajax(respuesta);
			});
		}
	});

}
}
  

 
 




