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
function validarInputUsuario(e) {
    tecla = (document.all) ? e.keyCode : e.which;

    //Tecla de retroceso para borrar
    if (tecla == 8) {
        return true;
    }

    // Patrón de entrada, en este caso solo acepta numeros y letras
    patron = /[A-ZÑ]/;
    tecla_final = String.fromCharCode(tecla);
    return patron.test(tecla_final);
}

function validarInputContrasena(e) {
    tecla = (document.all) ? e.keyCode : e.which;

    //Tecla de retroceso para borrar
    if (tecla == 8) {
        return true;
    }

     // Patrón de entrada, en este caso solo acepta numeros y letras
    patron = /[A-Za-zñÑ0-9!#$%&=?¿¡*-_.+@]+/;
    tecla_final = String.fromCharCode(tecla);
    return patron.test(tecla_final);
    }




