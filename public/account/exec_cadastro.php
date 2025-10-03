<?php
require_once __DIR__ . '/../../src/controller/loginController.php';
session_start();

require '../../vendor/autoload.php'; // PHPMailer
$controller = new UserController();

date_default_timezone_set('America/Sao_Paulo');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

if($_SERVER['REQUEST_METHOD'] === 'POST'){
    //Preparações e Variaveis
    $controller = new UserController();
    $username = $_POST['username'];
    $password = $_POST['password'];
    $email = $_POST['email'];

    //Insere no banco de dados e finaliza
    $user = $controller->signup($username, $password, $email);

    $_SESSION['id'] = $user['id'];
    if($user['email'] != null){
        $_SESSION['email'] = $user['email'];
    }
    $_SESSION['username'] = $username;
    //Fim do cadastro



    
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
        $mail->Subject = 'Bem vindo ao Ceremath!';
        $mail->Body    = "Sua conta <b> " . $_SESSION['username'] . "</b> foi criada com sucesso no dia " . date('d/m/Y') . " às " . date('H:i:s') . " - Horario de Brasília.<br>Seja bem vindo ao nosso site e em nome de todos os participantes do nosso TCC, desejamos que consiga aprender a matematica!<br><br>Caso não se recorde de ter feito o cadastro, é recomendavel que tome ação imediatamente quanto a isso.";

        $mail->send();
    } catch (Exception $e) {
        error_log("Erro ao enviar email: {$mail->ErrorInfo}");
    }
    //Final E-mail


    header('Location: /../public/home.php');
}