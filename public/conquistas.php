<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CereMath - Conquistas</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="conquistas.css">
</head>

<body>
    
    <?php require_once './components/header.php';
    require_once 'components/footer.php';
    require_once 'components/fonts.php'; ?>

    <!-- Conteúdo -->
    <div class="content">
        <h1>🏆 Suas Conquistas:</h1>

        <div class="filters">
            <a href="" id="1-bt" class="active">📋 Todos</a>
            <a href="#concluido" id="2-bt">✅ Concluídas</a>
            <a href="#incompleto" id="3-bt">❌ Não Concluídas</a>
        </div>

        <?php
        include "./components/conquista-load.php";
        ?>
    </div>
    <script src="./js/conquista.js"></script>
</body>

</html>