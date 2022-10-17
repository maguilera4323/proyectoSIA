<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require './PHPMailer/src/Exception.php';
require './PHPMailer/src/PHPMailer.php';
require './PHPMailer/src/SMTP.php';
require_once "./modelos/mainModel.php";

class Correo extends mainModel{
    
    public function enviarCorreo($correo){
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
            $mail->setFrom('maynoraguileraosorto@gmail.com', 'Prueba');
            $mail->addAddress($correo);     //Add a recipient

            //Content
            $mail->isHTML(true); 
            $mail -> charSet = 'UTF-8';                                 //Set email format to HTML
            $mail->Subject = 'Restablecer Contrasena';
            $mail->Body    = 'Has pedido restablecer tu contraseña, si no has sido tú omite este mensaje <br/>
            Para cambiar contraseña clic aqui ' .$token;

            $mail->send();
            $_SESSION['respuesta'] = 'Correo enviado';
			return header("Location:".SERVERURL."rec-correo/");
        } catch (Exception $e) {
            echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        }
    }
}