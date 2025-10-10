<?php
// src/controllers/ProductController.php

require_once __DIR__ . '/../model/login.php';

class QuestaoController
{
    public function checkEnunciado($id_materia)
    {
        $db = Connection::getConnection();

        // Busca a questao baseado na materia e o id
        $stmt = $db->prepare("
            SELECT 
                texto
            FROM
                perguntas
            WHERE
                materia_id = ?;
        ");

        $stmt->execute([$id_materia]);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $result;
    }




    public function checkVariaveis($id_pergunta)
    {
        $db = Connection::getConnection();

        $stmt = $db->prepare("
        SELECT valores
        FROM variaveis
        WHERE pergunta_id = ?;
    ");

        $stmt->execute([$id_pergunta]);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $result;
    }





    public function checkAlternativas($id_pergunta, $variaveis_id)
    {
        $db = Connection::getConnection();

        // Busca o valor baseado na materia e o id
        $stmt = $db->prepare("
            SELECT 
                opcoes
            FROM
                alternativas
            WHERE
                pergunta_id = ? and 
                variaveis_id = ?;
        ");

        $stmt->execute([$id_pergunta, $variaveis_id]);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $result[0];
    }
}