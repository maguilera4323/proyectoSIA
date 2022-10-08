<?php
	session_start();
	//llamado al controlador de login
    require_once 'controladores/loginControlador.php';
    $usuario = new loginControlador(); //se crea nueva instancia de usuario

	//valdacion para ver si se recibieron datos de ingreso
    if (isset($_POST['acceder'])) {
		$datos = array(
            'usuario'=> $_POST['usuario'],
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
				  if(isset($_SESSION['fallo_login'])){
					switch($_SESSION['fallo_login']){
						case 'Usuario incorrecto':
							echo '<div div class="alert alert-danger tex-center justify-content-center" role="alert">El usuario ingresado no existe en el sistema</div>';
						break;
					 	}
				 	}
			 	?>
			<form action="" method="POST" autocomplete="off" id="loginForm">
				<div class="form-group">
					<i class="fas fa-user icon-user"></i>
					<input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario" pattern="[a-zA-Z0-9]{5,35}" maxlength="35" required="" >
				</div>
				<button type="submit" id="btn-enviar" value="Por preguntas de seguridad" name="acceder" class="btn-login text-center">Por Preguntas de Seguridad</button>
				<button type="submit" name="acceder" value="Por medio de email" class="btn-login text-center">Por Correo Electrónico</button>
			</form>
		</div>
	</div>
