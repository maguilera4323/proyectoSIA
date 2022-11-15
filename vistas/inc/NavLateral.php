<section class="full-box nav-lateral">
	<div class="full-box nav-lateral-bg show-nav-lateral"></div>
	<div class="full-box nav-lateral-content">
		<figure class="full-box nav-lateral-avatar">
			<i class="far fa-times-circle show-nav-lateral"></i>
			<img src="<?php echo SERVERURL; ?>vistas/assets/avatar/Avatar.png" class="img-fluid" alt="Avatar">
			<figcaption class="roboto-medium text-center">
				<?php echo $_SESSION['usuario_login']?>
				<br><small class="roboto-condensed-light"><?php echo $_SESSION['nombre_usuario']?> </small>
				<br><small class="roboto-condensed-light"><?php echo $_SESSION['rol']?> </small>
			</figcaption>
		</figure>
		<div class="full-box nav-lateral-bar"></div>

		<nav class="full-box nav-lateral-menu">
			<ul>
			<!-- Condicionales para mostrar vistas en navlateral -->
			<!-- Para usuario Administrador -->
			<?php 
			if($_SESSION['rol']=='ADMIN SISTEMA'){
				?>
				<li>
					<a href="<?php echo SERVERURL; ?>home/"><i class="fab fa-dashcube fa-fw"></i> &nbsp; Inicio</a>
				</li>
				<li>
					<a href="#" class="nav-btn-submenu"><i class="fas fa-users fa-fw"></i> &nbsp; Proveedores <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
							<a href="<?php echo SERVERURL; ?>proveedor-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; Agregar Proveedor</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>proveedor-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Proveedores</a>
						</li>
						
					</ul>
				</li>

				<li>
					<a href="#" class="nav-btn-submenu"><i class="fas fa-shopping-cart"></i></i> &nbsp; Compras <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
							<a href="<?php echo SERVERURL; ?>compra-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; Agregar Compras</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>compra-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Compras</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#" class="nav-btn-submenu"><i class="fas fa-pallet fa-fw"></i> &nbsp; Insumos <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
							<a href="<?php echo SERVERURL; ?>insumos-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Insumos</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>inventario-list/"><i class="fas fa-warehouse"></i> &nbsp; Inventario Disponible</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>insumos-list/"><i class="fas fa-dolly-flatbed"></i> &nbsp; Movimientos de Inventario</a>
						</li>
					</ul>
				</li>

				<li>
					<a href="#" class="nav-btn-submenu"><i class="fas fa-file-invoice-dollar fa-fw"></i> &nbsp; Producto <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
							<a href="<?php echo SERVERURL; ?>producto-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; Nuevo Producto</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>producto-list/"><i class="fas fa-hand-holding-usd fa-fw"></i> &nbsp; Lista de Productos</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>Tipo-Producto-new/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Tipo de Producto</a>
						</li>
					</ul>
				</li>

				<li>
					<a href="#" class="nav-btn-submenu"><i class="fas  fa-user-secret fa-fw"></i> &nbsp; Mantenimiento <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
							<a href="<?php echo SERVERURL; ?>user-list/"><i class="fas fa-users-cog"></i> &nbsp; Usuarios</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>objetos-list/"><i class="fas fa-list-alt"></i> &nbsp; Objetos</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>rol-list/"><i class="fas fa-user-tie"></i> &nbsp; Roles</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>permisos-list/"><i class="fas fa-id-card-alt"></i> &nbsp; Permisos</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>parametros-list/"><i class="fas fa-tools"></i></i> &nbsp; Parametros</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>preguntas-list/"><i class="fas fa-question-circle"></i> &nbsp; Preguntas</a>
						</li>
						permisos-list
					</ul>
				</li>

				<li>
					<a href="<?php echo SERVERURL; ?>facturacion/"><i class="fas fa-store-alt fa-fw"></i> &nbsp; Facturacion</a>
				</li>

				<li>
					<a href="<?php echo SERVERURL; ?>bitacora/"><i class="fas fa-book-reader"></i> &nbsp; Bitacora</a>
				</li>
				<li>
					<a href="<?php echo SERVERURL; ?>respaldo/"><i class="fab fa-hackerrank"></i></i> &nbsp; Respaldo</a>
				</li>
				<?php
				}?>
				<!--fin Condicional -->

			<!-- Para usuario Administrador de Inventario -->
			<?php 
			if($_SESSION['rol']=='ADMIN INVENTARIO'){
				?>
				<li>
					<a href="<?php echo SERVERURL; ?>home/"><i class="fab fa-dashcube fa-fw"></i> &nbsp; Inicio</a>
				</li>
				<li>
					<a href="#" class="nav-btn-submenu"><i class="fas fa-users fa-fw"></i> &nbsp; Proveedores <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
							<a href="<?php echo SERVERURL; ?>proveedor-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; Agregar Proveedor</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>proveedor-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Proveedores</a>
						</li>
						
					</ul>
				</li>

				<li>
					<a href="#" class="nav-btn-submenu"><i class="fas fa-shopping-cart"></i></i> &nbsp; Compras <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
							<a href="<?php echo SERVERURL; ?>compra-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; Agregar Compras</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>compra-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Compras</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#" class="nav-btn-submenu"><i class="fas fa-pallet fa-fw"></i> &nbsp; Insumos <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
							<a href="<?php echo SERVERURL; ?>insumos-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Insumos</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>inventario-list/"><i class="fas fa-warehouse"></i> &nbsp; Inventario Disponible</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>insumos-list/"><i class="fas fa-dolly-flatbed"></i> &nbsp; Movimientos de Inventario</a>
						</li>
					</ul>
				</li>
				<?php
				}?>
				<!--fin Condicional -->

				<!-- Para usuario Vendedor -->
			<?php 
			if($_SESSION['rol']=='Vendedor'){
				?>
				<li>
					<a href="<?php echo SERVERURL; ?>home/"><i class="fab fa-dashcube fa-fw"></i> &nbsp; Inicio</a>
				</li>

				<li>
					<a href="#" class="nav-btn-submenu"><i class="fas fa-file-invoice-dollar fa-fw"></i> &nbsp; Producto <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
							<a href="<?php echo SERVERURL; ?>producto-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; Nuevo Producto</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>reservation-reservation/"><i class="far fa-calendar-alt fa-fw"></i> &nbsp; Reservaciones</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>reservation-pending/"><i class="fas fa-hand-holding-usd fa-fw"></i> &nbsp; Productos</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>producto-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Productos</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>reservation-search/"><i class="fas fa-search-dollar fa-fw"></i> &nbsp; Buscar por fecha</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="<?php echo SERVERURL; ?>facturacion/"><i class="fas fa-store-alt fa-fw"></i> &nbsp; Facturacion</a>
				</li>

				<?php
				}?>
				<!--fin Condicional -->
			</ul>
		</nav>
	</div>
</section>