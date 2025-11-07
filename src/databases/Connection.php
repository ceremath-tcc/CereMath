<?php
// src/database/Connection.php

class Connection
{
    private static $instance = null;

    public static function getConnection()
    {
        if (self::$instance === null) {
            $config = require __DIR__ . '/../../config/config.php';
            
            $dsn = "mysql:host={$config['host']};port={$config['port']};dbname={$config['dbname']};charset=utf8mb4";

            try {
                self::$instance = new PDO(
                    $dsn,
                    $config['user'],
                    $config['pass'],
                    [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
                );
            } catch (PDOException $e) {
                die("❌ Erro ao conectar ao banco: " . $e->getMessage());
            }
        }

        return self::$instance;
    }
}
