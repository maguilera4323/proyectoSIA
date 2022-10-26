<?php
	//llamado al controlador de login
    require_once 'controladores/emailControlador.php';
    $enviarCodigo = new Correo(); //se crea nueva instancia de usuario

	//valdacion para ver si se recibieron datos de ingreso
    if (isset($_POST['acceder'])) {
		$codigo =  $_POST['codigo'];
        $respuesta = $enviarCodigo->verificaCodigoToken($codigo); //se envian los datos a la funcion accesoUsuario de modelo Login
    }
	?>

<div class="login-container">
		<div class="login-content">
		<center><img src="<?php echo SERVERURL; ?>images/CityCoffe.jpeg" id="imagen-cafe" alt="logo-empresa"></center>
		<h4 class="text-center mb-0" id="h3-login">Verificación de Código de Seguridad</h4>
		<p class="text-center" id="p-login">Ingrese el código de seguridad enviado a su correo</p>
		<?php
				if(isset($_SESSION['respuesta'])){
					switch($_SESSION['respuesta']){
						case 'codigo valido':
							header("refresh:2;url=".SERVERURL."cambiocontrasena/");
							echo '<div class="alert alert-success text-center">Código correcto. Será redireccionado en unos segundos...</div>';
						break;
						case 'codigo invalido':
							echo '<div class="alert alert-danger text-center">El código ingresado es incorrecto.</div>';
						break;
						case 'token vencido':
							echo '<div class="alert alert-danger text-center">El código ya está vencido. Realice el proceso nuevamente.</div>';
						break;
					 	}
				 	}
			 		?>
			<form action="" method="POST" autocomplete="off" id="loginForm">
				<div class="form-group">
				<i class="fas fa-lock icon-user"></i>
					<input type="text" class="form-control" id="usuario" name="codigo" placeholder="Ingrese código" style="text-align:center; font-size:20px;" required />
				</div>
				<button type="submit" id="btn-enviar" value="Por preguntas de seguridad" name="acceder" class="btn-login text-center">Enviar</button>
			</form>
		</div>
	</div>