<?php
	date_default_timezone_set('America/Tegucigalpa');
	header("Content-Type: application/xls");    
	header("Content-Disposition: attachment; filename=Informe_Facturas_" . date('Y:m:d H:i:s').".xls");
	header("Pragma: no-cache"); 
	header("Expires: 0");

	include ("../cone.php");  
	
	$output = "";
	
	
		$output .="
            <h3>Informe de Facturas</h3>
            <br>
			<table border='1'>
				<thead>
				<tr style='background-color:#22C6F7;'>
						<th>Cliente</th>
						<th>DNI</th>
						<th>Num. Factura</th>
                        <th>Fecha de Pedido</th>
						<th>Fecha de Entrega</th>
                        <th>Sitio de Entrega</th>
						<th>Estado</th>
						<th>Subtotal</th>
						<th>ISV</th>
						<th>Total</th>
						<th>Forma de Pago</th>
						<th>Fecha de Facturacion</th>
						<th>Porcentaje de ISV</th>
					</tr>
				<tbody>
		";
		
		$tipo="SELECT p.id_pedido,p.num_factura, p.fech_pedido, p.fech_entrega, p.total,p.fech_facturacion,
					p.nom_cliente,p.dni_cliente, p.ISV, p.porcentaje_isv, p.sitio_entrega, f.forma_pago, p.sub_total,
					e.estado_pedido FROM TBL_pedidos p
				inner join TBL_estado_pedido e on p.id_estado_pedido=e.id_estado_pedido
				inner join TBL_forma_pago f on p.id_forma_pago=f.id_forma_pago
				ORDER BY p.id_pedido DESC";
		$resultado=mysqli_query($conexion, $tipo);
		if($resultado -> num_rows >0){
            while($fila=mysqli_fetch_array($resultado)){
			
		$output .= "
					<tr>
						<td>".$fila['nom_cliente']."</td>
						<td>".$fila['dni_cliente']."</td>
						<td>".$fila['num_factura']."</td>
						<td>".$fila['fech_pedido']."</td>
                        <td>".$fila['fech_entrega']."</td>
                        <td>".$fila['sitio_entrega']."</td>
						<td>".$fila['estado_pedido']."</td>
						<td>".$fila['sub_total']."</td>
						<td>".$fila['ISV']."</td>
						<td>".$fila['total']."</td>
						<td>".$fila['forma_pago']."</td>
						<td>".$fila['fech_facturacion']."</td>
						<td>".$fila['porcentaje_isv']."</td>
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