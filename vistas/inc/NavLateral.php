<?php
include ("./cone.php"); 
	$rol=$_SESSION['id_rol'];
	//query para extraer los tipos de objeto con los que cuenta el sistema actualmente
	$sql="SELECT tipo_objeto FROM TBL_permisos 
	where id_rol='$rol'";
	$dato = mysqli_query($conexion, $sql); 

		if($dato -> num_rows >0){
			while($fila=mysqli_fetch_array($dato)){
				//se valida que el tipo de objeto concuerde con un valor en especifico
				//para darle valor a la variable que servirá de comprobacion
				if($fila['tipo_objeto']=='Proveedores'){
					$proveedores='true';
				}

				if($fila['tipo_objeto']=='Insumos'){
					$insumos='true';
				}

				if($fila['tipo_objeto']=='Productos'){
					$productos='true';
				}

				if($fila['tipo_objeto']=='Compras'){
					$compras='true';
				}

				if($fila['tipo_objeto']=='Mantenimiento'){
					$mantenimiento='true';
				}

				if($fila['tipo_objeto']=='Administracion'){
					$administracion='true';
				}

				if($fila['tipo_objeto']=='Facturacion'){
					$facturacion='true';
				}
			}
		} 

	?>

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
				<li>
					<a href="<?php echo SERVERURL; ?>home/"><i class="fab fa-dashcube fa-fw"></i> &nbsp; Inicio</a>
				</li>
				<!--Comienzan las condicionales para extraer los botones del menú según los permisos del rol del usuario -->
				<!--Estas validaciones traen uno o varios menús de acuerdo a los módulos a los que tenga acceso el usuario -->
				<?php
					if(isset($facturacion)=='true'){
				?>
				<li>
					<a href="#" class="nav-btn-submenu"><i class="fas fa-walking"></i> &nbsp; Clientes <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
							<a href="<?php echo SERVERURL; ?>cliente-new/"><i class="fas fa-plus fa-fw"></i> &nbsp; Agregar Cliente</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>cliente-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Clientes</a>
						</li>
						
					</ul>
				</li>
				<?php
					}
				?>
				<?php
					if(isset($proveedores)=='true'){
				?>
				<li>
					<a href="#" class="nav-btn-submenu"><i class="fas fa-users fa-fw"></i> &nbsp; Proveedores <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
							<a href="<?php echo SERVERURL; ?>proveedor-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Proveedores</a>
						</li>
						
					</ul>
				</li>
				<?php
					}
				?>

				<?php
					if(isset($compras)=='true'){
				?>
				<li>
					<a href="#" class="nav-btn-submenu"><i class="fas fa-shopping-cart"></i></i> &nbsp; Compras <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
							<a href="<?php echo SERVERURL; ?>compra-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Compras</a>
						</li>
					</ul>
				</li>
				<?php
					}
				?>

				<?php
					if(isset($insumos)=='true'){
				?>
				<li>
					<a href="#" class="nav-btn-submenu"><i class="fas fa-pallet fa-fw"></i> &nbsp;Inventario e Insumos <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
							<a href="<?php echo SERVERURL; ?>insumos-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Insumos</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>inventario-list/"><i class="fas fa-warehouse"></i> &nbsp; Inventario Disponible</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>movimiento-inventario/"><i class="fas fa-dolly-flatbed"></i> &nbsp; Movimientos de Inventario</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>recetario-list/"><i class="fas fa-hand-holding-usd fa-fw"></i> &nbsp; Recetario</a>
						</li>
					</ul>
				</li>
				<?php
					}
				?>

				<?php
					if(isset($productos)=='true'){
				?>
				<li>
					<a href="#" class="nav-btn-submenu"><i class="fas fa-mug-hot fa-fw"></i> &nbsp; Producto <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
							<a href="<?php echo SERVERURL; ?>producto-list/"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; Lista de Productos</a>
						</li>
						<li>
							<a href="<?php echo SERVERURL; ?>tipo-producto-new/"><i class="fas fa-wine-glass fa-fw"></i> &nbsp; Tipo de Producto</a>
						</li>
					</ul>
				</li>
				<?php
					}
				?>

				<?php
					if(isset($mantenimiento)=='true'){
				?>
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
					
					</ul>
				</li>
				<?php
					}
				?>

				<?php
					if(isset($facturacion)=='true'){
				?>
				<li>
				<a href="#" class="nav-btn-submenu"><i class="fas  fa-file-alt fa-fw"></i> &nbsp; Facturacion <i class="fas fa-chevron-down"></i></a>
					<ul>
						<li>
                        <a href="<?php echo SERVERURL; ?>facturacion/"><i class="fas fa-file"></i> &nbsp; Nueva Factura </a>
						</li>
						<li>
						<a href="<?php echo SERVERURL; ?>facturacion-list/"><i class="fas fa-archive"></i> &nbsp; Lista de Facturas</a>
						</li>
					</ul>
				</li>
				<?php
					}
				?>

				<?php
					if($administracion=='true'){
				?>
				<li>
					<a href="<?php echo SERVERURL; ?>bitacora/"><i class="fas fa-book-reader"></i> &nbsp; Bitacora</a>
				</li>
				<li>
					<a href="<?php echo SERVERURL; ?>respaldo/"><i class="fab fa-hackerrank"></i></i> &nbsp; Respaldo</a>
				</li>
				<?php
					}
				?>
			</ul>
		</nav>
	</div>
</section>