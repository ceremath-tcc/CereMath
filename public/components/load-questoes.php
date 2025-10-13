<?php
require __DIR__ . '/../src/controller/questaoController.php';
$controller = new QuestaoController();

$id_materia = isset($_GET['materia']) ? intval($_GET['materia']) : 1;
$qtd = isset($_GET['qtd']) ? intval($_GET['qtd']) : 5; // quantidade de questões
$controller = new QuestaoController();

try {
    $questoes = [];
    for ($i = 0; $i < $qtd; $i++) {
        $questoes[] = $controller->gerarQuestaoAleatoria($id_materia);
    }
    echo json_encode($questoes, JSON_UNESCAPED_UNICODE);
} catch (Exception $e) {
    echo json_encode(['erro' => $e->getMessage()]);
}

unset($controller);