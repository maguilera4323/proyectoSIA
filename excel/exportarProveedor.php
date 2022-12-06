<?php
	header("Content-Type: application/xls");    
	header("Content-Disposition: attachment; filename=documento_exportado_" . date('Y:m:d:m:s').".xls");
	header("Pragma: no-cache"); 
	header("Expires: 0");

	include ("../cone.php");  
	
	$output = "";
	
	
		$output .="
            <h3>Informe de Proveedores</h3>
            <br>
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>RTN</th>
						<th>Telefono</th>
                        <th>Correo</th>
                        <th>Direccion</th>
					</tr>
				<tbody>
		";
		
		$tipo="SELECT * FROM TBL_Proveedores";
		$resultado=mysqli_query($conexion, $tipo);
		if($resultado -> num_rows >0){
            while($fila=mysqli_fetch_array($resultado)){
			
		$output .= "
					<tr>
						<td>".$fila['id_Proveedores']."</td>
						<td>".$fila['nom_proveedor']."</td>
						<td>".$fila['rtn_proveedor']."</td>
						<td>".$fila['tel_proveedor']."</td>
                        <td>".$fila['correo_proveedor']."</td>
                        <td>".$fila['dir_proveedor']."</td>
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