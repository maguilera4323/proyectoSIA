<?php
/*colocar en el mainmodel*/
/* los que estan despues de VALUES son los marcadores */

class Bitacora extends mainModel {

    static function guardar_bitacora($datos){
        $sql=mainModel::conectar()->prepare("INSERT INTO TBL_bitacora(id_objeto, fecha, id_usuario, accion, descripcion)
        VALUES (:id_objeto,:fecha,:id_usuario,:accion,:descripcion)" );
        $sql->bindParam(":id_objeto",$datos['id_objeto']);
        $sql->bindParam(":fecha",$datos['fecha']);
        $sql->bindParam(":id_usuario",$datos['id_usuario']);
        $sql->bindParam(":accion",$datos['accion']);
        $sql->bindParam(":descripcion",$datos['descripcion']);
        $sql->execute();
        return $sql;
    }
    
    /*esta funcion se crea para actualizar la bitacora y llenara el campo de hora final
    o hora de cierre de sesion */
    
    function actualizar_bitacora($codigo,$hora){
        $sql=self::conectar()->prepare("UPDATE bitacora SET bitacoraHoraFinal=:Hora 
        WHERE bitacoracodigo=:codigo");//AQUI SE HACE LA ACTUALIZACION DE LA COLUMNA bitacoraHoraFinal
        
        $sql->bindParam(":hora",$hora);
        $sql->bindParam(":codigo",$codigo);
        $sql->execute();
        return $sql; 
    }
    
    //LIMINAR DATOS DE LA BITACORA
    function eliminar_bitacora($codigo,$hora){
        $sql=self::conectar()->prepare("DELETE FROM bitacora WHERE cuentaCodigo:codigo");
        $sql->bindParam(":codigo",$codigo);
        $sql->execute();
        return $sql; 
    }

}
