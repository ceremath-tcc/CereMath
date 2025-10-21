<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CereMath • Materiais</title>

  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
  <link rel="stylesheet" href="style.css">
</head>

<body>

  <?php require_once './components/header.php';
  require_once 'components/footer.php';
  require_once 'components/fonts.php';
  require './components/conquista-check.php' ?>

  <div class="main-mat">
    <h1 class="type-2">📚 Materiais de Estudo</h1>

    <!-- Container do Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">

        <!--Responsavel por carregar todos os materiais (42 em total)-->
        <?php
        $dir = "materiais/"; // Pasta onde estão os arquivos
        
        // Pega lista de arquivos, ignorando "." e ".."
        $files = array_diff(scandir($dir), array('.', '..'));

        // Filtra apenas arquivos com extensão .pdf
        $pdfs = array_values(array_filter($files, function ($file) use ($dir) {
          return pathinfo($file, PATHINFO_EXTENSION) === "pdf";
        }));
        

        // Verifica se há PDFs
        if (count($pdfs) > 0) {
          foreach ($pdfs as $pdfFile) {
            $nomeSemExtensao = pathinfo($pdfFile, PATHINFO_FILENAME);
            $pdfPath = $dir . $pdfFile;
            echo "<div class='swiper-slide'>
                  <h2 class='type-2'>" . $nomeSemExtensao . "</h2>
                  <iframe src='$pdfPath#toolbar=0'></iframe>
                  <a href='" . $pdfPath . "' class='type-2' download>⬇ Baixar PDF</a>
                </div>";

          }
        } else {
          echo "Nenhum PDF encontrado na pasta.";
        }

        ?>

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