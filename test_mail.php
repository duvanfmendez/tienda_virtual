<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'Libraries/phpmailer/Exception.php';
require 'Libraries/phpmailer/PHPMailer.php';
require 'Libraries/phpmailer/SMTP.php';

$mail = new PHPMailer(true);

try {
    // DEBUG: ver qué pasa en la conexión
    $mail->SMTPDebug = 2; 
    $mail->Debugoutput = 'html';

    $mail->isSMTP();
    $mail->Host       = 'smtp.gmail.com';
    $mail->SMTPAuth   = true;
    $mail->Username   = 'soportestuntriders@gmail.com';
    $mail->Password   = 'mkme jgrz nenm zglh'; // tu clave de aplicación
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
    $mail->Port       = 587;

    $mail->setFrom('soportestuntriders@gmail.com', 'Soporte Stunt Riders');
    $mail->addAddress('tiagovalbuenacabadia@gmail.com'); // 👈 cámbialo por tu correo real

    $mail->isHTML(true);
    $mail->Subject = 'Prueba simple PHPMailer';
    $mail->Body    = '<h1>Hola!</h1><p>Este es un correo de prueba enviado con Gmail y PHPMailer.</p>';

    if ($mail->send()) {
        echo "✅ Correo enviado correctamente";
    } else {
        echo "❌ Error al enviar: " . $mail->ErrorInfo;
    }
} catch (Exception $e) {
    echo "❌ Excepción: {$e->getMessage()}";
}
