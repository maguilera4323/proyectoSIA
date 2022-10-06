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

<!-- <div class="login-container">
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
	</div> -->

	<section class="ftco-section">
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
		      	<h3 class="text-center mb-0">Bienvenido</h3>
		      	<p class="text-center">Ingrese sus datos de acceso</p>
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
							<a href="Rec_clave.php" id=opcion_rec>¿Olvidó su contraseña?</a>
						</div>
	            </div>
				<div class="form-group d-md-flex">
						<div class="w-100 text-md-right">
							<a href="nuevo_usuario.php" id=opcion_reg>Registrese</a>
						</div>
	            </div>
	            <div class="form-group">
	            	<button type="submit" id="btn-enviar "class="btn form-control btn-primary rounded submit px-3"
					data-bs-toggle="modal" name="acceder" data-bs-target="#exampleModal">Iniciar Sesión</button>
	            </div>
				</div>
			</div>
		 </form>
		</div>
	</section>

	