<?php
	
	$db_host = '20.25.134.34'; 
	$db_name = 'proyecto_cafeteria'; 
	$db_user = 'admin_bd'; 
	$db_pass = 'admin1234'; 
	
	$fecha = date("Ymd-His"); //Obtenemos la fecha y hora para identificar el respaldo

	// Construimos el nombre de archivo SQL Ejemplo: nombredelaBD_20220101-081120.sql
	$salida_sql = $db_name.'_'.$fecha.'.sql'; 
	
	//Comando para genera respaldo de MySQL, enviamos las variales de conexion y el destino
	$dump = "mysqldump --h$db_host -u$db_user -p$db_pass --opt $db_name > $salida_sql";// verificar por que no me agarra los datos de la base de dato. ERROR mysqldum
	system($dump, $output); //Ejecutamos el comando para respaldo
	
	$zip = new ZipArchive(); //Objeto de Libreria ZipArchive en php, crea el archivo ZIP
	
	//Construimos el nombre del archivo ZIP Ejemplo: nombredelaBD_20220101-081120.zip
	$salida_zip = $db_name.'_'.$fecha.'.zip';
	
	if($zip->open($salida_zip,ZIPARCHIVE::CREATE)===true) { //Creamos y abrimos el archivo ZIP
		$zip->addFile($salida_sql); //Agregamos el archivo SQL a ZIP
		$zip->close(); //Cerramos el ZIP
		unlink($salida_sql); //Eliminamos el archivo temporal SQL (se crea en la carpeta de la APP)
		header ("Location: $salida_zip"); // Redireccionamos para descargar el Arcivo ZIP
		} else {
		echo 'Error'; //Enviamos el mensaje de error
	}
?>

<!-- POSDATA BORRAR DE VITAS MODELO LOS INDICADORES 

|| $vistas=="info"
y el indicador 


|| $vistas=="respaldo"
SINO VAMOS A UTILIZAR ESTE ARCHIVO

TAMBIEN DEL ARCHIVO PLANTILLA


TAMBIEN EL ARCHIVO info-view.php de la carpeta contenidos



-->