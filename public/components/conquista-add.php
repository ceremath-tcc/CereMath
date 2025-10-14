<?php
session_start();

// Verifica se a array ja foi criada
if (!isset($_SESSION['triggers_ativados'])) {
    $_SESSION['triggers_ativados'] = [];
}

//Verifica o metodo de requirimento
if ($_SERVER["REQUEST_METHOD"] == "POST"){
    //Guarda o trigger na variavel
    $trigger_key = $_POST['trigger_key'];

    // Adiciona o trigger se ainda não foi marcado
    if (!in_array($trigger_key, $_SESSION['triggers_ativados'])) {
        $_SESSION['triggers_ativados'][] = $trigger_key;
    }
}

