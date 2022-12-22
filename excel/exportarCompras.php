<?php
	date_default_timezone_set('America/Tegucigalpa');
	header("Content-Type: application/xls");    
	header("Content-Disposition: attachment; filename=Informe_Compras_" . date('Y:m:d H:i:s').".xls");
	header("Pragma: no-cache"); 
	header("Expires: 0");

	include ("../cone.php");  
	
	$output = "";
	
	
		$output .="
            <h3>Informe de Compras</h3>
            <br>
			<table border='1'>
				<thead>
				<tr style='background-color:#22C6F7;'>
						<th>ID</th>
						<th>Proveedor</th>
						<th>Usuario</th>
						<th>Estado</th>
                        <th>Fecha</th>
                        <th>Total</th>
					</tr>
				<tbody>
		";
		
		$tipo="SELECT c.id_compra, c.id_proveedor, p.nom_proveedor,u.usuario,e.nom_estado_compra,c.fech_compra,
		c.total_compra FROM TBL_compras c
		inner JOIN TBL_Proveedores p ON p.id_Proveedores = c.id_proveedor
		inner JOIN TBL_usuarios u ON u.id_usuario = c.id_usuario
		inner JOIN TBL_estado_compras e ON e.id_estado_compra = c.id_estado_compra";
		$resultado=mysqli_query($conexion, $tipo);
		if($resultado -> num_rows >0){
            while($fila=mysqli_fetch_array($resultado)){
			
		$output .= "
					<tr>
						<td>".$fila['id_compra']."</td>
						<td>".$fila['nom_proveedor']."</td>
						<td>".$fila['usuario']."</td>
						<td>".$fila['nom_estado_compra']."</td>
                        <td>".$fila['fech_compra']."</td>
                        <td>".$fila['total_compra']."</td>
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