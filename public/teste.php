<?php
require_once __DIR__ . '/../src/databases/Connection.php';




//Conferindo a conexão
try {
    $conn = Connection::getConnection();
    echo "✅ Conectado com sucesso!";
} catch (PDOException $e) {
    echo "❌ Erro ao conectar: " . $e->getMessage();
}




try {
    $pdo = Connection::getConnection();

    // Nome do banco de dados (verifique no Aiven)
    $dbname = 'defaultdb';

    // Desativa checagens de chave estrangeira
    $pdo->exec("SET FOREIGN_KEY_CHECKS = 0;");

    // Pega todas as tabelas
    $stmt = $pdo->query("SHOW TABLES FROM $dbname;");
    $tables = $stmt->fetchAll(PDO::FETCH_COLUMN);

    foreach ($tables as $table) {
        $pdo->exec("DROP TABLE IF EXISTS `$table`;");
    }

    // Reativa checagens
    $pdo->exec("SET FOREIGN_KEY_CHECKS = 1;");

    echo "✅ Todas as tabelas foram deletadas com sucesso!";
} catch (PDOException $e) {
    echo "❌ Erro ao limpar o banco: " . $e->getMessage();
}
