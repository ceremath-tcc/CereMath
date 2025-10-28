<?php
require_once __DIR__ . '/../../src/controller/conquistaController.php';
session_start();

header('Content-Type: application/json; charset=utf-8');

$conquistas_novas = [];

// Verifica se temos triggers ativadas E um ID de usuário
if (isset($_SESSION['triggers_ativados']) && isset($_SESSION['id']) && !empty($_SESSION['triggers_ativados'])) {

    $controller = new ConquistaController();
    $triggers_processadas = []; // Armazena as chaves que foram processadas com sucesso

    foreach ($_SESSION['triggers_ativados'] as $trigger_key) {
        $verify = $controller->verificarTrigger($_SESSION['id'], $trigger_key);

        // Se retornar um array (conquista nova)
        if (is_array($verify)) {
            $conquistas_novas[] = $verify; // Adiciona para enviar ao JS
            $triggers_processadas[] = $trigger_key; // Marca para ser limpa da sessão
        }
        // Se retornar 1 (já tem), nós a marcamos como processada também, para limpar a sessão
        elseif ($verify == 1) {
            $triggers_processadas[] = $trigger_key;
        }
        // Se retornar 0 (trigger inválida), apenas ignoramos
    }

    //Vai definir todas as conquistas guardadas como concluidas
    foreach ($_SESSION['triggers_ativados'] as $trigger_key) {
        $return = $controller->ativarTrigger($_SESSION['id'], $trigger_key);
    }

    // --- PARTE DA LIMPEZA (MANTIDA DA LÓGICA ANTIGA DE CHECK) ---
    // Remove as chaves que acabamos de processar da sessão
    if (!empty($triggers_processadas)) {
        // Filtra o array original, mantendo apenas o que NÃO foi processado
        $_SESSION['triggers_ativados'] = array_diff($_SESSION['triggers_ativados'], $triggers_processadas);
        // Opcional: Se for um array indexado, pode ser bom reindexar
        $_SESSION['triggers_ativados'] = array_values($_SESSION['triggers_ativados']);
    }
}

// Retorna o JSON com as conquistas que foram encontradas e processadas
echo json_encode($conquistas_novas, JSON_UNESCAPED_UNICODE);
?>