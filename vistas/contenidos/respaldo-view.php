<?php
	require_once "./pruebabitacora.php";
		include ("./cone.php");     

		//verificación de permisos
		//se revisa si el usuario tiene acceso a una vista específica por medio del rol que tiene y el objeto al que quiere acceder
		$id_rol=$_SESSION['id_rol'];
			$SQL="SELECT * FROM TBL_permisos where id_rol='$id_rol' and id_objeto=14";
			$dato = mysqli_query($conexion, $SQL);

			if($dato -> num_rows >0){
				while($fila=mysqli_fetch_array($dato)){
					$permiso_con=$fila['permiso_consulta'];
				}
			}

			//valida si el query anterior no retornó ningún valor
			//en este caso no había un permiso registrado del objeto para el rol del usuario conectado
			if(!isset($permiso_con)){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene acceso autorizado a esta vista</div>';
				echo "<script> window.location.href='".SERVERURL."home/'; </script>";	
			//valida si el permiso tiene valor de cero, lo que significa que no puede acceder a la vista	
			}else if($permiso_con==0){
				echo '<div class="alert alert-warning text-center" style="font-size: 28px;">Usted no tiene acceso autorizado a esta vista</div>';
				echo "<script> window.location.href='".SERVERURL."home/'; </script>";
			}else{
				$datos_bitacora = 
				[
					"id_objeto" => 14,
					"fecha" => date('Y-m-d H:i:s'),
					"id_usuario" => $_SESSION['id_login'],//cambiar aqui para que me pueda traer el USU conectado
					"accion" => "Cambio de vista",
					"descripcion" => "El usuario ".$_SESSION['usuario_login']." entró a la Vista de Respaldo"
				];
				Bitacora::guardar_bitacora($datos_bitacora);
			}
?>

<p>=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=</p>
<br>
<br>
<br>
<center>
<h1>Haga Click Para Realizar Backups</h1>
<a href="<?php echo SERVERURL; ?>rsp/">
<div class="tile-icon">
<i class="fab fa-hackerrank"></i>                
</div>
</a>
</center>

<p>=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=</p>
<center>
<form action="<?php echo SERVERURL; ?>restaurar/" method="POST">
		<h2 for="archivo" class="bmd-label-floating">Agregar Backup</h2>
		<input type="file" class="form-control" name="restorePoint" id="rest" accept="">
		<br>
		<button type="submit" >Restaurar</button>
	</form> 
</center>





<!-- <center>
<style>
   </style> 
</head>
<body>
	<h1>Backup / Exportar Base de Datos</h1>
   <div>
     <p>Haga clic en el botón para descargar el archivo de copia de seguridad de la base de datos</p>
     
	 <a href="<?php echo SERVERURL; ?>restaurar/">
	<div class="tile-icon">
	<i class="fab fa-hackerrank"></i>                
	</div>
	</a>
	
   </div>
</body>
</center> -->
<p>=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=/=</p>