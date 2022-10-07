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



