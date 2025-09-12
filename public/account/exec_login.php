<?php
require_once __DIR__ . '/../../src/controller/loginController.php';
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
    header('Location: /../public/home.php');
} else {
    header('Location: /../public/login.php?error=error');
}

