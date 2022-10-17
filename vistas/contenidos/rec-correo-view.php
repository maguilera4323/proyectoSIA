<?php
	//llamado al controlador de login
    require_once 'controladores/emailControlador.php';
    $agg_correo = new Correo(); //se crea nueva instancia de usuario

	//valdacion para ver si se recibieron datos de ingreso
    if (isset($_POST['acceder'])) {
		$correo =  $_POST['correo'];
        $respuesta = $agg_correo->enviarCorreo($correo); //se envian los datos a la funcion accesoUsuario de modelo Login
    }
	?>

<div class="login-container">
		<div class="login-content">
		<center><img src="<?php echo SERVERURL; ?>images/CityCoffe.jpeg" id="imagen-cafe" alt="logo-empresa"></center>
		<h4 class="text-center mb-0" id="h3-login">Recuperación por Correo Electrónico</h4>
		<p class="text-center" id="p-login">Ingrese el correo electrónico registrado en su usuario</p>
		<?php
				  if(isset($_SESSION['respuesta'])){
					switch($_SESSION['respuesta']){
						case 'Correo enviado':
							header("refresh:4;url=".SERVERURL."login/");
							echo '<div class="alert alert-success text-center">Correo enviado exitosamente.
							Se le redirigirá a la página de Login...</div>';
						break;
					 	}
				 	}
			 		?>
			<form action="" method="POST" autocomplete="off" id="loginForm">
				<div class="form-group">
					<i class="fas fa-user-secret icon-user"></i>
					<input type="email" class="form-control" id="usuario" name="correo" placeholder="Correo electrónico" required />
				</div>
				<button type="submit" id="btn-enviar" value="Por preguntas de seguridad" name="acceder" class="btn-login text-center">Enviar</button>
			</form>
		</div>
	</div>