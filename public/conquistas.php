<?php
    session_start();
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CereMath - Conquistas</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="conquistas.css">
    <link rel="stylesheet" href="notificacao.css">
</head>

<body>

    <?php require_once './components/header.php';
    require_once 'components/footer.php';
    require_once 'components/fonts.php';
    require './components/conquista-check.php'; ?>

    <div id="award-container" class="award-container"></div>
    <!-- Conteúdo -->
    <div class="content">
        <h1 class="type-2">🏆 Suas Conquistas:</h1>

        <div class="filters">
            <a href="" id="1-bt" class="active type-1">📋 Todos</a>
            <a href="#concluido" id="2-bt" class="type-1">✅ Concluídas</a>
            <a href="#incompleto" id="3-bt" class="type-1">❌ Não Concluídas</a>
        </div>

        <?php
        include "./components/conquista-load.php";
        ?>
    </div>
    <script src="./js/conquista.js"></script>
    
    <script src="./js/notificacao.js"></script>

</body>

</html>
