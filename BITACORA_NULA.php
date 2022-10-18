<?php
/*colocar en el mainmodel*/
/* los que estan despues de VALUES son los marcadores */

protected function guardar_bitacora($datos){
    $sql=self::conectar()->prepare("INSERT INTO bitacora(bitacoracodigo,bitacorafecha,
    bitacoraHoraInicio,bitacoraHoraFinal,bitacoraTipo,bitacorayear,cuentaCodigo)
    VALUES (:codigo,:fecha,:HoraInicio,:HoraFinal,:tipo,:year,:cuenta)" );
    $sql->bindParam(":codigo",$datos['codigo']);
    $sql->bindParam(":fecha",$datos['fecha']);
    $sql->bindParam(":HoraInicio",$datos['HoraInicio']);
    $sql->bindParam(":HoraFinal",$datos['HoraFina']);
    $sql->bindParam(":tipo",$datos['tipo']);
    $sql->bindParam(":year",$datos['year']);
    $sql->bindParam(":cuenta",$datos['cuenta']);
    $sql->execute();
	return $sql;
}

/*esta funcion se crea para actualizar la bitacora y llenara el campo de hora final
o hora de cierre de sesion */

protected function actualizar_bitacora($codigo,$hora){
    $sql=self::conectar()->prepare("UPDATE bitacora SET bitacoraHoraFinal=:Hora 
    WHERE bitacoracodigo=:codigo");//AQUI SE HACE LA ACTUALIZACION DE LA COLUMNA bitacoraHoraFinal
    
    $sql->bindParam(":hora",$hora);
    $sql->bindParam(":codigo",$codigo);
    $sql->execute();
	return $sql; 
}

//LIMINAR DATOS DE LA BITACORA
protected function eliminar_bitacora($codigo,$hora){
    $sql=self::conectar()->prepare("DELETE FROM bitacora WHERE cuentaCodigo:codigo");
    $sql->bindParam(":codigo",$codigo);
    $sql->execute();
	return $sql; 
}