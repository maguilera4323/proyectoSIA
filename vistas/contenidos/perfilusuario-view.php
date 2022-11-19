<?include ("./cone.php");
		if (session_status() == PHP_SESSION_NONE) {
			session_start();
		} 
?>

<div class="full-box page-header">
	<h3 class="text-left">
  <i class="fas fa-user-secret"></i> &nbsp; PERFIL DE USUARIO
	</h3>

</div>

<div class="container-fluid">

<!-- //codigo php para extraer el id del usuario a editar de la url -->
      <p><?php 
				require_once "./controladores/usuarioControlador.php";
				$ins_usuario=new UsuarioControlador();
					$host= $_SERVER["HTTP_HOST"];
					$url= $_SERVER["REQUEST_URI"];
					$url_completa="http://" . $host . $url; //variable con la url del sitio completa
					$id_editar = explode('/',$url_completa)[5]; 

					//instancia para obtener los datos ya guardados en la tabla de usuarios
					//para realizar los cambios de un registro
					$datos_usuario=$ins_usuario->datosUsuarioControlador("unico",$id_editar);

					if($datos_usuario->rowCount()==1){
						$campos=$datos_usuario->fetch();
					}
				?></p>

<!-- Vista del Perfil de Usuario -->
	<form class="form-neon FormularioAjax" action="<?php echo SERVERURL; ?>ajax/usuarioAjax.php" method="POST" data-form="save" autocomplete="off">
		<fieldset>
			<legend><i class="far fa-address-card"></i> &nbsp; Información personal</legend>
			
			<div class="container">
				<div class="row">
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="nom_usuario" class="bmd-label-floating">Usuario</label>
							<br>
							<input type="text" class="form-control" name="usuario_edit" id="nom_usuario" maxlength="15" 
							style="text-transform:uppercase;" value="<?php echo $campos['usuario']?>" disabled >
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="form-group">
							<label for="nombre_usuario" class="bmd-label-floating">Nombre</label>
							<br>
							<input type="text" class="form-control" name="nombre_usuario_edit" style="text-transform:uppercase;" 
							id="nombre_usuario" maxlength="20" value="<?php echo $campos['nombre_usuario']?>" disabled>
						</div>
					</div>
          <div class="col-12 col-md-4">
						<div class="form-group">
							<br>
							<label for="nombre_usuario" class="bmd-label-floating">Correo Electronico</label>
							<input type="text" class="form-control" name="correo_usuario_edit" style="text-transform:uppercase;" 
							id="nombre_usuario" maxlength="20" value="<?php echo $campos['correo_electronico']?>" disabled>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
  </form> 


<!-- botón para el modal de editar el perfil usuario -->
<button type="button" class="btn btn-info_edit" data-toggle="modal" data-target="#modalperfil<?php echo $id_editar;?>">EDITAR PERFIL</button>

    <!-- modal PERFIL USUARIO -->

    <div class="modal fade" id="modalperfil<?php echo $id_editar;?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  

	
	<div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLabel">EDITAR PERFIL DEL USUARIO</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="Usuario" class="col-form-label">Usuario:</label>
            <input type="text" value="<?php echo $campos['usuario']?>" class="form-control" id="usuarioo" name="usuario">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Nombre Usuario:</label>
            <input type="text" value="<?php echo $campos['nombre_usuario']?>" class="form-control" id="nameusuario" name="nombreusuario">
          </div>
		  <div class="form-group">
            <label for="message-text" class="col-form-label">E-mail:</label>
            <input type="text" value="<?php echo $campos['correo_electronico']?>" class="form-control" id="usuariocorreo" name="correousuario">
          </div>
		  <h>CAMBIO DE CONTRASEÑA</h6>
		  <div class="form-group">
            <label for="Usuario" class="col-form-label">Contraseña Actual:</label>
            <input type="password" value="" class="form-control" id="actualcontraseña" name="contraseña_actual"><?php if(isset($existe)) {echo $existe;} ?>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Nueva Contraseña:</label>
            <input type="password" value="" style="color:red" class="form-control" id="nuevacontraseña" name="contraseña_nueva">
          </div>
		  <div class="form-group">
            <label for="message-text" class="col-form-label">Confirmar Contraseña:</label>
            <input type="password" value="" class="form-control" id="confirmarcontraseña" name="contraseña_confirmar">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-success"> Guardar</button>
      </div>
    </div>
  </div>
</div>


