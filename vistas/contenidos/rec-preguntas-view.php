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
            'pregunta'=> $_POST['preguntas'],
            'respuesta'=> $_POST['respuesta'],
        );
        $respuesta = $usuario->verificaPreguntaSeguridad($datos); //se envian los datos a la funcion accesoUsuario de modelo Login
    }
	?>

<div class="login-container">
		<div class="login-content">
		<center><img src="<?php echo SERVERURL; ?>images/CityCoffe.jpeg" id="imagen-cafe" alt="logo-empresa"></center>
		<h4 class="text-center mb-0" id="h3-login">Recuperación por Preguntas de Seguridad</h4>
		<p class="text-center" id="p-login">Seleccione una pregunta y responda correctamente</p>
		<?php
			if(isset($_SESSION['fallo'])){
				switch($_SESSION['fallo']){
				case 'Respuesta incorrecta':
					header("refresh:4;url=".SERVERURL."login/"); 
					echo '<div div class="alert alert-danger text-center justify-content-center" 
					role="alert">Respuesta incorrecta. El usuario ha sido bloqueado</div>';
				break;
				}
			}
		?>
			<br>
			<form action="" method="POST" autocomplete="off" id="loginForm">
			<div class="caja">
			<select name="preguntas" id="preguntas">
				    <option selected>Seleccione una pregunta</option>
				    <option value="Cual es su deporte favorito?">¿Cual es su deporte favorito</option>
					<option value="Nombre de su mascota">¿Nombre de su mascota?</option>
					<option value="Lugar de nacimiento">¿Lugar de nacimiento?</option>
                 </select>
			</div>
				<div class="form-group">
				<i class="fab fa-adn icon-user"></i>
					<input type="text" class="form-control" id="respuesta" name="respuesta" placeholder="Respuesta" maxlength="35" required="" >
				</div>
				<button type="submit" name="acceder" class="btn-login text-center">Enviar Respuesta</button>
			</form>
		</div>
	</div>