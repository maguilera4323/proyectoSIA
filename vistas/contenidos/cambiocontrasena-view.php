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
				 if(isset($_SESSION['fallo_login'])){
					switch($_SESSION['fallo_login']){
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
					<input type="password" class="form-control" id="clave" name="clave" placeholder="Contraseña actual" pattern="[a-zA-Z0-9!#$%&/@*^_-.]{5,100}" maxlength="100" required="" >
					<i class="fas fa-eye-slash icono_nuevo" onclick="mostrarContrasenaNueva()"></i>
					<input type="password" class="form-control" id="clave_new" name="clave_new" placeholder="Nueva contraseña" pattern="[a-zA-Z0-9!#$%&/@*^_-.]{5,100}" maxlength="100" required="" >
					<i class="fas fa-eye-slash icono_nuevoconf" onclick="mostrarConfContrasenaNueva()"></i>
					<input type="password" class="form-control" id="conf_clave_new" name="conf_clave_new" placeholder="Confirmar nueva contraseña" pattern="[a-zA-Z0-9!#$%&/@*^_-.]{5,100}" maxlength="100" required="" >
				</div>
				
				<button type="submit" name="acceder" class="btn-login text-center">Cambiar Contraseña</button>
			</form>
		</div>
	</div>


<!-- <section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
            <form action="" method="POST" id="formlg">
				<div class="col-md-6 text-center mb-5">
				</div>
			</div>
		<form action="" method="POST" id="formlg">
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap py-5">
		      	<div class="img d-flex align-items-center justify-content-center" style="background-image: url(images/CityCoffe.jpeg);"></div>
		      	<center><img src="<?php echo SERVERURL; ?>images/CityCoffe.jpeg" id="imagen-cafe" alt="logo-empresa"></center>
				<h3 class="text-center mb-0" id="h3-login">Bienvenido</h3>
		      	<p class="text-center">Ingrese sus datos de acceso</p>
				  <?php
				 if(isset($_SESSION['fallo_login'])){
					/* echo $_SESSION['fallo_login']; */
					switch($_SESSION['fallo_login']){
						case 'Datos incorrectos':
							echo '<div div class="alert alert-danger" role="alert">Usuario y/o contraseña incorrectos</div>';
							$_SESSION['count']+=0.5;
						break;
						case 'Usuario inactivo':
							echo '<div class="alert alert-warning text-center">Usuario inactivo. Comuniquese con el administrador del sistema.</div>';
						break;
						case 'Usuario bloqueado':
							echo '<div class="alert alert-warning text-center">Usuario bloqueado. Comuniquese con el administrador del sistema</div>';
							$_SESSION['count']=0;
						break;
					 	}
				 	}
			 		?>
					<br>
				<form action="#" class="login-form">
				<div class="form-group">
		      			<div class="icon d-flex align-items-center justify-content-center"></span></div>
		      			<input type="text" class="form-control" name="usuario" id="usuario" style="text-transform: uppercase" placeholder="Usuario" 
						required pattern="[A-Za-zñÑ!#$%&/=?¡*.-_@\~^]+" title="Ingrese solo letras y números sin espacios" />
		      		</div>
	            <div class="form-group">
				<div class="icon d-flex align-items-center justify-content-center"><span> <i class="bi bi-eye-slash icono" onclick="mostrarContrasena()"></i></span></div>
	              <input type="password" class="form-control clave" name="clave" id="clave" minlength="5" maxlength="20" placeholder="Contraseña"
				   required />
	            </div>
				<input type="hidden" class="form-control" name="contador" id="contador" value=<?php echo $_SESSION["count"] ?> />
	            <div class="form-group d-md-flex">
						<div class="w-100 text-md-right" id=opcion_rec>
							<a href="<?php echo SERVERURL; ?>olvido-contrasena/" id="opcion_rec">¿Olvidó su contraseña?</a>
						</div>
	            </div>
				<div class="form-group d-md-flex">
						<div class="w-100 text-md-right">
							<a href="nuevo_usuario.php" id=opcion_reg>Registrese</a>
						</div>
	            </div>
	            <div class="form-group">
	            	<button type="submit" id="btn-enviar" class="btn form-control btn-primary rounded submit px-3"
					data-bs-toggle="modal" name="acceder" data-bs-target="#exampleModal">Iniciar Sesión</button>
	            </div>
				</div>
			</div>
		 </form>
		</div>
	</section> --> 