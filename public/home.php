<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Página Inicial</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="home.css?type=1">

</head>
<body>
<?php require_once './components/header.php'; require_once './components/footer.php'; require_once './components/fonts.php'; require_once './components/frase.php'; ?>

  <div class="container-home">
    <h1 class="h1-home type-2 ">Seja bem-vindo novamente, <span style="color:#000;"><?php if(isset($_SESSION['username'])){ echo $_SESSION['username'];} else { echo "Visitante"; } ?>.</php></span></h1><br>

    <div class="cards">
      <div class="card">
        <h2 class="card-title type-2">Fatos do dia:</h2>
        <br>
          <h3 class="fonte type-1">"<?php
            echo $_SESSION['frases'];
          ?>"</h3><br>
          <h3 class="autor type-2">- <?php
            echo $frases[$_SESSION['frases']];
          ?></h3>
      </div>

     
      <div class="card status">
        <h2 class="card-title type-2">🔥 Dias seguidos fazendo missão</h2>
        <br>
        <p class="error type-1">❌ [missão diária 1]</p>
        <p class="error type-1">❌ [missão diária 2]</p>
        <p class="error type-1">❌ [missão diária 3]</p>
      </div>
        
    </div>
  </div>
</body>
</html>