<nav class="full-box navbar-info">
	<a href="#" class="float-left show-nav-lateral">
		<i class="fas fa-exchange-alt"></i>
	</a>
	<a href="<?php echo SERVERURL; ?>perfilusuario/<?php echo$_SESSION['id_login']; ?>"> <button type="button" 
	class="btn btn-primary"><i class="fas fa-user-cog">Perfil</i></button>
	</a>

	<!-- <a href="#" class="btn-exit-system">
		<i class="fas fa-power-off"></i>
	</a> -->
	<a href="<?php echo SERVERURL?>salir/"><button type="button" 
	class="btn btn-primary">Salir</button></a>

</nav>