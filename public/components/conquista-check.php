<?php
require_once __DIR__ . '/../../src/controller/conquistaController.php';
// Verifica se esta definido (se nao estiver, nao vai fazer nada)
if (isset($_SESSION['triggers_ativados'])) {
    $controller = new ConquistaController();

    // Esvazia após processar
    unset($controller);
}
?>
