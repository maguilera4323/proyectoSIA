<?php
	//verifica si hay sesiones iniciadas
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}

	//verifica si la variable del contador está creada
	if (!isset($_SESSION['count'])){
		$_SESSION['count'] = 0;
   }
	//llamado al controlador de login
    require_once 'controladores/loginControlador.php';
    $usuario = new loginControlador(); //se crea nueva instancia de usuario

	//valdacion para ver si se recibieron datos de ingreso
    if (isset($_POST['acceder'])) {
		$datos = array(
            'usuario'=> $_POST['usuario'],
            'password'=> $_POST['clave'],
			'contador'=> $_POST['contador']
        );
        $respuesta = $usuario->accesoUsuario($datos); //se envian los datos a la funcion accesoUsuario de modelo Login
    }
	?>

<div class="login-container">
		<div class="login-content">
		<center><img src="<?php echo SERVERURL; ?>images/CityCoffe.jpeg" id="imagen-cafe" alt="logo-empresa"></center>
		<h4 class="text-center mb-0" id="h3-login">Bienvenido</h4>
		<p class="text-center" id="p-login">Ingrese sus datos de acceso</p>
			<?php
				 if(isset($_SESSION['fallo_login'])){
					switch($_SESSION['fallo_login']){
						case 'Datos incorrectos':
							echo '<div div class="alert alert-danger text-center" role="alert">Los datos introducidos son incorrectos</div>';
							$_SESSION['count']+=0.5;
						break;
						case 'Usuario inactivo':
							echo '<div class="alert alert-warning text-center">El usuario está inactivo</div>';
						break;
						case 'Usuario bloqueado':
							echo '<div class="alert alert-dark text-center">El usuario está bloqueado</div>';
							$_SESSION['count']=0;
						break;
					 }
				 }
			 ?>
			<form action="" method="POST" autocomplete="off" id="loginForm">
				<div class="form-group">
					<i class="fas fa-user icon-user"></i>
					<input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario" pattern="[a-zA-Z0-9]{1,35}" maxlength="35" required="" >
					<br>
					<br>
					<i class="fas fa-eye-slash icon-clave" onclick="mostrarContrasena()"></i>
					<input type="password" class="form-control" id="clave" name="clave" placeholder="Contraseña" pattern="[a-zA-Z0-9!#$%&/@*^_-.]{5,100}" maxlength="100" required="" >
					<input type="hidden" class="form-control" name="contador" id="contador" value=<?php echo ($_SESSION["count"]) ?> >
				
				</div>
				<div class="form-group">
				</div>
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
				<button type="submit" name="acceder" class="btn-login text-center">Iniciar Sesión</button>
			</form>
		</div>
	</div>
