<?php
require __DIR__ . '/../../src/controller/conceitoController.php';
$controller = new ConceitoController();
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_materia = $_POST['materia'];
    $acertos = $_POST['acertos'];
    $erros = $_POST['erros'];

    $controller->setConceito($_SERVER['id'], $id_materia, $acertos, $erros);
} else {
    header('Location: home.php?erro');
    exit;
}

header('Location: conta.php');
exit;