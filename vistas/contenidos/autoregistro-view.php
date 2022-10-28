<?php
if (session_status() == PHP_SESSION_NONE) {
	session_start();
}
?>

<div class="login-container">
		<div class="login-content">
		<center><img src="<?php echo SERVERURL; ?>images/CityCoffe.jpeg" id="imagen-cafe" alt="logo-empresa"></center>
		<h4 class="text-center mb-0" id="h3-login">Bienvenido</h4>
		<p class="text-center" id="p-login">Ingrese sus Datos de Nuevo Registro</p>
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
			<form action="<?php echo SERVERURL; ?>ajax/autoregistroAjax.php" method="POST" autocomplete="off" id="loginForm">
				<div class="form-group">
					<i class="fas fa-user icon-user"> Usuario</i>
					<input type="text" class="form-control" pattern="[A-Z]{5,15}" name="usuario_autoreg" id="nom_usuario" placeholder="Usuario" 
					onkeyup="validarUsuario()" required />
					<div id="message_usuario" style="position: absolute; left: 20px; top: 60px; background-color: #EFEFEF; 
					color:black; font-weight: 500; z-index:5; padding:8px;  border: 2px solid #FF4C12;" hidden>
      				Introduzca solo letras mayúsculas(A-Z).</div>
					<br>
					<br>
					<i class="fas fa-user icon-user"> Nombre del Usuario</i>
					<input type="text" class="form-control" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,20}" name="nameusuario_autoreg" id="nombre_usuario" placeholder="Nombre del Usuario" 
					onkeyup="validarUsuario()" required />
					<div id="message_usuario" style="position: absolute; left: 20px; top: 60px; background-color: #EFEFEF; 
					color:black; font-weight: 500; z-index:5; padding:8px;  border: 2px solid #FF4C12;" hidden></div>
					<br>
					<br>
					<i class="fas fa-envelope icon-user">  Correo Electrónico</i>
					<input type="email" class="form-control" name="correo_electronico_autoreg" id="correo_electronico" placeholder="E-Mail" 
					onkeyup="validarUsuario()" required />
					<div id="message_usuario" style="position: absolute; left: 20px; top: 60px; background-color: #EFEFEF; 
					color:black; font-weight: 500; z-index:5; padding:8px;  border: 2px solid #FF4C12;" hidden></div>
					<br>
					<br>
					<i class="fas fa-eye-slash icon-clave" onclick="mostrarContrasena()"> Contraseña</i>
					<input type="password" class="form-control" name="contrasena_autoreg" id="clave" placeholder="Contraseña" pattern="[a-zA-Z0-9!#%&/()=?¡*+_$@.-]{8,100}"
					onkeyup="validarContrasena()" required />
					<div id="message_contrasena" style="position: absolute; left: 20px; top: 120px; background-color: #EFEFEF; 
					color:black; font-weight: 500; z-index:5; padding:8px; border: 2px solid #FF4C12;" hidden>
      				Introduzca solo letras, números y caracteres especiales(!#$%&/()=?¡*+-_.@).</div>
					<br>
					<br>
					
				</div>
				<div class="form-group">
				</div>
				<button type="submit" class="btn-login text-center"><i class="fas fa-arrow-circle-right icon-user"> Siguiente</i></button>
			</form>
		</div>
	</div>
