<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Página Inicial</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="home.css">

</head>
<body>
<?php session_start();  require_once './components/header.php'; require_once './components/footer.php'; require_once './components/fonts.php' ?>

  <div class="container-home">
    <h1 class="h1-home type-2 ">Seja bem-vindo novamente, <span style="color:#000;">[usuário]</span></h1><br>

    <div class="cards">
      <div class="card">
        <h2 class="card-title type-2">Fatos do dia:</h2>
        <br>
        <ul>
          <li class="type-1">[fato 1] Lorem ipsum dolor sit amet...</li>
          <li class="type-1">[fato 2] Lorem ipsum dolor sit amet...</li>
        </ul>
      </div>

     
      <div class="card status">
        <h2 class="card-title type-2">🔥 Dias seguidos fazendo missão</h2>
        <br>
        <?php
        echo $_SESSION['username'];
        echo $_SESSION['id'];
        ?>
        <p class="error type-1">❌ [missão diária 1]</p>
        <p class="error type-1">❌ [missão diária 2]</p>
        <p class="error type-1">❌ [missão diária 3]</p>
      </div>
        
    </div>
  </div>
</body>
</html>
