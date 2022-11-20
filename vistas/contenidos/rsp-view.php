<?php

$host = "20.163.218.52";
$username = "admin_bd";
$password = "clave1234";
$database_name = "proyecto_cafeteria";
$day=date("d");
$mont=date("m");
$year=date("Y");
$hora=date("H.i.s");
$fecha=$day.'_'.$mont.'_'.$year.'_-_'.$hora;

/* const BACKUP_PATH =  "../backup/";*/ 
//conectado a la BD
$conn = mysqli_connect($host, $username, $password, $database_name);
$conn->set_charset("utf8");


// Get All Table Names From the Database
$tables = array();
$sql = "SHOW TABLES";
$result = mysqli_query($conn, $sql);

while ($row = mysqli_fetch_row($result)) {
    $tables[] = $row[0];
}

$sqlScript = "";
foreach ($tables as $table) {
    
    // Preparar SQLscript para crear la estructura de la tabla
    $query = "SHOW CREATE TABLE $table";
    $result = mysqli_query($conn, $query);
    $row = mysqli_fetch_row($result);
    
    $sqlScript .= "\n\n" . $row[1] . ";\n\n";
    
    
    $query = "SELECT * FROM $table";
    $result = mysqli_query($conn, $query);
    
    $columnCount = mysqli_num_fields($result);
    
    // Prepare SQLscript para volcar datos para cada tabla
    for ($i = 0; $i < $columnCount; $i ++) {
        while ($row = mysqli_fetch_row($result)) {
            $sqlScript .= "INSERT INTO $table VALUES(";
            for ($j = 0; $j < $columnCount; $j ++) {
                $row[$j] = $row[$j];
                
                if (isset($row[$j])) {
                    $sqlScript .= '"' . $row[$j] . '"';
                } else {
                    $sqlScript .= '""';
                }
                if ($j < ($columnCount - 1)) {
                    $sqlScript .= ',';
                }
            }
            $sqlScript .= ");\n";
        }
    }
    
    $sqlScript .= "\n"; 
}

if(!empty($sqlScript))
{
    // Guarde el script SQL en un archivo de copia de seguridad
    $backup_file_name = $database_name . '_backup_' . $fecha . '.sql';
    $fileHandler = fopen($backup_file_name, 'w+');
    $number_of_lines = fwrite($fileHandler, $sqlScript);
    fclose($fileHandler); 

    // Descarga el archivo de copia de seguridad de SQL en el navegador
    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename=' . basename($backup_file_name));
    header('Content-Transfer-Encoding: binary');
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');
    header('Content-Length: ' . filesize($backup_file_name));
    ob_clean();
    flush();
    readfile($backup_file_name);
    exec('rm ' . $backup_file_name); 
}
