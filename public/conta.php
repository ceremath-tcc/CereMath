<?php
session_start();

require_once("./account/contaManager.php ");

$labels  = array_column($progresso, 'conceito');
$acertos = array_column($progresso, 'acertos');
$erros   = array_column($progresso, 'erros');
?>
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
<?php include 'components/header.php'; include 'components /fonts.php'; require_once './account/login-allowed.php';  require_once './components/footer.php'; ?>

  <div class="container-conta">

    <div class="card">
      <div class="title type-2"><span class="emoji">🧑‍💼</span> Informações da conta:</div>
      <div class="row">
        <div class="tag type-1">#<?php echo $_SESSION['id'];?> - <?php echo $_SESSION['username'];?></div>
        <div class="tag type-1">[<?php if(isset($_SESSION['email'])){ echo $_SESSION['email'];} else { echo "Não tem email";}?>]</div>
        <div class="tag type-1">[*********]</div>
      </div>
      <div class="divider"></div>
      <div class="actions">
        <a class="btn-conta btn-roxo type-2" href="conquistas.php">🏆 Minhas Conquistas</a>
        <a class="btn-conta btn-sair type-2" href="logout.php">🔒 Sair da Conta</a>
      </div>
    </div>
    <br>
    <hr>
    <br>
    <div class="card">
      <div style="display:flex; align-items:center; gap:10px; flex-wrap:wrap;">
        <h2 class="type-2">✅ Meu Progresso (%)</h2>
        <div class="legend">
          <span class="type-1"><span class="dot" style="background: var(--verde);"></span> Acertos</span>
          <span class="type-1"><span class="dot" style="background: var(--vermelho);"></span> Erros</span>
        </div>
      </div>
      <div class="chart-area">
        <canvas id="grafico" height="180"></canvas>
      </div>
    </div>

  </div>

  <!-- Chart.js -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
    const labels  = <?= json_encode($labels, JSON_UNESCAPED_UNICODE) ?>;
    const acertos = <?= json_encode($acertos) ?>;
    const erros   = <?= json_encode($erros) ?>;

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
  </script>
</body>
</html>
