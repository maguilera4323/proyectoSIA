<?php
if (session_status() == PHP_SESSION_NONE) {
	session_start();
}
	require_once "./pruebabitacora.php";

	$datos_bitacora = [
		"id_objeto" => 0,
		"fecha" => date('Y-m-d H:i:s'),
		"id_usuario" => $_SESSION['id_login'],
		"accion" => "Cambio de vista",
		"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la vista de Creación de Usuarios"
	];
	Bitacora::guardar_bitacora($datos_bitacora); 
?>


<div class="full-box page-header">
	<h3 class="text-left">
		<i class="fas fa-plus fa-fw"></i> &nbsp; NUEVO USUARIO
	</h3>

</div>

<div class="container-fluid">
	<ul class="full-box list-unstyled page-nav-tabs">
		<li>
			<a class="active" href="<?php echo SERVERURL; ?>user-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; NUEVO USUARIO</a>
		</li>
		<li>
			<a href="<?php echo SERVERURL; ?>user-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE USUARIOS</a>
		</li>
<!-- 		<li>
			<a href="<?php echo SERVERURL; ?>user-search/"><i class="fas fa-search fa-fw"></i> &nbsp; BUSCAR USUARIO</a>
		</li> -->
	</ul>	
</div>

<div class="container-fluid">
	<form class="form-neon FormularioAjax" action="<?php echo SERVERURL; ?>ajax/usuarioAjax.php" method="POST" data-form="save" autocomplete="off">
		<fieldset>
			<legend><i class="far fa-address-card"></i> &nbsp; Información personal</legend>
			<div class="container-fluid">
				<div class="row">

			</div>
		</fieldset>
		<br><br><br>
		<fieldset>

<label for="nombre_usuario" class="bmd-label-floating">Roles</label>
<select class="form-control" name="id_producto" id="" require>
		<option value="" selected="" disabled="">Seleccione una opción</option>
<?php
include ("./cone.php"); 
$s="SELECT usuario FROM TBL_usuarios";
while( $usuario=mysqli_fetch_row()){
?>

	<option value="<?php echo $usuario [0]?>"><?php echo $usuario [1]?></option>

<?php }?>



		

?>
</select>
				</div>
			</div>
		</div>
	</div>
</fieldset>
<p class="text-center" style="margin-top: 40px;">
	<button type="reset" class="btn btn-raised btn-secondary btn-sm"><i class="fas fa-paint-roller"></i> &nbsp; LIMPIAR</button>
	&nbsp; &nbsp;
	<button type="submit" class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i> &nbsp; GUARDAR</button>
<!--<button type="submit" class="btn btn-raised btn-info btn-sm"><a onclick="location. href='<?php echo SERVERURL; ?>user-list/'"><i class="far fa-save"> GUARDAR</i></button>-->

		</p>
	</form>
</div>