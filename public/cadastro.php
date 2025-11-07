<?php
require_once './account/login-prohibited.php'
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="login-cadastro.css">
</head>

<body>
    <?php require_once './components/fonts.php'; ?>
    <div class="container">

    <canvas id="background"></canvas>
    <div class="inclinado">
    <a href="home.php"> <h1 class="title type-2" id="logo1">CereMath</h1></a>
        <h1 class="message type-2" id="login">Faça seu cadastro</h1>
        <hr>
            <div class="login-container">
                <br>
                <form action="account/exec_cadastro.php" method="POST">
                    <br>
                    <h1 class="message type-2" >Seja bem vindo! </h1>
                    <br><br>
                    <label for="username" class="text type-2">Nome de Usuário:</label>
                    <input type="text" id="username" name="username" placeholder="Insira seu usurário" minlength="3">
                    <br><br>
                    <label for="email" class="text type-2">Email:</label>
                    <input type="email" id="email" name="email" placeholder="Insira o E-mail: ceremath.tcc@gmail.com" minlength="3">
                    <br><br>
                    <label for="username" class="text type-2">Sua Senha:</label>
                    <input type="password" id="password" name="password" placeholder="Insira sua senha" minlength="8">
                    <?php
                        if (isset($_GET['error']) && $_GET['error'] == '2') {
                            echo '<br><p style="color: red;">Usuário ou senha inválidos. Tente novamente.</p>';
                        }
                    ?>
                    <br><br>
                    <p class="sub-text type-1">Já tem conta? <a id="criar-conta" href="login.php">Fazer Login.</a></p>
                    <br>    
                    <input type="submit" class="submit type-2"value="Entrar"> 

                </form>

            </div>
        </div>
    </div>

</body>

</html>
