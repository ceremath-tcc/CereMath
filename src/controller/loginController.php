<?php
// src/controllers/ProductController.php

require_once __DIR__ . '/../model/login.php';
require_once __DIR__ . './conceitoController.php';


class UserController
{
    public function login($username, $password) {
        $db = Connection::getConnection();

        // Busca o usuário
        $stmt = $db->prepare("SELECT id, username, email, password FROM users WHERE username = ?");
        $stmt->execute([$username]);
        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

        // Verifica a senha
        if (!password_verify($password, $usuario['password'])) {
            header('location: login.php?error=2');
            exit;
        }

        return $usuario; // retorna os dados do usuário
    }




    public function signup($username, $password, $email){
        $db = Connection::getConnection();

        // Verifica se já existe
        $stmt = $db->prepare("SELECT id FROM users WHERE username = ?");
        $stmt->execute([$username]);
        if ($stmt->fetch()) {
            header('location: /../../public/cadastro.php?error=1');
            exit;
        }

        // Criptografa a senha
        $senha_hash = password_hash($password, PASSWORD_DEFAULT);

        // Inserindo dentro do banco de dados
        $stmt = $db->prepare("INSERT INTO users (username, password, email) VALUES (?, ?, ?)");
        $stmt->execute([$username, $senha_hash, $email]);

        //Guarda o id do usuario
        $log = $db->prepare("SELECT id, email FROM Users WHERE username = ?");
        $log->execute([$username]);
        $id = $log->fetch();
        $idUsuario = $id['id']; // pega só o número do ID

        //Inicia o controller conceito 
        $controller = new ConceitoController();

        //Coloca o progresso do usuario no banco de dados
        $controller->addProgressao($idUsuario);

        return $id;
    }

    public function checkUser($username) {
        $db = Connection::getConnection();

        // Verifica se já existe
        $stmt = $db->prepare("SELECT id FROM users WHERE username = ?");
        $stmt->execute([$username]);

        $user = $stmt->fetch();
        return $user["id"];
    }
}