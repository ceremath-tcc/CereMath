<?php
require_once "../../src/conquistaController";
session_start();

// Verifica se esta definido (se nao estiver, nao vai fazer nada)
if (isset($_SESSION['triggers_ativados'])) {
    $controller = new ConquistaController();

    //Vai definir todas as conquistas guardadas como concluidas
    foreach ($_SESSION['triggers_ativados'] as $trigger_key) {
        $controllerConquista->ativarTrigger($_SESSION['id'], $trigger_key);
    }
    // Esvazia após processar
    unset($_SESSION['triggers_ativados']);
    unset($controller);
}