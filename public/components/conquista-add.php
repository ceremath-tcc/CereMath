<?php
// conquista-funcoes.php
function ativarTriggerSession($trigger_key) {
    if (session_status() == PHP_SESSION_NONE) session_start();
    if (!isset($_SESSION['triggers_ativados'])) {
        $_SESSION['triggers_ativados'] = [];
    }
    if (!in_array($trigger_key, $_SESSION['triggers_ativados'])) {
        $_SESSION['triggers_ativados'][] = $trigger_key;
    }
}