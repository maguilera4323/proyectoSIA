function mosContrasena(){
document.querySelector('.contrasena span').addEventListener('click', e => {
    const passwordInput = document.querySelector('#contrasena');
    if(passwordInput.type == "password"){
        passwordInput.type = "text";
        $('.icon-clave').removeClass('fas fa-eye-slash').addClass('fas fa-eye');
    }else{
        passwordInput.type = "password";
        $('.icon-clave').removeClass('fas fa-eye').addClass('fas fa-eye-slash');
    }
   }
)};

function mosConfContrasena(){
    document.querySelector('.conf-contrasena span').addEventListener('click', e => {
        const passwordInput2 = document.querySelector('#conf_contra');
        if(passwordInput2.type == "password"){
            passwordInput2.type = "text";
            $('.icon-confclave').removeClass('fas fa-eye-slash').addClass('fas fa-eye');
        }else{
            passwordInput2.type = "password";
            $('.icon-confclave').removeClass('fas fa-eye').addClass('fas fa-eye-slash');
        }
       }
    )};
