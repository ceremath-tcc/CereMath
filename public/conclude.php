<?php
require __DIR__ . '/../src/controller/conceitoController.php';
$controller = new ConceitoController();
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    //Pega os dados (o id da session e os outros vao ser enviados pelo arquivo progress.php)
    $id = $_SESSION['id'];
    $id_materia = $_POST['id_conceito'];
    $acertos = $_POST['acertos'];
    $erros = $_POST['erros'];

    //Aqui ele vai efetivar a mudança
    $controller->setConceito($id, $id_materia, $acertos, $erros);
} else {
    //Senão ele for metodo post, vai te enviar de volta pra home
    header('Location: home.php?erro');
    exit;
}

//No final, se nao deu erro te envia pra home
header('Location: home.php');
exit;