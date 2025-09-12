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
 
    <?php require_once './components/header.php'; require_once 'components/footer.php'; require_once 'components/fonts.php'; ?>
 
    <!-- Conteúdo -->
    <div class="content">
        <h1>🏆 Suas Conquistas:</h1>
 
        <div class="filters">
            <a href="#" class="active">✅ Concluídas</a>
            <a href="#">❌ Não Concluídas</a>
            <a href="#">📋 Todos</a>
        </div>
 
        <div class="achievement">
            <div class="icon">🏅</div>
            <div>
                <strong>[Nome da Conquista] – [Raridade]</strong><br>
                <small>[Descrição da Conquista]</small>
            </div>
        </div>
 
        <div class="achievement locked">
            <div class="icon">🎯</div>
            <div>
                <strong>[Nome da Conquista] – [Raridade]</strong><br>
                <small>[Descrição da Conquista]</small>
            </div>
        </div>
 
        <div class="achievement locked">
            <div class="icon">📘</div>
            <div>
                <strong>[Nome da Conquista] – [Raridade]</strong><br>
                <small>[Descrição da Conquista]</small>
            </div>
        </div>
    </div>
 
</body>
</html>