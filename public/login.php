<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="login-cadastro.css">
</head>

<body>
    <?php require_once './components/fonts.php'; require_once './account/login-prohibited.php' ?>
    <div class="container">
       
        <canvas id="background"></canvas> 
        <div class="inclinado">
            <a href="home.php"> <h1 class="title type-2" id="logo1">CereMath</h1></a>
            <h1 class="message type-2" id="login">Faça seu Login</h1>
            <hr>
            <div class="login-container">
                <br>
                <form action="account/exec_login.php" method="POST">
                    <br>
                    <h1 class="message type-2" >Bem-vindo de volta! </h1>
                    <br><br>
                    <label for="username" class="text type-2">Nome de Usuário ou Email:</label>
                    <input type="text" id="username" name="username" placeholder="Insira seu usurário ou Email" minlength="3">
                    <br><br><br>
                    <label for="username" class="text type-2">Sua Senha:</label>
                    <input type="password" id="password" name="password" placeholder="Insira sua senha" minlength="8">
                    <?php
                        if (isset($_GET['error']) && $_GET['error'] == '2') {
                            echo '<br><p style="color: red;">Usuário ou senha inválidos. Tente novamente.</p>';
                        }
                    ?>
                    <br><br>
                    <p class="sub-text type-1">Não tem conta? <a id="criar-conta" href="cadastro.php">Criar conta.</a></p>
                    <br>    
                    <input type="submit" class="submit type-2"value="Entrar"> 

                </form>
            </div>
        </div>
    </div>
    <script src="./js/background.js"></script>
</body>

</html>