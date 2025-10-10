<?php
require_once __DIR__ . '/../../src/controller/loginController.php';
require_once __DIR__ . '/../../src/controller/conceitoController.php';

$controllerU = new UserController();
$controllerC = new ConceitoController();

$check = $controllerU->checkUser($_SESSION['username']);

//Verifica se elas conferem
if ($check != $_SESSION['id']) {
    //Se nao conferem, vai tirar os valores da $_SESSION
    unset($_SESSION['username']);
    unset($_SESSION['id']);
    unset($_SESSION['email']);
    header('Location: home.php');
}

unset($controllerU);