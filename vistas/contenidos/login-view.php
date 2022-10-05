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
			<p class="text-center">
				<i class="fas fa-user-circle fa-5x"></i>
			</p>

			<p class="text-center">
				Inicia sesión con tu cuenta
			</p>
			<?php
				 if(isset($_SESSION['fallo_login'])){
					/* echo $_SESSION['fallo_login']; */
					switch($_SESSION['fallo_login']){
						case 'Datos incorrectos':
							echo '<div div class="alert alert-danger" role="alert">Los datos introducidos son incorrectos</div>';
							$_SESSION['count']+=0.5;
						break;
						case 'Usuario inactivo':
							echo '<div class="alert alert-warning text-center">El usuario está inactivo</div>';
						break;
						case 'Usuario bloqueado':
							echo '<div class="alert alert-warning text-center">El usuario está bloqueado</div>';
							$_SESSION['count']=0;
						break;
					 }
				 }

			 ?>
			<form action="" method="POST" autocomplete="off" >
				<div class="form-group">
					<label for="UserName" class="bmd-label-floating"><i class="fas fa-user-secret"></i> &nbsp; Usuario</label>
					<input type="text" class="form-control" id="UserName" name="usuario" pattern="[a-zA-Z0-9]{1,35}" maxlength="35" required="" >
				</div>
				<div class="form-group">
					<label for="UserPassword" class="bmd-label-floating"><i class="fas fa-key"></i> &nbsp; Contraseña</label>
					<input type="password" class="form-control" id="UserPassword" name="clave" pattern="[a-zA-Z0-9!#$%&/@*^_-.]{5,100}" maxlength="100" required="" >
					<input type="hidden" class="form-control" name="contador" id="contador" value=<?php echo ($_SESSION["count"]) ?> >
				</div>
				<button type="submit" name="acceder" class="btn-login text-center">LOG IN</button>
			</form>
		</div>
	</div>



	