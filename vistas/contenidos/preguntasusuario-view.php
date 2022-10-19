<div class="login-container">
    <div class="login-content">
        <center><img src="<?php echo SERVERURL; ?>images/CityCoffe.jpeg" id="imagen-cafe" alt="logo-empresa"></center>
		<h4 class="text-center mb-0" id="h3-login">Bienvenido</h4>
        <h5 class="text-center mb-0" id="h3-login">Preguntas de Seguridad</h5>
		<p class="text-center" id="p-login">Conteste las preguntas para completar el registro</p>

        <form action="" method="POST" autocomplete="off" id="loginForm">

            <div class="form-group">
                <i class="fas fa-user icon-user"> ¿Cuál es su Deporte Favorito?</i>
					<input type="text" class="form-control" id="usuario" name="usuario" placeholder="Respuesta" 
					onkeyup="validarUsuario()" required />
					<div id="message_usuario" style="position: absolute; left: 20px; top: 60px; background-color: #EFEFEF; 
					color:black; font-weight: 500; z-index:5; padding:8px;  border: 2px solid #FF4C12;" hidden>
      				Llene este campo</div>
				<br>
                <br>
                <i class="fas fa-dog icon-user"> ¿Nombre de su Mascota?</i>
					<input type="text" class="form-control" id="usuario" name="usuario" placeholder="Respuesta" 
					onkeyup="validarUsuario()" required />
					<div id="message_usuario" style="position: absolute; left: 20px; top: 60px; background-color: #EFEFEF; 
					color:black; font-weight: 500; z-index:5; padding:8px;  border: 2px solid #FF4C12;" hidden>
      				Llene este campo</div>
				<br>
                <br>
                <i class="fas fa-globe-americas icon-user"> Lugar de Nacimiento</i>
					<input type="text" class="form-control" id="usuario" name="usuario" placeholder="Respuesta" 
					onkeyup="validarUsuario()" required />
					<div id="message_usuario" style="position: absolute; left: 20px; top: 60px; background-color: #EFEFEF; 
					color:black; font-weight: 500; z-index:5; padding:8px;  border: 2px solid #FF4C12;" hidden>
      				Llene este campo</div>
            </div>

        </form>
    </div>
</div>