<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Página Inicial</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="home.css?type=1">
<link rel="stylesheet" href="notificacao.css">

</head>
<body>

<?php require_once './components/header.php'; require_once './components/footer.php'; require_once './components/fonts.php'; require_once './components/frase.php'; require './components/conquista-check.php';  

?>
  <div id="award-container" class="award-container"></div>
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

     
      <!--
      <div class="card status">
        <h2 class="card-title type-2">🔥 Dias seguidos fazendo missão</h2>
        <br>
        <p class="error type-1">❌ [missão diária 1]</p>
        <p class="error type-1">❌ [missão diária 2]</p>
        <p class="error type-1">❌ [missão diária 3]</p>
      </div>
      -->
        
    </div>
  </div>
<br><br><br>
  <section class="sobre-projeto">
  <div class="container-sobre">
    <h2 class="titulo-sobre type-2">Sobre o Nosso Projeto</h2>
    <p class="intro-sobre type-1">
      Nosso projeto tem como objetivo transformar o aprendizado de matemática em algo mais acessível, 
      dinâmico e divertido para os alunos do ensino médio.
    </p>

    <div class="cards-sobre">
      <div class="card-sobre">
        <h3 class="card-sobre-title type-2">🎯 Missão</h3>
        <p class="card-sobre-text type-1">
          Oferecer uma plataforma intuitiva que incentive o estudo da matemática de forma prática e envolvente.
        </p>
      </div>
      
      <div class="card-sobre">
        <h3 class="card-sobre-title type-2">👁️ Visão</h3>
        <p class="card-sobre-text type-1">
          Ser referência em educação digital, aproximando tecnologia e conhecimento para todos.
        </p>
      </div>
      
      <div class="card-sobre">
        <h3 class="card-sobre-title type-2">💡 Valores</h3>
        <p class="card-sobre-text type-1">
          Inovação, acessibilidade e compromisso com a aprendizagem dos estudantes.
        
      
        </p>
      </div>
    </div>
  </div>

</section>
  <br><br><br><br>


</body>
</html>
