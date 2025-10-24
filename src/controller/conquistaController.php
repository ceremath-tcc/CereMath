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


    //Adiciona o progresso padrão doas conquistas (Tudo como indefinida exceto a de criar uma conta)
    public function addProgressao($id)
    {
        $db = Connection::getConnection();

        // Verifica se já existe
        for ($i = 1; $i < 18; $i++) {
            if ($i == 1) {
                $stmt = $db->prepare("INSERT INTO user_Conquista (id_user, id_conquista, concluido) VALUES (?, $i,  1);");
            } else {
                $stmt = $db->prepare("INSERT INTO user_Conquista (id_user, id_conquista) VALUES (?, $i);");
             }
            $stmt->execute([$id]);
        }

    }


    //Responsavel por mudar o status de uma conquista
    public function ativarTrigger($usuario_id, $trigger_key)
    {
        $db = Connection::getConnection();

        // Verifica se a trigger está associada a alguma conquista
        $stmt = $db->prepare("SELECT id FROM Conquista WHERE trigger_key = ?");
        $stmt->execute([$trigger_key]);
        $conquista = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$conquista)
            return 0;

        // Verifica se o usuário já possui essa conquista
        $stmt = $db->prepare("SELECT * FROM user_Conquista WHERE id_user = ? AND id_conquista = ? AND concluido = 1");
        $stmt->execute([$usuario_id, $conquista['id']]);
        if ($stmt->rowCount() > 0)
            return 1; // já tem

        // Se não tiver, insere
        $stmt = $db->prepare("
            UPDATE user_Conquista 
            SET atualizado_em = NOW(),
            concluido = 1 
            WHERE id_user = ? AND id_conquista = ?
        ");
        $stmt->execute([$usuario_id, $conquista['id']]);


        // Opcional: retornar alguma mensagem para mostrar na tela
        return true;
    }
}