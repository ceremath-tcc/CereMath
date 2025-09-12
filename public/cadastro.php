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
    <?php require_once './components/fonts.php'; require_once './account/login-prohibited.php' ?>
    <div class="container">

    <canvas id="background"></canvas>
    <div class="inclinado">
    <a href="home.php"> <h1 class="title type-2" id="logo">CereMath</h1></a>
        <h1 class="message type-2" id="login">Faça seu cadastro</h1>
        <hr>
            <div class="login-container">
                <br>
               <form action="account/exec_cadastro.php" method="POST">
                    <br>
                    <h1 class="message type-2" >Seja bem-vindo!</h1>
                    <br><br>
                    <label for="username" class="text type-2">Nome de Usuário ou Email:</label>
                    <input type="text" id="username" name="username" placeholder="Digite seu Usuário ou Email" minlength="3" required>
                    <br><br><br><br><br>
                    <label for="username" class="text type-2">Sua Senha:</label>
                    <input type="password" id="password" name="password" placeholder="Insira uma Senha" minlength="8" required>
                    <br><br><br>
                    <p class="sub-text type-1">Já tem uma conta? <a id="criar-conta" href="login.php">Fazer Login</a>
                    <?php
                        if (isset($_GET['error']) && $_GET['error'] == '1') {
                            echo '<br><p style="color: red;">Usuario ja existe, tente novamente.</p>';
                        }
                    ?>
                    <input type="submit" class="submit" value="Cadastrar Login"> 
                </form>

            </div>
        </div>
    </div>

    <script src="./js/background.js"></script>
</body>

</html>