<?php
	date_default_timezone_set('America/Tegucigalpa');
	header("Content-Type: application/xls");    
	header("Content-Disposition: attachment; filename=Informe_Insumos_" . date('Y:m:d H:i:s').".xls");
	header("Pragma: no-cache"); 
	header("Expires: 0");

	include ("../cone.php");  
	
	$output = "";
	
	
		$output .="
            <h3>Informe de Insumos</h3>
            <br>
			<table border='1'>
				<thead>
				<tr style='background-color:#22C6F7;'>
						<th>Nombre</th>
						<th>Categoria</th>
						<th>Cantidad Maxima</th>
						<th>Cantidad Minima</th>
                        <th>Unidad de medida</th>
					</tr>
				<tbody>
		";
		
		$tipo="SELECT i.nom_insumo, c.nom_categoria, i.cant_max, i.cant_min,i.unidad_medida
		FROM TBL_insumos i 
	   inner JOIN TBL_categoria_produ c ON c.id_categoria = i.id_categoria";
		$resultado=mysqli_query($conexion, $tipo);
		if($resultado -> num_rows >0){
            while($fila=mysqli_fetch_array($resultado)){
			
		$output .= "
					<tr>
						<td align='center'>".$fila['nom_insumo']."</td>
						<td align='center'>".$fila['nom_categoria']."</td>
						<td align='center'>".$fila['cant_max']."</td>
						<td align='center'>".$fila['cant_min']."</td>
                        <td align='center'>".$fila['unidad_medida']."</td>
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