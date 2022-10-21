<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require_once './PHPMailer/src/Exception.php';
require_once './PHPMailer/src/PHPMailer.php';
require_once './PHPMailer/src/SMTP.php';
require_once "./modelos/mainModel.php";
require_once './modelos/loginModelo.php';

class Correo extends mainModel{
    //funcion para enviar correo con el codigo de seguridad para restablecer contraseña
    public function enviarCorreo($correo){
        //Create an instance; passing `true` enables exceptions
        $mail = new PHPMailer(true);
        $bytes=random_bytes(5);
        $token_rec=(bin2hex($bytes)); //variable de token para verificacion 
        $codigo=rand(1000,9999); //codigo que se usará para la verificación

        try {
            //Server settings
           /*  $mail->SMTPDebug = SMTP::DEBUG_SERVER;  */                     //Enable verbose debug output
            $mail->isSMTP();                                            //Send using SMTP
            $mail->Host       = HOST_SMTP;                     //Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
            $mail->Username   = USER_SMTP;                     //SMTP username
            $mail->Password   = CLAVE_SMTP;                               //SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
            $mail->Port       = PUERTO_SMTP;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

            //Recipients
            $mail->setFrom('maynoraguileraosorto@gmail.com', 'Recuperacion de Contraseña');
            $mail->addAddress($correo);     //Add a recipient

            //Content
            $mail->isHTML(true); 
            $mail -> charSet = 'UTF-8';                                 //Set email format to HTML
            $mail->Subject = 'Restablecer Contrasena';
            $mail->Body    = '<html>
            <head>
                <title>Restablecer</title>
            </head>
        
            <body>
                <h1>City Coffee</h1>
                <div style="text-align: center; background-color: aquamarine;">
                    <p>Restablecer Contraseña</p>
                    <h3>'.$codigo.'</h3>
                    <p><a href="<?php echo SERVERURL; ?>login/">Clic aquí para restablecer su contraseña</a></p>
                    <small>Si usted no envio este mensaje favor de omitir</small>
                </div>
            </body>
        </html>';

          $mail->send();
          //instancia que llama a la función para guardar los datos de recuperacion
            $guardarDatos=new Usuario();
            $datosRec=$guardarDatos->insertToken($correo,$token_rec,$codigo);
            $_SESSION['respuesta'] = 'Correo enviado';
            $_SESSION['token']=$token_rec;
            $_SESSION['codigo']=$codigo;
            $_SESSION['correo']=$correo;
			return header("Location:".SERVERURL."rec-correo/");
        } catch (Exception $e) {
            echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        }
    }

    //funcion para verificar los dato de recuperacion insertados en la tabla
    //TBL_restablece_clave_email
    public function verificaCodigoToken($codigo){
        $codigo_verificacion=mainModel::limpiar_cadena($codigo);
        $token_verificacion=$_SESSION['token'];
        $correo_verificacion=$_SESSION['correo'];
        $array=array();

        //parametros obtenidos para el tamaño maximo y minimo de la contraseña
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

        //Parametro para la vigencia del codigo de seguridad ingresado
        //configurado actualmente en 24 horas
        $parametroVigenciaCodigo=new Usuario();
		$valorParametroVigencia=$parametroVigenciaCodigo->VigenciaCodigo();
			foreach ($valorParametroVigencia as $fila) { //se recorre el arreglo recibido
			//datos guardados para ser usados posteriormenete en el sistema
				$horasVigencia = $fila['valor'];
		}

        //se instancia y llama a la funcion que hara un select para verificar si los datos que se envian coinciden con los registrados en la bd
        $enviarCodigoVerif = new Usuario(); 
        $respuesta =  $enviarCodigoVerif->verificaCodigoToken($correo_verificacion,$token_verificacion,$codigo_verificacion);
        foreach ($respuesta as $fila) { //se recorre el arreglo recibido
            //datos guardados para ser usados posteriormenete en el sistema
            $array['codigo'] = $fila['codigo'];
            $array['fecha'] = $fila['fecha'];
        }

        //se obtiene la fecha del momento en que se llama la funcion
        //se resta la fecha en la que se envio el correo para validar que el codigo siga valido de acuerdo al tiempo asignado
        $fecha_actual=date('y-m-d h:i:s');
        $segundos=strtotime($fecha_actual)-strtotime($array['fecha']);
        $horas=$segundos/3600;

        //condicion que verifica si el codigo coincide con el guardado en la bd
        if(isset($array['codigo'])==''){
            $_SESSION['respuesta'] = 'codigo invalido';
            return header("Location:".SERVERURL."verifica-codigo/");
            die();
        //condicion que verifica si el codigo fue ingresado antes del tiempo limite
        }else if (isset($array['codigo'])>0 && $horas<=$horasVigencia){
                $_SESSION['respuesta'] = 'codigo valido';
                return header("Location:".SERVERURL."verifica-codigo/");
                die();
         //condicion que indica que el codigo ya no es válido al ser usado después del tiempo limite
            }else if(isset($array['codigo'])>0 && $horas>$horasVigencia){
                $_SESSION['respuesta'] = 'token vencido';
                return header("Location:".SERVERURL."verifica-codigo/");
                die();
            }

        
        
    }

    public function CorreoCambioContrasena($correo,$contrasena){
        //Create an instance; passing `true` enables exceptions
        $mail = new PHPMailer(true);
        $fecha=date('YmdHis');
        $token=md5($fecha);

        try {
            //Server settings
           /*  $mail->SMTPDebug = SMTP::DEBUG_SERVER;  */                     //Enable verbose debug output
            $mail->isSMTP();                                            //Send using SMTP
            $mail->Host       = HOST_SMTP;                     //Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
            $mail->Username   = USER_SMTP;                     //SMTP username
            $mail->Password   = CLAVE_SMTP;                               //SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
            $mail->Port       = PUERTO_SMTP;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

            //Recipients
            $mail->setFrom('maynoraguileraosorto@gmail.com', 'City Coffe');
            $mail->addAddress($correo);     //Add a recipient

            //Content
            $mail->isHTML(true); 
            $mail -> charSet = 'UTF-8';                                 //Set email format to HTML
            $mail->Subject = 'Cambio de Contrasena';
            $mail->Body    = 'Su contraseña ha sido cambiada exitosamente. <br/><br/>
            Su nueva contraseña es ' .$contrasena;

            $mail->send();
        } catch (Exception $e) {
            echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        }
    }

    public function CorreoCreacionUsuario($correo,$usuario,$contrasena){
        //Create an instance; passing `true` enables exceptions
        $mail = new PHPMailer(true);
        $fecha=date('YmdHis');
        $token=md5($fecha);

        try {
            //Server settings
           /*  $mail->SMTPDebug = SMTP::DEBUG_SERVER;  */                     //Enable verbose debug output
            $mail->isSMTP();                                            //Send using SMTP
            $mail->Host       = HOST_SMTP;                     //Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
            $mail->Username   = USER_SMTP;                     //SMTP username
            $mail->Password   = CLAVE_SMTP;                               //SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
            $mail->Port       = PUERTO_SMTP;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

            //Recipients
            $mail->setFrom('maynoraguileraosorto@gmail.com', 'City Coffe');
            $mail->addAddress($correo);     //Add a recipient

            //Content
            $mail->isHTML(true); 
            $mail -> charSet = 'UTF-8';                                 //Set email format to HTML
            $mail->Subject = 'Creacion de Usuario';
            $mail->Body    = 'Su usuario ha sido creado exitosamente en el sistema. <br/><br/>
            Las credenciales de ingreso son:<br/>
            Usuario: ' .$usuario. '<br/>
            Contraseña: ' .$contrasena;

            $mail->send();
        } catch (Exception $e) {
            echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        }
    }

    
}