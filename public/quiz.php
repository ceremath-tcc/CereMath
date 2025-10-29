<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quiz • Questionario</title>
  <link rel="stylesheet" href="quiz.css">
  <link rel="stylesheet" href="style.css">
</head>

<body>
    <?php
        require_once 'components/fonts.php';
    ?>

  <!-- Barra de progresso -->
  <div class="progress-container">
    <div class="progress-bar" id="progress-bar"></div>
  </div>

  <header>
    <div class="vidas">❤️❤️</div>
    <div class="pontuacaon type-2">Pontos: <span id="pontos">0</span></div>
  </header>

  <div class="conteudo">
    <div class="pergunta-area">
      <div class="mascote"><img src="./components/logo.png" width="100%"></div>
      <h2 id="pergunta" class="type-2">Quanto é 5 + 3?</h2>
    </div>

    <div class="respostas">
      <div class="resposta type-1">6</div>
      <div class="resposta type-1">7</div>
      <div class="resposta type-1">8</div>
      <div class="resposta type-1">9</div>
    </div>

    <button id="checar" class="type-2">Checar Resposta</button>

    <!-- Caixa de feedback -->
    <div class="caixa-feedback" id="caixa-feedback">
      <h3 class="type-2">Checar Resposta</h3>
      <p id="mensagem" class="type-2"></p>
      <button id="proximo" class="type-2">Próximo</button>
      <button id="finalizar" class="type-2">Finalizar</button>
      <button id="return" class="type-2">Voltar a página inicial</button>
    </div>
  </div>
  <script src="./js/quiz.js"></script>
</body>

</html>
