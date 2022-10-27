<?
/* /////// CONEXIÓN A LA BASE DE DATOS ///////// */
include ("./cone.php");



/* //////////////// VALORES INICIALES /////////////////////// */

$tablas="";
$cons=" SELECT * FROM `TBL_bitacora`" ;

/* ///////// LO QUE OCURRE AL TECLEAR SOBRE EL INPUT DE BUSQUEDA //////////// */
if(isset($_POST['TBL_bitacora']))
{
	$q=$conexion->real_escape_string($_POST['TBL_bitacora']);
	$cons="SELECT * FROM TBL_bitacora WHERE 
		id_bitacora LIKE '%".$q."%' OR
		id_objeto LIKE '%".$q."%' OR
		fecha LIKE '%".$q."%' OR
		id_usuario LIKE '%".$q."%' OR
        accion LIKE '%".$q."%' OR
		descripcion LIKE '%".$q."%'";
}

$buscarbitacora=$conexion->query($cons);
if ($buscarbitacora->num_rows > 0)
{
	$tabla.= 
	'<table class="table">
		<tr class="bg-primary">
            <th>#</th>
            <th>OBJETO</th>
            <th>FECHA</th>
            <th>USUARIO</th>
            <th>ACCION</th>
            <th>DESCRIPCION</th>
		</tr>';

	while($filabitaciora= $buscarbitacora->fetch_assoc())
	{
		$tabla.=
		'<tr>
			<td>'.$filabitaciora['id_bitacora'].'</td>
			<td>'.$filabitaciora['id_objeto'].'</td>
			<td>'.$filabitaciora['fecha'].'</td>
			<td>'.$filabitaciora['id_usuario'].'</td>
			<td>'.$filabitaciora['accion'].'</td>
            <td>'.$filabitaciora['descripcion'].'</td>
		 </tr>
		';
	}

	$tabla.='</table>';
} else
	{
		$tabla="No se encontraron coincidencias con sus criterios de búsqueda.";
	}


echo $tabla;
?>
