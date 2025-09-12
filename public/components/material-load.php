<?php
require __DIR__ . '/../../src/controller/conceitoController.php';
$controller = new ConceitoController();
$conceitos = $controller->checkConceito($_SESSION['id']);


for ($i = 0; $i < count($conceitos); $i++) {
  if ($i == 0) {
    echo "<div class='swiper-slide'>
                <div class='top'>
                    <h1 class='type-2'>" . $conceitos[0]["materia"] . "</h1>
                    <h2 class='type-2'>[BREVE DESCRIÇÃO]</h2>
                    <h2 class='type-2'>[PORCENTAGEM DE CONCLUSÃO]</h2>
                </div>
                <div class='line'></div>
                <ul>
                    <li class='type-1 ";
                    if($conceitos[0]["concluido"] == 0){echo "emAndamento'><a class='emAndamento' href='teste.php?titulo=" . $i+1 . "' >" . $conceitos[0]["nome"] . "</a>"; } else { echo "feito'>" . $conceitos[0]["nome"]; };
                    echo  "</li>";
  } else {
    if ($conceitos[$i - 1]["materia"] != $conceitos[$i]["materia"]) {
      echo "  </ul>
            </div>
            <div class='swiper-slide'>
                <div class='top'>
                    <h1 class='type-2'>" . $conceitos[$i]["materia"] . "</h1>
                    <h2 class='type-2'>[BREVE DESCRIÇÃO]</h2>
                    <h2 class='type-2'>[PORCENTAGEM DE CONCLUSÃO]</h2>
                </div>
                <div class='line'></div>
                <ul>
                    <li class='type-1 "; 
                    if($conceitos[$i]["concluido"] == 0){echo "emAndamento'><a class='emAndamento' href='teste.php?titulo=" . $i+1 . "' >" . $conceitos[$i]["nome"] . "</a>"; } else { echo "feito'>" . $conceitos[$i]["nome"]; };
                    echo  "</li>";
    } else {
      echo "<li class='type-1 ";
      if($conceitos[$i]["concluido"] == 1){echo "emAndamento'><a class='emAndamento' href='teste.php?titulo=" . $i+1 . "' >" . $conceitos[$i]["nome"] . "</a>"; } elseif($conceitos[$i]["concluido"] == 0) { echo "naoFeito'>" . $conceitos[$i]["nome"];} else { echo "feito'>" . $conceitos[$i]["nome"]; };
      echo "</li>";
    }
  }
}