<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>CereBrino</title>

    <!-- Exemplo de uso das fontes no CSS -->
    <style>
        body {
            font-family: 'DM Sans', sans-serif;
        }
        .logo h1 {
            font-family: 'Arimo', sans-serif; 
        }

        .objetivos {
            margin-top: 15px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-left: 20px;
        }

        .objetivos .item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 30px;
            color: #2c3e50;
        }

        .objetivos .icone {
            font-size: 22px; /* tamanho dos ícones */
        }

        .objetivos .texto {
            font-weight: bold;
        }
        
        
    </style>

</head>
<body>
    <?php require_once 'fonts.php'; ?>
    <div class="sidebar"><br>
        <div class="logo">
        <a href="home.php" id="logo1"><h1>CereMath</h1></a>
    </div>

        <div>
            <nav>
                <ul>
                    <a href="Conta.php"><i class="fas fa-user"></i> <strong>Conta</strong></a>
                    <br>
                    <a href="conquistas.php"><i class="fas fa-trophy"></i> <strong>Conquistas</strong></a>
                    <br>
                    <a href="material.php"><i class="fas fa-book-open"></i> <strong>Materiais</strong></a>
                 <br>
                    <a href="
                    <?php
                        if(isset($_SESSION['username'])){
                            echo 'conta.php';
                        } else {
                            echo 'login.php';
                        }
                    ?>
                    "><i class="fas fa-user"></i> <strong>
                    <?php
                        if(isset($_SESSION['username'])){
                            echo 'Conta';
                        } else {
                            echo 'Login';
                        }
                    ?>
                    
                    </strong></a>
                    <br>
                </ul>
            </nav>
        </div>
        <hr>
        <div class="objetivos">
    <div class="item">
        <span class="icone">📈</span>
        <span class="texto"><strong>Hoje:</strong></span>
    </div>
    <div class="item">
        <span class="icone">🎯</span>
        <span class="texto"><strong>Meta:</strong></span>
    </div>
</div>
    </div>
    

</body>
</html>
