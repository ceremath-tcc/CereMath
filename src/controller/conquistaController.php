<?php
// src/controllers/ProductController.php

require_once __DIR__ . '/../model/login.php';

class ConquistaController
{
    public function checkConquista($user)
    {
        $db = Connection::getConnection();

        // Busca o usuário
        $stmt = $db->prepare("
            SELECT 
            c.id AS id_conquista,
            c.nome AS nome_conquista,
            c.Descricao AS descricao_conquista,
            raridade AS raridade,
            CASE 
                WHEN uc.concluido = 1 THEN 'Concluída'
                ELSE 'Não concluída'
            END AS status_conquista
            FROM Conquista c
            LEFT JOIN user_Conquista uc 
                ON uc.id_conquista = c.id AND uc.id_user = ?;
        ");

        $stmt->execute([$user]);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $result;
    }




    public function showConquista()
{
    $db = Connection::getConnection();

    $stmt = $db->prepare(" 
        SELECT 
            id AS id_conquista,
            nome AS nome_conquista,
            descricao AS descricao_conquista,
            raridade 
        FROM Conquista
    ");

    $stmt->execute(); // ← FALTAVA ISSO!

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}



    public function addProgressao($id)
    {
        $db = Connection::getConnection();

        // Verifica se já existe
        for ($i = 1; $i < 22; $i++) {
            $stmt = $db->prepare("INSERT INTO user_Conquista (id_user, id_conquista) VALUES (?, $i);");
            $stmt->execute([$id]);
        }

    }
}