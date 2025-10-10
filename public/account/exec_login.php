<?php
require_once __DIR__ . '/../../src/controller/loginController.php';
require '../../vendor/autoload.php'; // PHPMailer

date_default_timezone_set('America/Sao_Paulo');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

session_start();

if($_SERVER['REQUEST_METHOD'] === 'POST'){
    //Preparaçoes e variaveis
    $controller = new UserController();
    $username = $_POST['username'];
    $password = $_POST['password'];

    //Verifica as informaçoes e confirma
    $user = $controller->login($username, $password);
    
    $_SESSION['id'] = $user['id'];
    if($user['email'] != null){
        $_SESSION['email'] = $user['email'];
    }
    $_SESSION['username'] = $username;
    //Criação da conta finalizada



    //Inicio de enviar o e-mail para a conta

    // ===== Envia o e-mail =====
    $mail = new PHPMailer(true);

    try {
        $mail->isSMTP();
        $mail->Host       = 'smtp.gmail.com';
        $mail->SMTPAuth   = true;
        $mail->Username   = 'ceremath.tcc@gmail.com'; 
        $mail->Password   = 'syiu bsra encp tzmw'; // senha de aplicativo
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port       = 587;

        $mail->setFrom('ceremath.tcc@gmail.com', 'Ceremath');
        $mail->addAddress($_SESSION['email'], $_SESSION['username']); 

        $mail->isHTML(true);
        $mail->Subject = 'Novo login detectado! - Ceremath';
        $mail->Body    = "Login detectado na sua conta: <b> " . $_SESSION['username'] . "</b> no dia " . date('d/m/Y') . " às " . date('H:i:s') . " - Horario de Brasília.<br><br>Caso não se recorde de ter feito o login, é recomendavel que mude sua senha imediatamente.";

        $mail->send();
    } catch (Exception $e) {
        error_log("Erro ao enviar email: {$mail->ErrorInfo}");
    }
    //Final E-mail

    unset($controller);
    header('Location: /../public/home.php');
} else {
    unset($controller);
    header('Location: /../public/login.php?error=error');
}

