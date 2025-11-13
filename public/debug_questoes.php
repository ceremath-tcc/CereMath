<?php
require_once __DIR__ . '/../src/controller/questaoController.php';

$controller = new PerguntaController();
$resultado = null;
$erro = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['materia_id'])) {
    $id_materia = (int) $_POST['materia_id'];

    try {
        $resultado = $controller->listarTodasQuestoes($id_materia);
    } catch (Exception $e) {
        $erro = $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Debug de Questões</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f4f6;
            padding: 20px;
            color: #222;
        }
        h1 {
            text-align: center;
        }
        form {
            margin: 0 auto 30px auto;
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        input[type="number"] {
            padding: 8px;
            width: 120px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        button {
            background: #2563eb;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            cursor: pointer;
        }
        button:hover {
            background: #1d4ed8;
        }
        .questao {
            background: white;
            margin-bottom: 20px;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        .enunciado {
            font-weight: bold;
            color: #111;
        }
        .variacao {
            margin-top: 10px;
            background: #f9fafb;
            padding: 10px;
            border-radius: 6px;
        }
        pre {
            background: #f3f4f6;
            padding: 10px;
            border-radius: 6px;
            overflow-x: auto;
        }
        .erro {
            background: #fee2e2;
            color: #b91c1c;
            padding: 10px;
            border-radius: 6px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <h1>🔍 Debug de Questões por Matéria</h1>

    <form method="POST">
        <label for="materia_id">ID da Matéria:</label>
        <input type="number" name="materia_id" id="materia_id" required>
        <button type="submit">Gerar</button>
    </form>

    <?php if ($erro): ?>
        <div class="erro">❌ Erro: <?= htmlspecialchars($erro) ?></div>
    <?php endif; ?>

    <?php if ($resultado): ?>
        <?php foreach ($resultado as $questao): ?>
            <div class="questao">
                <div class="enunciado">🧩 Pergunta #<?= $questao['id_pergunta'] ?>:</div>
                <p><?= htmlspecialchars($questao['enunciado_base']) ?></p>

                <?php if (!empty($questao['variacoes'])): ?>
                    <?php foreach ($questao['variacoes'] as $var): ?>
                        <div class="variacao">
                            <strong>Variação ID <?= $var['id_variavel'] ?>:</strong><br>
                            <em>Enunciado Gerado:</em> <?= htmlspecialchars($var['enunciado_gerado']) ?><br>
                            <em>Valores:</em>
                            <pre><?= json_encode($var['valores'], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) ?></pre>
                            <em>Alternativas:</em>
                            <pre><?= json_encode($var['alternativas'], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) ?></pre>
                        </div>
                    <?php endforeach; ?>
                <?php else: ?>
                    <div class="variacao">⚠️ Nenhuma variação encontrada.</div>
                <?php endif; ?>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
</body>
</html>
