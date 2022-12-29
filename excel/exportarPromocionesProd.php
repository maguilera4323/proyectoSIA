<?php
	date_default_timezone_set('America/Tegucigalpa');
	header("Content-Type: application/xls");    
	header("Content-Disposition: attachment; filename=Informe_Promociones_Productos_" . date('Y:m:d H:i:s').".xls");
	header("Pragma: no-cache"); 
	header("Expires: 0");

	include ("../cone.php");  
	
	$output = "";
	
	
		$output .="
            <h3>Informe de Promociones de Productos</h3>
            <br>
			<table border='1'>
				<thead>
				<tr style='background-color:#22C6F7;'>
						<th>Promocion</th>
						<th>Producto</th>
						<th>Cantidad</th>
					</tr>
				<tbody>
		";
		
		$tipo="SELECT prom.nom_promocion, prod.nom_producto, p.cantidad FROM TBL_promociones_productos p
			inner join TBL_promociones prom on p.id_promociones=prom.id_promociones
			inner join TBL_producto prod on p.id_producto=prod.id_producto";
		$resultado=mysqli_query($conexion, $tipo);
		if($resultado -> num_rows >0){
            while($fila=mysqli_fetch_array($resultado)){
			
		$output .= "
					<tr>
						<td>".$fila['nom_promocion']."</td>
						<td>".$fila['nom_producto']."</td>
						<td>".$fila['cantidad']."</td>
					</tr>
		";
		}
    }
		
		$output .="
				</tbody>
				
			</table>
		";
		
		echo $output;
	
	
?>