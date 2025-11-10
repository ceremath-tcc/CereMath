<?php
require_once __DIR__ . '/../src/databases/Connection.php';




//Conferindo a conexão
try {
    $conn = Connection::getConnection();
    echo "✅ Conectado com sucesso!";
} catch (PDOException $e) {
    echo "❌ Erro ao conectar: " . $e->getMessage();
}




//Mandando o Arquivo MySQL pra Aiven
try {
    // Conexão com o banco
    $pdo = Connection::getConnection();

    // Caminho do seu arquivo SQL
    $sqlFile = __DIR__ . '/../backup.sql'; // mude o caminho se estiver em outra pasta

    // Verifica se o arquivo existe
    if (!file_exists($sqlFile)) {
        throw new Exception("Arquivo SQL não encontrado: $sqlFile");
    }

    // Lê o conteúdo do arquivo SQL
    $sql = file_get_contents($sqlFile);

    // Executa o SQL no banco
    $pdo->exec($sql);

    echo "✅ Base de dados importada com sucesso!";
} catch (PDOException $e) {
    echo "❌ Erro ao importar (PDO): " . $e->getMessage();
} catch (Exception $e) {
    echo "⚠️ Erro geral: " . $e->getMessage();
}
