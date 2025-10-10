<?php
require_once __DIR__ . '/../model/login.php'; // conexão

class QuestaoController
{
    public function gerarQuestaoAleatoria($id_materia)
    {
        $db = Connection::getConnection();

        // 1️⃣ Busca todas as perguntas da matéria
        $stmt = $db->prepare("SELECT id, texto FROM perguntas WHERE materia_id = ?");
        $stmt->execute([$id_materia]);
        $questoes = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (empty($questoes)) {
            throw new Exception("Nenhuma questão encontrada para esta matéria.");
        }

        // 2️⃣ Escolhe uma questão aleatória
        $indexQuestao = rand(0, count($questoes) - 1);
        $questaoEscolhida = $questoes[$indexQuestao];
        $id_pergunta = $questaoEscolhida['id'];
        $textoBase = $questaoEscolhida['texto'];

        // 3️⃣ Busca as variáveis da questão
        $stmt = $db->prepare("SELECT id, valores FROM variaveis WHERE pergunta_id = ?");
        $stmt->execute([$id_pergunta]);
        $variaveis = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (empty($variaveis)) {
            throw new Exception("Nenhuma variável encontrada para a questão ID {$id_pergunta}.");
        }

        // 4️⃣ Escolhe um conjunto de variáveis aleatório
        $indexVar = rand(0, count($variaveis) - 1);
        $variavelEscolhida = $variaveis[$indexVar];
        $variaveis_id = $variavelEscolhida['id'];

        $valores = json_decode($variavelEscolhida['valores'], true);

        // 5️⃣ Substitui [v1], [v2]... ou v1, v2... no texto
        $textoFinal = $textoBase;
        foreach ($valores as $chave => $valor) {
            if (is_string($valor) && str_contains($valor, ',')) {
                $lista = array_map('trim', explode(',', $valor));
        
                // Só sorteia se o valor representar uma variável individual (ex: v2)
                if ($chave !== 'v1') { 
                    $valorSubstituir = $lista[array_rand($lista)];
                } else {
                    $valorSubstituir = implode(',', $lista); // mantém o conjunto completo
                }
            } else {
                $valorSubstituir = $valor;
            }
        
            // Substitui tanto [v1] quanto v1
            $textoFinal = str_replace(["[$chave]", $chave], $valorSubstituir, $textoFinal);
        }
        

        // 6️⃣ Busca as alternativas correspondentes à pergunta e ao conjunto de variáveis
        $stmt = $db->prepare("
            SELECT opcoes
            FROM alternativas
            WHERE pergunta_id = ? AND variaveis_id = ?;
        ");
        $stmt->execute([$id_pergunta, $variaveis_id]);
        $altResult = $stmt->fetch(PDO::FETCH_ASSOC);

        $alternativas = [];
        if ($altResult && isset($altResult['opcoes'])) {
            $alternativas = json_decode($altResult['opcoes'], true);
        }

        // Retorna as informações importantes
        return [
            'enunciado_gerado' => $textoFinal,
            'alternativas' => $alternativas
        ];
    }
}

