<?php
require_once __DIR__ . '/../model/login.php'; // conexão

class QuestaoController
{
    public function gerarQuestaoAleatoria($id_materia)
    {
        $db = Connection::getConnection();

        // 1️⃣ Busca todas as perguntas da matéria
        $stmt = $db->prepare("SELECT id, texto FROM Perguntas WHERE materia_id = ?");
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
        $stmt = $db->prepare("SELECT id, valores FROM Variaveis WHERE pergunta_id = ?");
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
            FROM Alternativas
            WHERE variaveis_id = ?;
        ");
        $stmt->execute([$variaveis_id]);
        $altResult = $stmt->fetch(PDO::FETCH_ASSOC);

        $alternativas = [];
        if ($altResult && isset($altResult['opcoes'])) {
            $alternativas = json_decode($altResult['opcoes'], true);
        }

        // Retorna as informações importantes
        return [
            'id_pergunta' => $id_pergunta,
            'id_variavel' => $variaveis_id,
            'enunciado_gerado' => $textoFinal,
            'alternativas' => $alternativas
        ];
    }


    public function listarTodasQuestoes($id_materia)
{
    $db = Connection::getConnection();

    // 1️⃣ Busca todas as perguntas da matéria
    $stmt = $db->prepare("SELECT id, texto FROM Perguntas WHERE materia_id = ?");
    $stmt->execute([$id_materia]);
    $questoes = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (empty($questoes)) {
        throw new Exception("Nenhuma questão encontrada para esta matéria.");
    }

    $resultadoFinal = [];

    // 2️⃣ Itera sobre cada pergunta
    foreach ($questoes as $questao) {
        $id_pergunta = $questao['id'];
        $textoBase = $questao['texto'];

        // 3️⃣ Busca as variações (variáveis) dessa questão
        $stmt = $db->prepare("SELECT id, valores FROM Variaveis WHERE pergunta_id = ?");
        $stmt->execute([$id_pergunta]);
        $variaveis = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (empty($variaveis)) {
            $resultadoFinal[] = [
                'id_pergunta' => $id_pergunta,
                'enunciado_base' => $textoBase,
                'variacoes' => [],
                'erro' => "Nenhuma variação encontrada."
            ];
            continue;
        }

        $listaVariacoes = [];

        // 4️⃣ Para cada variação, substitui os placeholders
        foreach ($variaveis as $variavel) {
            $variaveis_id = $variavel['id'];
            $valores = json_decode($variavel['valores'], true);
            $textoFinal = $textoBase;

            if (!is_array($valores)) {
                $listaVariacoes[] = [
                    'id_variavel' => $variaveis_id,
                    'erro' => "JSON de valores inválido."
                ];
                continue;
            }

            foreach ($valores as $chave => $valor) {
                if (is_string($valor) && str_contains($valor, ',')) {
                    $lista = array_map('trim', explode(',', $valor));

                    // mesmo comportamento do seu código original
                    if ($chave !== 'v1') { 
                        $valorSubstituir = $lista[array_rand($lista)];
                    } else {
                        $valorSubstituir = implode(',', $lista);
                    }
                } else {
                    $valorSubstituir = $valor;
                }

                $textoFinal = str_replace(["[$chave]", $chave], $valorSubstituir, $textoFinal);
            }

            // 5️⃣ Busca alternativas para essa variação
            $stmtAlt = $db->prepare("SELECT opcoes FROM Alternativas WHERE variaveis_id = ?");
            $stmtAlt->execute([$variaveis_id]);
            $altResult = $stmtAlt->fetch(PDO::FETCH_ASSOC);

            $alternativas = $altResult && isset($altResult['opcoes'])
                ? json_decode($altResult['opcoes'], true)
                : [];

            $listaVariacoes[] = [
                'id_variavel' => $variaveis_id,
                'valores' => $valores,
                'enunciado_gerado' => $textoFinal,
                'alternativas' => $alternativas
            ];
        }

        $resultadoFinal[] = [
            'id_pergunta' => $id_pergunta,
            'enunciado_base' => $textoBase,
            'variacoes' => $listaVariacoes
        ];
    }

    return $resultadoFinal;
}

}

