<?php
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}
	//llamado al controlador de login
    require_once 'controladores/loginControlador.php';
    $usuario = new loginControlador(); //se crea nueva instancia de usuario

	//valdacion para ver si se recibieron datos de ingreso
    if (isset($_POST['acceder'])) {
		$datos = array(
            'usuario'=>$_POST['usuario'],
            'metodo_recuperacion'=> $_POST['acceder'],
        );
        $respuesta = $usuario->verificaUsuarioExistente($datos); //se envian los datos a la funcion accesoUsuario de modelo Login
    }
	?>

<div class="login-container">
		<div class="login-content">
		<center><img src="<?php echo SERVERURL; ?>images/CityCoffe.jpeg" id="imagen-cafe" alt="logo-empresa"></center>
		<h4 class="text-center mb-0" id="h3-login">Recuperación de Contraseña</h4>
		<p class="text-center" id="p-login">Ingrese su usuario y seleccione un método de recuperación</p>
		<?php
				  if(isset($_SESSION['respuesta'])){
					switch($_SESSION['respuesta']){
						case 'Usuario incorrecto':
							echo '<div div class="alert alert-danger text-center justify-content-center" role="alert">El usuario ingresado no existe en el sistema</div>';
						break;
						case 'Usuario inactivo':
							echo '<div div class="alert alert-danger text-center justify-content-center" role="alert">El usuario está inactivo, por lo que no se puede realizar
							la recuperación de contraseña</div>';
						break;
					 	}
				 	}
			 	?>
			<form action="" method="POST" autocomplete="off" id="loginForm">
				<div class="form-group">
					<i class="fas fa-user icon-user"></i>
					<input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario" onkeyup="validarUsuario()" required />
					<div id="message_usuario" style="position: absolute; left: 20px; top: 60px; background-color: #EFEFEF; 
					color:black; font-weight: 500; z-index:5; padding:8px;  border: 2px solid #FF4C12;" hidden>
      				Introduzca solo letras mayúsculas(A-Z).</div>
				</div>
				<button type="submit" id="btn-enviar" value="Por preguntas de seguridad" name="acceder" class="btn-login text-center">Por Preguntas de Seguridad</button>
				<button type="submit" name="acceder" value="Por medio de email" class="btn-login text-center">Por Correo Electrónico</button>
			</form>
		</div>
	</div>
