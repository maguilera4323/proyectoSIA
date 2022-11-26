<?php
	include("../cone.php");
	
	$valor=$_POST['valor'];
    $json=array();

    $query="SELECT * FROM TBL_producto where id_producto='$valor'";
	$resultado=mysqli_query($conexion,$query);

	while($fila=mysqli_fetch_array($resultado)){
		$json[]=array(
			'precio'=>$fila['precio_produ'],
		);
	}

	$hola= json_encode($json);
    echo $hola;

?>
