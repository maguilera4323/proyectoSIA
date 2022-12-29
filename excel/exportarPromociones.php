<?php
	date_default_timezone_set('America/Tegucigalpa');
	header("Content-Type: application/xls");    
	header("Content-Disposition: attachment; filename=Informe_Promociones_" . date('Y:m:d H:i:s').".xls");
	header("Pragma: no-cache"); 
	header("Expires: 0");

	include ("../cone.php");  
	
	$output = "";
	
	
		$output .="
            <h3>Informe de Promociones</h3>
            <br>
			<table border='1'>
				<thead>
				<tr style='background-color:#22C6F7;'>
						<th>Nombre</th>
						<th>Fecha de Inicio</th>
						<th>Fecha Final</th>
						<th>Estado</th>
						<th>Precio</th>
					</tr>
				<tbody>
		";
		
		$tipo="SELECT p.nom_promocion, p.fech_ini_promo, p.fech_fin_promo,
		e.nom_estado_promociones, p.precio_promocion FROM TBL_promociones p
		inner join TBL_estado_promociones e on p.id_estado_promocio=e.id_estado_promociones";
		$resultado=mysqli_query($conexion, $tipo);
		if($resultado -> num_rows >0){
            while($fila=mysqli_fetch_array($resultado)){
			
		$output .= "
					<tr>
						<td>".$fila['nom_promocion']."</td>
						<td>".$fila['fech_ini_promo']."</td>
						<td>".$fila['fech_fin_promo']."</td>
						<td>".$fila['nom_estado_promociones']."</td>
						<td>".$fila['precio_promocion']."</td>
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