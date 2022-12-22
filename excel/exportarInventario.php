<?php
	date_default_timezone_set('America/Tegucigalpa');
	header("Content-Type: application/xls");    
	header("Content-Disposition: attachment; filename=Informe_Inventario_" . date('Y:m:d H:i:s').".xls");
	header('content-type: text/html; charset=utf-8');
	header("Pragma: no-cache"); 
	header("Expires: 0");

	include ("../cone.php");  
	
	$output = "";
	
	
		$output .="
            <h3>Informe de Inventario</h3>
            <br>
			<table border='1'>
				<thead>
				<tr style='background-color:#22C6F7;'>
						<th>Nombre    </th>
						<th>Cantidad    </th>
					</tr>
				<tbody>
		";
		
		$sql_inventario = ("SELECT iv.id_insumo,i.nom_insumo, iv.cant_existencia FROM TBL_inventario iv
        inner join TBL_insumos i on i.id_insumos=iv.id_insumo");
        

        $query = mysqli_query($conexion, $sql_inventario);
		if($query -> num_rows >0){
            while($fila=mysqli_fetch_array($query)){
			
		$output .= "
					<tr>
						<td align='center'>".$fila['nom_insumo']."</td>
						<td align='center'>".$fila['cant_existencia']."</td>
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