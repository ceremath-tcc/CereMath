<?php
session_start();
$titulo = $_GET['titulo'] ?? '';
$titulo = intval($titulo);

if(isset($_SESSION['historico'])){
    // Remove apenas a última resposta da IA
    array_pop($_SESSION['historico']);
} else {
    header("Location: ../ia.php?titulo=" . urlencode($titulo));
    exit;
}

// Transforma o histórico em JSON
$historico = json_encode($_SESSION['historico'], JSON_UNESCAPED_UNICODE);

//Define a mensagem a variavel em comum

// Tente detectar o caminho do Python (caso não queira hardcode)
$python = "python3";  // Para sistemas Unix
if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') {
    $python = "C:\\Python313\\python.exe";  // Caminho específico do Windows
}
$python = "C:/Python313/python.exe";

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