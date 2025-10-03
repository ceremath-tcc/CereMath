<?php
session_start();
header('Content-Type: application/json; charset=utf-8');
mb_internal_encoding("UTF-8");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $valor = $_POST['valor'];
    if (trim($valor) == '') {
        header("Location: index.php");
        exit;
    }

    // Verifica se o histórico foi definido já
    if (!isset($_SESSION['historico'])) {
        $_SESSION['historico'][] = [
            "role" => "system",
            "content" => "Your name is Ceremath, a math assistant teaching high school students. Never answer in english or any other language. Always respond in Portuguese from Brazil. If the user asks in a different language, translate the question and respond in Portuguese. Do not mention images or links in your replies, only do so if requested by the user."
        ];
    }

    // Guarda a mensagem do usuário no histórico
    $_SESSION['historico'][] = [
        "role" => "user",
        "content" => $valor
    ];

    // Transforma o histórico em JSON
    $historico = json_encode($_SESSION['historico'], JSON_UNESCAPED_UNICODE);

    // Tente detectar o caminho do Python (caso não queira hardcode)
    $python = "python3";  // Para sistemas Unix
    if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') {
        $python = "C:\\Users\\Aluno\\AppData\\Local\\Programs\\Python\\Python313\\python.exe";  // Caminho específico do Windows
    }

    // Caminho do script Python
    $caminho_script = "../python/ia.py";

    // Envia o valor para a função Python
    $process = proc_open(
        $python . " " . $caminho_script,
        [
            0 => ["pipe", "r"],  // stdin
            1 => ["pipe", "w"],  // stdout
            2 => ["pipe", "w"],  // stderr
        ],
        $pipes
    );

    if (is_resource($process)) {
        // Envia o histórico (JSON) para o script Python
        fwrite($pipes[0], $historico);
        fclose($pipes[0]);

        // Captura a saída do script
        $saida = stream_get_contents($pipes[1]);
        fclose($pipes[1]);

        // Captura erros (se houver)
        $erros = stream_get_contents($pipes[2]);
        fclose($pipes[2]);

        // Fecha o processo
        proc_close($process);

        // Diagnóstico: Verifica se houve erro
        if (!empty($erros)) {
            $saida = "Erro ao executar o script Python: " . $erros;  // Adiciona log de erros
        }

        // Diagnóstico: Verifica se há saída
        if (empty($saida)) {
            error_log("Nenhuma saída recebida do script Python.");
        }

        $saida = trim($saida);
        $saida = mb_convert_encoding($saida, 'UTF-8', 'auto');
        $resposta_final = preg_replace('/\*\*(.*?)\*\*/', '<strong>$1</strong>', $saida);

        // Adiciona a resposta ao histórico
        $_SESSION['historico'][] = [
            "role" => "assistant",
            "content" => $resposta_final
        ];
    }

    // Redireciona para a mesma página com o parâmetro 'titulo'
    $titulo = $_GET['titulo'] ?? '';
    $titulo = intval($titulo);
    header("Location: ../ia.php?titulo=" . urlencode($titulo));
    exit;
}
