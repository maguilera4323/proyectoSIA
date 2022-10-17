<?php
	//verifica si hay sesiones iniciadas
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}

	//verifica si la variable del contador está creada
	if (!isset($_SESSION['contador_intentos'])){
		$_SESSION['contador_intentos'] = 0;
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
				 if(isset($_SESSION['respuesta'])){
					switch($_SESSION['respuesta']){
						case 'Contraseña incorrecta':
							echo '<div div class="alert alert-danger text-center" role="alert">Usuario y/o contraseña inválidos</div>';
							$_SESSION['contador_intentos']+=0.5;
						break;
						case 'Usuario inactivo':
							echo '<div class="alert alert-warning text-center">El usuario está inactivo. Comuniquese con el 
							administrador del sistema</div>';
						break;
						case 'Usuario bloqueado':
							echo '<div class="alert alert-dark text-center">El usuario está bloqueado. Comuniquese con el 
							administrador del sistema</div>';
							$_SESSION['contador_intentos']=0;
						break;
						case 'Datos incorrectos':
							echo '<div class="alert alert-danger text-center">Usuario y/o contraseña inválidos</div>';
							$_SESSION['contador_intentos']=0;
						break;
					 }
				 }
			 ?>
			<form action="" method="POST" autocomplete="off" id="loginForm">
				<div class="form-group">
					<i class="fas fa-user icon-user"></i>
					<input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario" 
					onkeyup="validarUsuario()" required />
					<div id="message_usuario" style="position: absolute; left: 20px; top: 60px; background-color: #EFEFEF; 
					color:black; font-weight: 500; z-index:5; padding:8px;  border: 2px solid #FF4C12;" hidden>
      				Introduzca solo letras mayúsculas(A-Z).</div>
					<br>
					<br>
					<i class="fas fa-eye-slash icon-clave" onclick="mostrarContrasena()"></i>
					<input type="password" class="form-control" id="clave" name="clave" placeholder="Contraseña" 
					onkeyup="validarContrasena()" required />
					<div id="message_contrasena" style="position: absolute; left: 20px; top: 120px; background-color: #EFEFEF; 
					color:black; font-weight: 500; z-index:5; padding:8px; border: 2px solid #FF4C12;" hidden>
      				Introduzca solo letras, números y caracteres especiales(!#$%&/()=?¡*+-_.@).</div>
					<input type="hidden" class="form-control" name="contador" id="contador" value=<?php echo ($_SESSION["contador_intentos"]) ?> >
				
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
				<button type="submit" name="acceder" onclick="verificar()" class="btn-login text-center">Iniciar Sesión</button>
			</form>
		</div>
	</div>
