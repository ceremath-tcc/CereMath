<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CereMath • Materiais</title>
  
  <link rel="stylesheet" href="style.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
</head>
<body>
 
<?php require_once './components/header.php'; require_once 'components/footer.php'; require_once 'components/fonts.php'; ?>
 
<div class="main-mat">
  <h1 class="type-2">📚 Materiais de Estudo</h1>
 
  <!-- Container do Swiper -->
  <div class="swiper mySwiper">
    <div class="swiper-wrapper">
 
      <!-- Slide 1 -->
      <div class="swiper-slide">
        <h2 class="type-2">Conjuntos</h2>
        <iframe src="materiais/1bi_conjuntos.pdf"></iframe>
        <a href="materiais/1bi_conjuntos.pdf" class="type-2" download>⬇ Baixar PDF</a>
      </div>
 
      <!-- Slide 2 -->
      <div class="swiper-slide">
        <h2 class="type-2">Lista de Exercícios</h2>
        <iframe src="materiais/1bi_conjuntos2.pdf"></iframe>
        <a href="materiais/1bi_conjuntos2.pdf" class="type-2" download>⬇ Baixar PDF</a>
      </div>
 
      <!-- Slide 3 -->
      <div class="swiper-slide">
        <h2 class="type-2">Funções</h2>
        <iframe src="materiais/funcoes.pdf"></iframe>
        <a href="materiais/funcoes.pdf" class="type-2" download>⬇ Baixar PDF</a>
      </div>
 
      <!-- Slide extra -->
      <div class="swiper-slide">
        <h2 class="type-2">Equações</h2>
        <iframe src="materiais/equacoes.pdf"></iframe>
        <a href="materiais/equacoes.pdf" class="type-2" download>⬇ Baixar PDF</a>
      </div>

      <!-- Slide extra -->
      <div class="swiper-slide">
        <h2 class="type-2">Outros</h2>
        <iframe src="materiais/equacoes.pdf"></iframe>
        <a href="materiais/outros.pdf" class="type-2" download>⬇ Baixar PDF</a>
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
  var swiper = new Swiper(".mySwiper", {
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
<link rel="stylesheet" href="material.css">
</body>
</html>