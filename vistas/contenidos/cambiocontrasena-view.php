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
		$datos = array(
            'contrasena_actual'=> $_POST['clave'],
            'contrasena_nueva'=> $_POST['clave_new'],
			'conf_contrasena_nueva'=> $_POST['conf_clave_new']
        );
        $respuesta = $usuario->modificarContrasena($datos); //se envian los datos a la funcion accesoUsuario de modelo Login
    }
	?>

<div class="login-container">
		<div class="login-content">
		<center><img src="<?php echo SERVERURL; ?>images/CityCoffe.jpeg" id="imagen-cafe" alt="logo-empresa"></center>
		<h4 class="text-center mb-0" id="h3-login">Cambio de Contraseña</h4>
		<p class="text-center" id="p-login">Ingrese sus datos de acceso</p>
			<?php
				 if(isset($_SESSION['respuesta'])){
					switch($_SESSION['respuesta']){
						case 'Contraseña actual no existe':
							echo '<div div class="alert alert-danger text-center" role="alert">La contraseña actual 
							ingresada no corresponde al usuario</div>';
						break;
						case 'Contraseña nueva igual a la actual':
							echo '<div class="alert alert-danger text-center">La contraseña actual y la contraseña 
							nueva no pueden ser iguales</div>';
						break;
						case 'Contraseñas no coinciden':
							echo '<div class="alert alert-danger text-center">Las nuevas contraseñas ingresadas no coinciden</div>';
						break;
						case 'Cambio de contraseña exitoso':
							header("refresh:4;url=".SERVERURL."login/");
							echo '<div class="alert alert-success text-center">Contraseña cambiada exitosamente.
							Se le redirigirá a la página de Login...</div>';
						break;
					 }
				 }
			 ?>
			<form action="" method="POST" autocomplete="off" id="loginForm">
				<div class="form-group">
					<i class="fas fa-eye-slash icon-clave" onclick="mostrarContrasena()"></i>
					<input type="password" class="form-control" id="clave" name="clave" placeholder="Contraseña actual" 
					onkeypress="return validarInputContrasena(event)" minlength="5" maxlength="30" required="" >
					<i class="fas fa-eye-slash icono_nuevo" onclick="mostrarContrasenaNueva()"></i>
					<input type="password" class="form-control" id="clave_new" name="clave_new" placeholder="Nueva contraseña" 
					onkeypress="return validarInputContrasena(event)" minlength="5" maxlength="30" required="" >
					<i class="fas fa-eye-slash icono_nuevoconf" onclick="mostrarConfContrasenaNueva()"></i>
					<input type="password" class="form-control" id="conf_clave_new" name="conf_clave_new" placeholder="Confirmar nueva contraseña" 
					onkeypress="return validarInputContrasena(event)" minlength="5" maxlength="30" required="" >
				</div>
				
				<button type="submit" name="acceder" class="btn-login text-center">Cambiar Contraseña</button>
			</form>
		</div>
	</div>