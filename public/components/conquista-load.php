<?php
require __DIR__ . '/../../src/controller/conquistaController.php';
$controller = new ConquistaController();

if (isset($_SESSION['id'])) {
  $progresso = $controller->checkConquista($_SESSION['id']);
} else {
  $progresso = $controller->showConquista();
}

for ($i = 0; $i < 10; $i++) {
  echo "<div class='achievement";
  if (isset($progresso[$i]['status_conquista'])) {
    if ($progresso[$i]['status_conquista'] != 'Concluída') {
      echo " locked'>";
    } else {
      echo "'>";
    }
  } else {
    echo " locked'>";
  }
  echo "<div class='icon'>🏅</div>
            <div>
                <strong>" . $progresso[$i]['nome_conquista'] . " – " . $progresso[$i]['raridade'] . "</strong><br>
                <small>" . $progresso[$i]['descricao_conquista'] . "</small>
            </div>
        </div>";
}
 
unset($controller);