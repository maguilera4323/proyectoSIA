<?php
	include("../cone.php");

	$query="SELECT * FROM TBL_producto";
	$resultado=mysqli_query($conexion,$query);

	$json=array();

	while($fila=mysqli_fetch_array($resultado)){
		$json[]=array(
			'idProducto'=>$fila['id_producto'],
			'nomProducto'=>$fila['nom_producto'],
		);
	}

	$hola= json_encode($json);
    echo $hola;
