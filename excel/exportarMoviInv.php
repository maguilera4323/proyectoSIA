<?php
	date_default_timezone_set('America/Tegucigalpa');
	header("Content-Type: application/xls");    
	header("Content-Disposition: attachment; filename=Informe_Movimientos_Inventario_" . date('Y:m:d H:i:s').".xls");
	header('content-type: text/html; charset=utf-8');
	header("Pragma: no-cache"); 
	header("Expires: 0");

	include ("../cone.php");  
	
	$output = "";
	
	
		$output .="
            <h3>Informe de Movimientos de Inventario</h3>
            <br>
			<table border='1'>
				<thead>
				<tr style='background-color:#22C6F7;'>
						<th >ID</th>
						<th>Nombre    </th>
						<th align='center'>Cantidad     </th>
						<th>Tipo    </th>
                        <th>Fecha   </th>
                        <th align='center'>Usuario     </th>
						<th>Comentario</th>
					</tr>
				<tbody>
		";
		
		$sqlmovi_inventario = ("SELECT i.id_insumos,i.nom_insumo, m.cant_movimiento,m.tipo_movimiento,m.fecha_movimiento,
        u.usuario,m.comentario FROM TBL_movi_inventario m
        inner join TBL_insumos i on i.id_insumos=m.id_insumos
        inner join TBL_usuarios u on u.id_usuario=m.id_usuario
		order by m.fecha_movimiento desc");
        

        $query = mysqli_query($conexion, $sqlmovi_inventario);
		if($query -> num_rows >0){
            while($fila=mysqli_fetch_array($query)){
			
		$output .= "
					<tr>
						<td align='center'>".$fila['id_insumos']."</td>
						<td align='center'>".$fila['nom_insumo']."</td>
						<td align='center'>".$fila['cant_movimiento']."</td>
						<td align='center'>".$fila['tipo_movimiento']."</td>
						<td align='center'>".$fila['fecha_movimiento']."</td>
                        <td align='center'>".$fila['usuario']."</td>
                        <td align='center'>".$fila['comentario']."</td>
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