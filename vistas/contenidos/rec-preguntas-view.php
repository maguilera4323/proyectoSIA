<?php
	session_start();
	//llamado al controlador de login
    require_once 'controladores/loginControlador.php';
    $usuario = new loginControlador(); //se crea nueva instancia de usuario

	//valdacion para ver si se recibieron datos de ingreso
    if (isset($_POST['acceder'])) {
		$datos = array(
            'pregunta'=> $_POST['preguntas'],
            'respuesta'=> $_POST['respuesta'],
        );
        $respuesta = $usuario->verificaPregunta($datos); //se envian los datos a la funcion accesoUsuario de modelo Login
    }
	?>

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
		      	<center><img src="<?php echo SERVERURL; ?>images/CityCoffe.jpeg" id="imagen-cafe" alt="logo-empresa"></center>
				<h3 class="text-center mb-0" id="h3-login">Recuperación por Preguntas de Seguridad</h3>
				<br>
		      	<p class="text-center">Ingrese el correo electrónico registrado en su usuario</p>
				  <?php
				 if(isset($_SESSION['fallo_login'])){
							echo '<div div class="alert alert-danger" role="alert">El usuario ingresado no existe en el sistema</div>';
				 	}
			 		?>
					<br>
				<form action="#" class="login-form">
				<select class="form-select form-select-lg justify-content-center align-items-center mb-3 px-5" aria-label=".form-select-sm example justify-content-center" name="preguntas" id="preguntas">
				    <option selected>Seleccione una pregunta</option>
				    <option value="Cual es su deporte favorito?">¿Cual es su deporte favorito</option>
					<option value="Nombre de su mascota">¿Nombre de su mascota?</option>
					<option value="Lugar de nacimiento">¿Lugar de nacimiento?</option>
					<option value="Comida favorita">¿Comida favorita?</option>
                 </select>
	
				<div class="form-group">
				<br>
		      			<div class="icon d-flex align-items-center justify-content-center"></span></div>
		      			<input type="text" class="form-control" name="respuesta" id="usuario" placeholder="Respuesta" 
						required pattern="[A-Za-z0-9ñÑ!#$%&/=?¡*.-_@\~^]+" title="Ingrese solo letras y números sin espacios" />
		      		</div>
					  <br>
				<div class="form-group">
	            	<button type="submit" id="btn-enviar" class="btn form-control btn-primary rounded submit px-3"
					data-bs-toggle="modal" name="acceder" data-bs-target="#exampleModal">Enviar</button>
	            </div>
				</div>
			</div>
		 </form>
		</div>
	</section> -->