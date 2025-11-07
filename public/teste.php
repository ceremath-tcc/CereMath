<?php
require_once '../../src/database/Connection.php';

try {
    $conn = Connection::getConnection();
    echo "✅ Conectado com sucesso!<br>";

    $stmt = $conn->query("SHOW TABLES");
    $tables = $stmt->fetchAll(PDO::FETCH_COLUMN);

    if (empty($tables)) {
        echo "⚠️ Nenhuma tabela encontrada no banco de dados.<br>";
        echo "Você já rodou o script SQL no Aiven?";
    } else {
        echo "Tabelas encontradas:<br>";
        foreach ($tables as $table) {
            echo "- {$table}<br>";
        }
    }
} catch (PDOException $e) {
    echo "❌ Erro ao conectar ou consultar: " . $e->getMessage();
}
