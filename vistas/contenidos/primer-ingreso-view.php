<?php
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}

	//verifica si la variable del contador está creada
	if (!isset($_SESSION['contador_preguntas'])){
		$_SESSION['contador_preguntas'] = 0;
   }

	//llamado al controlador de login
    require_once 'controladores/loginControlador.php';
    $usuario = new loginControlador(); //se crea nueva instancia de usuario

	//valdacion para ver si se recibieron datos de ingreso
    if (isset($_POST['acceder'])) {
		$datos = array(
            'pregunta'=> $_POST['preguntas'],
            'respuesta'=> $_POST['respuesta'],
			'usuario'=> $_SESSION['id_login'],
			'contador'=> $_POST['contador']
        );
        $respuesta = $usuario->insertarRespuestasSeguridad($datos); //se envian los datos a la funcion accesoUsuario de modelo Login
    }
	?>

<div class="login-container">
		<div class="login-content">
		<center><img src="<?php echo SERVERURL; ?>images/CityCoffe.jpeg" id="imagen-cafe" alt="logo-empresa"></center>
		<h4 class="text-center mb-0" id="h3-login">Primer Ingreso de Usuario</h4>
		<p class="text-center" id="p-login">Seleccione una pregunta e ingrese su correspondiente respuesta</p>
		<?php
			if(isset($_SESSION['respuesta'])){
				switch($_SESSION['respuesta']){
				case 'Pregunta ya respondida':
					echo '<div class="alert alert-danger text-center justify-content-center" 
					role="alert">La pregunta ya fue respondida. Seleccione otra pregunta de la lista</div>';
				break;
				}
			}
		?>
			<br>
			<form action="" method="POST" autocomplete="off" id="loginForm">
			<div class="caja">
			<select name="preguntas" id="preguntas">
				    <option selected>Seleccione una pregunta</option>
				    <option value="1">¿Cual es su deporte favorito</option>
					<option value="2">¿Nombre de su mascota?</option>
					<option value="3">¿Lugar de nacimiento?</option>
					<option value="4">¿Comida favorita?</option>
					<option value="5">¿Nombre de su primer hijo(a)?</option>
					<option value="6">¿Canción favorita?</option>
                 </select>
			</div>
				<div class="form-group">
				<i class="fab fa-adn icon-user"></i>
				<input type="hidden" class="form-control" name="contador" id="contador" value=<?php echo ($_SESSION["contador_preguntas"]) ?> >
					<input type="text" class="form-control" id="respuesta" name="respuesta" placeholder="Respuesta" maxlength="35" required="" >
				</div>
				<button type="submit" name="acceder" class="btn-login text-center">Enviar Respuesta</button>
			</form>
		</div>
	</div>