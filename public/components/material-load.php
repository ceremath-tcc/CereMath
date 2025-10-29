<?php
require __DIR__ . '/../../src/controller/conceitoController.php';
$controller = new ConceitoController();

$progresso = $controller->showPorcentagem($_SESSION['id']);
$conceitos = $controller->checkConceito($_SESSION['id']);
$contProgresso = 0;


for ($i = 0; $i < count($conceitos); $i++) {
  if ($i == 0) {
    echo "<div class='swiper-slide'>
                <div class='top'>
                    <h1 class='type-2'>" . $contProgresso+1 . " - " . $conceitos[0]["materia"] . "</h1>
                    <h2 class='type-2'> Progresso: " . $progresso[$contProgresso]['porcentagem_concluidos'] ."%</h2>
                    
                </div>
                <div class='line'></div>
                <ul>
                    <li class='type-1 ";
                    if($conceitos[0]["concluido"] == 0 || $conceitos[0]["concluido"] == 1){echo "emAndamento'><a class='emAndamento' href='ia.php?titulo=" . $conceitos[0]["id"] . "' >" . $conceitos[0]["nome"] . "</a>"; } else { echo "feito'><a class='feito' href='ia.php?titulo=" . $conceitos[0]["id"] . "' >" . $conceitos[$i]["nome"] . "</a>"; };
                    echo  "</li>";
                    $contProgresso +=1;
  } else {
    if ($conceitos[$i - 1]["materia"] != $conceitos[$i]["materia"]) {
      echo "  </ul>
            </div>
            <div class='swiper-slide'>
                <div class='top'>
                    <h1 class='type-2'>" . $contProgresso+1 . " - " . $conceitos[$i]["materia"] . "</h1>
                    <h2 class='type-2'> Progresso: " . $progresso[$contProgresso]['porcentagem_concluidos'] ."%</h2>
                </div>
                <div class='line'></div>
                <ul>
                    <li class='type-1 "; 
                    if($conceitos[$i]["concluido"] == 0){echo "emAndamento'><a class='emAndamento' href='ia.php?titulo=" . $conceitos[$i]["id"] . "' >" . $conceitos[$i]["nome"] . "</a>"; } else { echo "feito'><a class='feito' href='ia.php?titulo=" . $conceitos[$i]["id"] . "' >" . $conceitos[$i]["nome"] . "</a>"; };
                    echo  "</li>";
                    $contProgresso +=1 ;
    } else {
      echo "<li class='type-1 ";
      if($conceitos[$i]["concluido"] == 1){echo "emAndamento'><a class='emAndamento' href='ia.php?titulo=" . $conceitos[$i]["id"] . "' >" . $conceitos[$i]["nome"] . "</a>"; } elseif($conceitos[$i]["concluido"] == 0) { echo "naoFeito'>" . $conceitos[$i]["nome"];} else { echo "feito'><a class='feito' href='ia.php?titulo=" . $conceitos[$i]["id"] . "' >" . $conceitos[$i]["nome"] . "</a>"; };
      echo "</li>";
    }
  }
}

unset($controller);