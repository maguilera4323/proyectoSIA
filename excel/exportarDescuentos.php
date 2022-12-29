<?php
	date_default_timezone_set('America/Tegucigalpa');
	header("Content-Type: application/xls");    
	header("Content-Disposition: attachment; filename=Informe_Descuentos_" . date('Y:m:d H:i:s').".xls");
	header("Pragma: no-cache"); 
	header("Expires: 0");

	include ("../cone.php");  
	
	$output = "";
	
	
		$output .="
            <h3>Informe de Descuentos</h3>
            <br>
			<table border='1'>
				<thead>
				<tr style='background-color:#22C6F7;'>
						<th>Nombre</th>
						<th>Porcentaje</th>
					</tr>
				<tbody>
		";
		
		$tipo="SELECT * FROM TBL_descuentos";
		$resultado=mysqli_query($conexion, $tipo);
		if($resultado -> num_rows >0){
            while($fila=mysqli_fetch_array($resultado)){
			
		$output .= "
					<tr>
						<td>".$fila['nom_descuento']."</td>
						<td>".($fila['porcentaje_descuento']*100)." %</td>
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