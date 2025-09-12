<?php
// src/controllers/ProductController.php

require_once __DIR__ . '/../model/login.php';

class ConceitoController
{
    public function checkConceito($user)
    {
        $db = Connection::getConnection();

        // Busca o usuário
        $stmt = $db->prepare("
            SELECT 
                c.nome, 
                c.materia, 
                COALESCE(uc.concluido, 0) AS concluido
            FROM Conceito c
            LEFT JOIN user_Conceito uc
                ON c.id = uc.id_conceito AND uc.id_user = ?
            ORDER BY c.materia
        ");

        $stmt->execute([$user]);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $result;
    }




    public function addProgressao($id)
    {
        $db = Connection::getConnection();

        // Verifica se já existe
        for ($i = 1; $i < 41; $i++) {
            $stmt = $db->prepare("INSERT INTO user_Conceito (id_user, id_conceito) VALUES (?, $i);");
            $stmt->execute([$id]);
        }

    }

    public function showProgressao($id)
    {
        $db = Connection::getConnection();

        // Verifica se já existe
        $stmt = $db->prepare('SELECT uc.id_user, c.nome AS conceito, uc.acertos, uc.erros, uc.concluido FROM 
    user_Conceito uc JOIN Conceito c ON uc.id_conceito = c.id
	WHERE 
    uc.id_user = ?');
        $stmt->execute([$id]);
        $progresso = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $progresso;
    }
}