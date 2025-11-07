<?php
require_once __DIR__ . '/../src/databases/Connection.php';

try {
    $conn = Connection::getConnection();
    echo "✅ Conectado com sucesso!";
} catch (PDOException $e) {
    echo "❌ Erro ao conectar: " . $e->getMessage();
}
