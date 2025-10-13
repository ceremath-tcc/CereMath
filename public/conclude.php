<?php
require __DIR__ . '/../src/controller/conceitoController.php';
$controller = new ConceitoController();
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_SESSION['id'];
    $id_materia = $_POST['id_conceito'];
    $acertos = $_POST['acertos'];
    $erros = $_POST['erros'];

    $controller->setConceito($id, $id_materia, $acertos, $erros);
} else {
    header('Location: home.php?erro');
    exit;
}

header('Location: conta.php');
exit;