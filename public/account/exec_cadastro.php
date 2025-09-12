<?php
require_once __DIR__ . '/../../src/controller/loginController.php';
session_start();
$controller = new UserController();

if($_SERVER['REQUEST_METHOD'] === 'POST'){
    //Preparações e Variaveis
    $controller = new UserController();
    $username = $_POST['username'];
    $password = $_POST['password'];

    //Insere no banco de dados e finaliza
    $user = $controller->signup($username, $password);

    $_SESSION['id'] = $user['id'];
    if($user['email'] != null){
        $_SESSION['email'] = $user['email'];
    }
    $_SESSION['username'] = $username;
    $_SESSION['id'] = $id;
    header('Location: /../public/home.php');
}