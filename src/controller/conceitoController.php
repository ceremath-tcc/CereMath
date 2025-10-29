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
                c.id,   
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
        $stmt = $db->prepare('SELECT uc.id_user, 
            c.materia, 
            SUM(uc.acertos) AS total_acertos, 
            SUM(uc.erros) AS total_erros, 
            COUNT(*) AS total_conceitos, 
            SUM(uc.concluido) AS conceitos_concluidos
        FROM 
            user_Conceito uc
        JOIN 
            Conceito c ON uc.id_conceito = c.id
        WHERE 
            uc.id_user = ?
        GROUP BY 
            uc.id_user, c.materia;
        ');
        $stmt->execute([$id]);
        $progresso = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $progresso;
    }

    public function showPorcentagem($id)
    {
        $db = Connection::getConnection();

        // Verifica se já existe
        $stmt = $db->prepare('SELECT uc.id_user,
            c.materia,
            COUNT(*) AS total_conceitos,
            SUM(CASE WHEN uc.concluido = 2 THEN 1 ELSE 0 END) AS concluidos,
            ROUND(
                (SUM(CASE WHEN uc.concluido = 2 THEN 1 ELSE 0 END) / COUNT(*)) * 100,
            2) AS porcentagem_concluidos
        FROM 
            user_Conceito uc
        JOIN 
            Conceito c ON uc.id_conceito = c.id
        WHERE 
            uc.id_user = ?
        GROUP BY 
            uc.id_user, c.materia;
        ');
        $stmt->execute([$id]);
        $progresso = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $progresso;
    }

    //Responsavel por passar de materia
    public function setConceito($idUser, $idConceito, $acertos, $erros){
        $db = Connection::getConnection();

        // Atualiza o conceito atual como concluído e registra acertos/erros
        $stmt = $db->prepare("
            UPDATE user_Conceito
            SET 
                acertos = acertos + :acertos,
                erros = erros + :erros,
                concluido = 2,
                atualizado_em = CURRENT_TIMESTAMP
            WHERE id_user = :id_user
              AND id_conceito = :id_conceito
        ");

        $stmt->execute([
            ':acertos' => $acertos,
            ':erros' => $erros,
            ':id_user' => $idUser,
            ':id_conceito' => $idConceito
        ]);


        // 2️⃣ Atualiza o próximo conceito como "em andamento" (1)
        $stmt2 = $db->prepare("
            UPDATE user_Conceito
            SET concluido = 1,
                atualizado_em = CURRENT_TIMESTAMP
            WHERE id_user = :id_user
              AND id_conceito = :proximo
        ");

        $stmt2->execute([
            ':id_user' => $idUser,
            ':proximo' => $idConceito + 1
        ]);
    }
    
}