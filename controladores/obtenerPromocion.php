<?php
	include("../cone.php");

	$query="SELECT * FROM TBL_promociones";
	$resultado=mysqli_query($conexion,$query);

	$json=array();

	while($fila=mysqli_fetch_array($resultado)){
		$json[]=array(
			'idPromocion'=>$fila['id_promociones'],
			'nomPromocion'=>$fila['nom_promocion'],
			'precioPromocion'=>$fila['precio_promocion'],
		);
	}

	$hola= json_encode($json);
    echo $hola;
