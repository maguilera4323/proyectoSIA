//funciones para poder ver ver las contraseñas en los campos de contraseña
//función del login
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

//funciones de cambio de contraseña
function mostrarContrasenaNueva(){
    let tipo = document.getElementById("clave_new");
   if(tipo.type == "password"){
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
function validarUsuario() {
    let isValid = false;
    const input = document.forms['loginForm']['usuario'];
    const message = document.getElementById('message_usuario');
    input.willValidate = false;
    const maximo = 35;
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

    //se envia el mensaje a mostrar
    if(!isValid) {
      message.hidden = false;
    } else {
      message.hidden = true;
    }
    return isValid;
  }

  

function validarContrasena() {
    let isValid = false;
    const input = document.forms['loginForm']['clave'];
    const message = document.getElementById('message_contrasena');
    input.willValidate = false;
    const maximo = 35;
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

    //se envia mensaje si es valido
    if(!isValid) {
      message.hidden = false;
    } else {
      message.hidden = true;
    }
    return isValid;
  }




  

 
 




