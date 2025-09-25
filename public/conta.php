<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Minha Conta • Progresso</title>
  <link rel="stylesheet" href="conta.css">
  <link rel="stylesheet" href="style.css">

</head>

<body>
  <?php include 'components/header.php';
  require_once("./account/contaManager.php ");
  //Agora vai guardar o progresso do usuario dentro da array $progresso
  $progresso = $controllerC->showProgressao($_SESSION['id']);

  $labels = array_column($progresso, 'materia');
  $acertos = array_column($progresso, 'total_acertos');
  $erros = array_column($progresso, 'total_erros');
  $labelsFiltrados = [];
  $acertosFiltrados = [];
  $errosFiltrados = [];

  foreach ($progresso as $row) {
    if ($row['total_acertos'] > 0 || $row['total_erros'] > 0) {
      $labelsFiltrados[] = $row['materia'];
      $acertosFiltrados[] = $row['total_acertos'];
      $errosFiltrados[] = $row['total_erros'];
    }
  }

  include 'components /fonts.php';
  require_once './account/login-allowed.php';
  require_once './components/footer.php'; ?>
  <div class="back" id="back"></div>
  <div class="modal" id="modal">
    <div class="flex">
      <h2 class="type-2">Confirme sua identidade</h2>
      <button class="exit" id="exit">X</button>
    </div>
      <br>
      <div class="divider"></div><br>
      <form action="" method="POST">
        <br><br>
        <label for="password" class="type-1">Digite sua senha</label>
        <input type="password" id="password" name="password" placeholder="Senha..."><br><br><br><br>
        <br>
        <div class="divider"></div><br>
        <input type="submit" value="Verificar">
      </form>
  </div>

  <div class="container-conta">
  
    <div class="card">
      <div class="title type-2"><span class="emoji">🧑‍💼</span> Informações da conta:</div>
      <a class="sub type-2" id="mudar">-- Desejo mudar minhas informações</a>
      <br><br>
      <div class="row">
        <div class="tag type-1" id="user">#<?php echo $_SESSION['id']; ?> - Usuario, <?php echo $_SESSION['username']; ?></div>
        <div class="tag type-1" id="email">
          <?php if (isset($_SESSION['email'])) {
            echo "E-mail: " . $_SESSION['email'];
          } else {
            echo "Não tem email";
          } ?>
        </div>
        <div class="tag type-1">Senha: ************</div>
      </div>
      <div class="divider"></div>
      <div class="actions">
        <a class="btn-conta btn-roxo type-2" href="conquistas.php">🏆 Minhas Conquistas</a>
        <a class="btn-conta btn-sair type-2" href="logout.php">🔒 Sair da Conta</a>
      </div>
    </div>
    <br>
    <div class="divider"></div>
    <br>
    <div class="card">
      <div style="display:flex; align-items:center; gap:10px; flex-wrap:wrap;">
        <h2 class="type-2">✅ Meu Progresso (%)</h2>
        <div class="legend">
          <span class="type-1"><span class="dot" style="background: var(--verde);"></span> Acertos</span>
          <span class="type-1"><span class="dot" style="background: var(--vermelho);"></span> Erros</span>
        </div>
      </div>
      <div class="chart-area" id="chart-area">
        <canvas id="grafico" height="180"></canvas>
      </div>
    </div>

  </div>

  <!-- Chart.js -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="./js/conta.js"></script>
  <script>
    
    const labels = <?= json_encode($labelsFiltrados, JSON_UNESCAPED_UNICODE) ?>;
    const acertos = <?= json_encode($acertosFiltrados) ?>;
    const erros = <?= json_encode($errosFiltrados) ?>;

    if (labels.length === 0) {
      document.getElementById("chart-area").innerHTML = "<br><p class='type-1 warning'>Nenhum acerto... por enquanto</p>";
    } else {
      const ctx = document.getElementById('grafico').getContext('2d');

      new Chart(ctx, {
        type: 'bar',
        data: {
          labels,
          datasets: [
            {
              label: 'Acertos',
              data: acertos,
              backgroundColor: getComputedStyle(document.documentElement).getPropertyValue('--verde').trim(),
              borderRadius: 6,
              maxBarThickness: 56,
            },
            {
              label: 'Erros',
              data: erros,
              backgroundColor: getComputedStyle(document.documentElement).getPropertyValue('--vermelho').trim(),
              borderRadius: 6,
              maxBarThickness: 56,
            }
          ]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          plugins: {
            legend: { display: false },
            tooltip: { mode: 'index', intersect: false }
          },
          scales: {
            x: { grid: { display: false } },
            y: {
              beginAtZero: true,
              max: 100,
              ticks: { stepSize: 20 },
              grid: { color: 'rgba(0,0,0,.06)' }
            }
          }
        }
      });
    }
  </script>
</body>

</html>