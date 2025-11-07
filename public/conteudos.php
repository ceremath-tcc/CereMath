<?php
    session_start();
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Conteudos • Lições</title>

  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
  <link rel="stylesheet" href="notificacao.css">
</head>

<body>
  <?php require_once 'components/header.php';
  require_once 'components/fonts.php';
  require_once './components/footer.php';
  require_once './account/login-allowed.php';
  require './components/conquista-check.php'
    ?>
  <div id="award-container" class="award-container"></div>
  <div class="main-mat">
    <h1 class="type-2 conteudo-title">📝 Conteudos e Lições</h1>

    <!-- Container do Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">

        <!-- Carrega os materiais -->
        <?php
        include "components/material-load.php"
          ?>

      </div>
    </div>

    <!-- Botões de navegação -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>

    <!-- Bolinhas de paginação -->
    <div class="swiper-pagination"></div>
  </div>
  </div>

  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
  <script>
    const swiper = new Swiper(".mySwiper", {
      slidesPerView: 3,       // quantos slides aparecem ao mesmo tempo
      spaceBetween: 30,       // espaço entre eles
      loop: true,             // carrossel infinito
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      breakpoints: {
        0: { slidesPerView: 1 },   // mobile
        768: { slidesPerView: 2 }, // tablet
        1024: { slidesPerView: 3 } // PC
      }
    });
  </script>
  <link rel="stylesheet" href="conteudos.css">

</body>

</html>
