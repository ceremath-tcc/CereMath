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
    $apiKey = getenv('RESEND_API_KEY');
    
    $data = [
      "from" => "onboarding@resend.dev",
      "to" => [$_SESSION['email']],
      "subject" => "Novo login detectado! - Ceremath",
      "html" => "Login detectado na sua conta: <b> " . $_SESSION['username'] . "</b> no dia " . date('d/m/Y') . " às " . date('H:i:s') . " - Horario de Brasília.<br><br>Caso não se recorde de ter feito o login, é recomendavel que mude sua senha imediatamente.</p>"
    ];
    
    $ch = curl_init("https://api.resend.com/emails");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
      "Authorization: Bearer $apiKey",
      "Content-Type: application/json"
    ]);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
    
    $response = curl_exec($ch);
    curl_close($ch);
    //Final E-mail


    //Finalizando
    unset($controller);
    header('Location: /../public/home.php');
} else {
    unset($controller);
    header('Location: /../public/login.php?error=error');
}

