<?php
	include("../cone.php");

	$query="SELECT * FROM TBL_insumos";
	$resultado=mysqli_query($conexion,$query);

	$json=array();

	while($fila=mysqli_fetch_array($resultado)){
		$json[]=array(
			'idInsumo'=>$fila['id_insumos'],
			'nomInsumo'=>$fila['nom_insumo'],
		);
	}

	$hola= json_encode($json);
    echo $hola;
