<?php
	date_default_timezone_set('America/Tegucigalpa');
	header("Content-Type: application/xls");    
	header("Content-Disposition: attachment; filename=Informe_Productos_" . date('Y:m:d H:i:s').".xls");
	header("Pragma: no-cache"); 
	header("Expires: 0");

	include ("../cone.php");  
	
	$output = "";
	
	
		$output .="
            <h3>Informe de Productos</h3>
            <br>
			<table border='1'>
				<thead>
				<tr style='background-color:#22C6F7;'>
						<th>Nombre</th>
						<th>Tipo de Producto</th>
						<th>Descripcion</th>
                        <th>Precio</th>
					</tr>
				<tbody>
		";
		
		$tipo="SELECT p.nom_producto, p.des_produ, p.precio_produ, tp.tipo_producto FROM TBL_producto p
		inner join TBL_tipo_producto tp on tp.id_tipo_produ=p.id_tipo_produ";
		$resultado=mysqli_query($conexion, $tipo);
		if($resultado -> num_rows >0){
            while($fila=mysqli_fetch_array($resultado)){
			
		$output .= "
					<tr>
						<td>".$fila['nom_producto']."</td>
						<td>".$fila['tipo_producto']."</td>
						<td>".$fila['des_produ']."</td>
						<td>".$fila['precio_produ']."</td>
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