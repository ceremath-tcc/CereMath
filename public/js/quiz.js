
const perguntas = [
  { enunciado: "Quanto é 5 + 3?", alternativas: ["6", "7", "8", "9"], correta: 2 },
  { enunciado: "Quanto é 10 - 4?", alternativas: ["5", "6", "7", "8"], correta: 1 },
  { enunciado: "Quanto é 7 x 2?", alternativas: ["12", "14", "16", "18"], correta: 1 },
  { enunciado: "Quanto é 20 ÷ 5?", alternativas: ["2", "3", "4", "5"], correta: 2 }
];

// Função para embaralhar um array (Fisher-Yates)
function embaralhar(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
}

// Embaralhar as perguntas ao iniciar
embaralhar(perguntas);

let respostas = document.querySelectorAll(".resposta");
let checarBtn = document.getElementById("checar");
let caixaFeedback = document.getElementById("caixa-feedback");
let mensagem = document.getElementById("mensagem");
let proximoBtn = document.getElementById("proximo");
let finalBtn = document.getElementById("finalizar");
let pontos = 0;
let vidas = 2;
let respostaSelecionada = null;
let perguntaAtual = 0;

function carregarPergunta() {
  let q = perguntas[perguntaAtual];
  document.getElementById("pergunta").textContent = q.enunciado;

  // Embaralhar alternativas
  let alternativasEmbaralhadas = [...q.alternativas];
  embaralhar(alternativasEmbaralhadas);

  // Salvar a resposta correta original (texto)
  let respostaCorretaTexto = q.alternativas[q.correta];

  respostas.forEach((r, i) => {
    r.textContent = alternativasEmbaralhadas[i];
    r.classList.remove("selecionada");
  });

  // Salvar resposta correta atual para checagem depois
  checarBtn.dataset.respostaCorreta = respostaCorretaTexto;

  respostaSelecionada = null;
  caixaFeedback.style.display = "none";
  proximoBtn.style.display = "none";
  finalBtn.style.display = "none";
  checarBtn.disabled = false;
  atualizarProgresso();
}

function atualizarProgresso() {
  let progresso = (perguntaAtual / perguntas.length) * 100;
  document.getElementById("progress-bar").style.width = progresso + "%";
}

respostas.forEach(r => {
  r.addEventListener("click", () => {
    respostas.forEach(r => r.classList.remove("selecionada"));
    r.classList.add("selecionada");
    respostaSelecionada = r;
  });
});

checarBtn.addEventListener("click", () => {
  if (!respostaSelecionada) {
    mensagem.textContent = "⚠️ Selecione uma resposta!";
    caixaFeedback.style.display = "block";
    proximoBtn.style.display = "none";
    return;
  }

  caixaFeedback.style.display = "block";

  // Verifica se a resposta selecionada é a correta (comparando texto)
  const respostaTexto = respostaSelecionada.textContent;
  const respostaCorreta = checarBtn.dataset.respostaCorreta;

  if (respostaTexto === respostaCorreta) {
    mensagem.textContent = "✅ Você Acertou! +10 pontos";
    pontos += 10;
    document.getElementById("pontos").textContent = pontos;
  } else {
    mensagem.textContent = "❌ Você Errou! -10 pontos";
    pontos = Math.max(0, pontos - 10);
    document.getElementById("pontos").textContent = pontos;

    vidas--;
    document.querySelector(".vidas").textContent =
      vidas === 2 ? "❤️❤️" : vidas === 1 ? "❤️" : "💀";

    if (vidas <= 0) {
      mensagem.textContent = "☠️ Fim de jogo! 😢";
      checarBtn.disabled = true;
      proximoBtn.style.display = "none";
      return;
    }
  }

  proximoBtn.style.display = "inline-block";
  checarBtn.disabled = true;
});

proximoBtn.addEventListener("click", () => {
  perguntaAtual++;
  if (perguntaAtual < perguntas.length) {
    carregarPergunta();
  } else {
    mensagem.textContent = "🎉 Parabéns! Você concluiu o quiz!";
    proximoBtn.style.display = "none";
    checarBtn.style.display = "none";
    document.getElementById("progress-bar").style.width = "100%";
    finalBtn.style.display = "block";
  }
});

finalBtn.addEventListener("click", () => {
  // Altere para o caminho da sua página principal
  window.location.href = "home.php";
});

carregarPergunta();