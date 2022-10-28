<?php
 if (session_status() == PHP_SESSION_NONE) {
	session_start();
    } 
// no tocar
    require_once './modelos/loginModelo.php';
    require_once "./controladores/VistasControlador.php";
    require_once "./controladores/emailControlador.php";
    require_once './modelos/mainModel.php';
    require_once "./pruebabitacora.php";
  
class autorespuestasControlador extends mainModel{
//Función para guardar las respuestas de las preguntas de seguridad en el primer ingreso de un usuario
    public function insertarRespuestasSeguridad($datos){
        //valores para guardar las respuestas: respuesta, id de pregunta y id del usuario
        $res_pregunta=mainModel::limpiar_cadena($datos['respuesta']);
        $id_pregunta=mainModel::limpiar_cadena($datos['pregunta']);
        if(isset($_SESSION['usuario'])){
            $usuario=$_SESSION['usuario'];
        }
        $contador_preguntas=mainModel::limpiar_cadena($datos['contador']);

        $parametroMinContrasena=new Usuario();
            $valorParametroMin=$parametroMinContrasena->minContrasena();
                foreach ($valorParametroMin as $fila) { //se recorre el arreglo recibido
                    //datos guardados para ser usados posteriormenete en el sistema
                    $_SESSION['min_contrasena'] = $fila['valor'];
                }
        
        $parametroMaxContrasena=new Usuario();
            $valorParametroMax=$parametroMaxContrasena->maxContrasena();
                foreach ($valorParametroMax as $fila) { //se recorre el arreglo recibido
                    //datos guardados para ser usados posteriormenete en el sistema
                    $_SESSION['max_contrasena'] = $fila['valor'];
                }
// para obtener el id del usuario
         $obternerid=new Usuario();
        $id = $obternerid->obtener_idusuario($usuario);
        foreach($id as $fila){
             $hash=$fila['id_usuario'];
            }

    /* 	$revisarRespuestaExistente=new Usuario();
        $respuesta_existe = $revisarRespuestaExistente->revisarPreguntaRespondida($res_pregunta,$id_usuario,$id_pregunta);

        if($respuesta_existe->rowCount()==1){
            $_SESSION['respuesta']='Pregunta ya respondida';
            $_SESSION['contador_preguntas']-=1;
            return header("Location:".SERVERURL."primer-ingreso/");
        } */

            if($contador_preguntas<=2){
                $insertarRespuesta = new Usuario(); //se crea una instancia en el archivo modelo de Login
                $respuesta = $insertarRespuesta->insertarRespuestasSeguridad($res_pregunta,$hash,$id_pregunta);
                $_SESSION['contador_preguntas']+=1;
            }else{
                //al pasar por todas las preguntas de seguridad se actualiza el estado de usuario a Activo
                //y se redirige a la pagina de home
                $insertarRespuesta = new Usuario();
                $respuesta = $insertarRespuesta->actualizarUsuario($hash);
                $_SESSION['contador_preguntas']=1;
                $_SESSION['respuesta']='';
                return header("Location:".SERVERURL."cambiocontrasena/");
                die();
            }
        }
}