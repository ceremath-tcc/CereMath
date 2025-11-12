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
   $apiKey = getenv('RESEND_API_KEY');
    
    $data = [
      "from" => "onboarding@resend.dev",
      "to" => ["$_SESSION['email']"],
      "subject" => "Bem vindo ao Ceremath!",
      "html" => "Sua conta <b> " . $_SESSION['username'] . "</b> foi criada com sucesso no dia " . date('d/m/Y') . " às " . date('H:i:s') . " - Horario de Brasília.<br>Seja bem vindo ao nosso site e em nome de todos os participantes do nosso TCC, desejamos que consiga aprender a matematica!<br><br>Caso não se recorde de ter feito o cadastro, é recomendavel que tome ação imediatamente quanto a isso."
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

    unset($controller);
    header('Location: /../public/home.php');
} else {
    unset($controller);
    header('Location: /../public/home.php');
}
