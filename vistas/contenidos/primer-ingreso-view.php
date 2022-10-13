<?php
	//verifica si hay sesiones iniciadas
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}

	//llamado al controlador de login
    require_once 'controladores/loginControlador.php';
    $usuario = new loginControlador(); //se crea nueva instancia de usuario

	//valdacion para ver si se recibieron datos de ingreso
    if (isset($_POST['acceder'])) {
		$datos =  $_POST['agg_respuesta'];
       $respuesta = $usuario->insertarRespuestasSeguridad($datos); ///se envian los datos a la funcion accesoUsuario de modelo Login
    }
	?>

<div class="login-container">
		<div class="login-content">
		<center><img src="<?php echo SERVERURL; ?>images/CityCoffe.jpeg" id="imagen-cafe" alt="logo-empresa"></center>
		<h4 class="text-center mb-0" id="h3-login">Bienvenido</h4>
		<p class="text-center" id="p-login">Configure sus preguntas de seguridad</p>
		<p class="text-center" id="p-login"><?php echo $_SESSION['pregunta_seguridad']?> </p>
			<form action="" method="POST" autocomplete="off" id="loginForm">
				<div class="form-group">
					<input type="text" class="form-control" id="usuario" name="agg_respuesta" placeholder="Respuesta" 
					 required />
				</div>
				<button type="submit" name="acceder" class="btn-login text-center">Enviar</button>
			</form>
		</div>
	</div>
