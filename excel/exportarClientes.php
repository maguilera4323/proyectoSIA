<?php
	date_default_timezone_set('America/Tegucigalpa');
	header("Content-Type: application/xls");    
	header("Content-Disposition: attachment; filename=Informe_Clientes_" . date('Y:m:d H:i:s').".xls");
	header("Pragma: no-cache"); 
	header("Expires: 0");

	include ("../cone.php");  
	
	$output = "";
	
	
		$output .="
            <h3>Informe de Clientes</h3>
            <br>
			<table border='1'>
				<thead>
				<tr style='background-color:#22C6F7;'>
						<th>Nombre</th>
						<th>RTN</th>
						<th>DNI</th>
                        <th>Telefono</th>
					</tr>
				<tbody>
		";
		
		$tipo="SELECT * FROM TBL_Clientes";
		$resultado=mysqli_query($conexion, $tipo);
		if($resultado -> num_rows >0){
            while($fila=mysqli_fetch_array($resultado)){
			
		$output .= "
					<tr>
						<td>".$fila['nom_cliente']."</td>
						<td>".$fila['rtn_cliente']."</td>
						<td>".$fila['dni_cliente']."</td>
						<td>".$fila['tel_cliente']."</td>
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