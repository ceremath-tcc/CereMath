const perguntas = [];


//Pega o id da materia
const params = new URLSearchParams(window.location.search);

// Acessa os parâmetros
const qtd = params.get('materia');               // "5" (string)

// Guarda aqui
const qtdNum = parseInt(qtd, 10);



// Exemplo em arquivo script.js
fetch(`components/load-questoes.php?qtd=7&materia=${qtdNum}`)  // ou o caminho correto do seu PHP
  .then(response => response.json())
  .then(data => {

    //Mostra se a variavel data veio errado
    console.error("Data: ", data);
      
    
    //Para todas as questoes ele vai inserir na array perguntas
    data.forEach((q) => {

      //Da um push desse jeito, (eles permanecem na posição 1 por conveniencia)
      perguntas.push({
        enunciado: q.enunciado_gerado,
        alternativas: [q.alternativas.alt_c, q.alternativas.alt_2],
        correta: 0
      });

      console.log(q.id_pergunta + ", " + q.id_variavel)

    });

    embaralhar(perguntas);
    carregarPergunta();

  })
  .catch(error => console.error("Erro: ", error);

// Função para embaralhar um array (Fisher-Yates)
function embaralhar(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
}

let respostas = document.querySelectorAll(".resposta");
let checarBtn = document.getElementById("checar");
let caixaFeedback = document.getElementById("caixa-feedback");
let mensagem = document.getElementById("mensagem");
let proximoBtn = document.getElementById("proximo");
let finalBtn = document.getElementById("finalizar");
let returnBtn = document.getElementById("return");
let pontos = 0;
let vidas = 2;
let respostaSelecionada = null;
let perguntaAtual = 0;

function carregarPergunta() {
  let q = perguntas[perguntaAtual];

  document.getElementById("pergunta").textContent = q.enunciado;

  const respostasDivs = document.querySelectorAll(".resposta");

  // Primeiro, esconder todas as divs
  respostasDivs.forEach(div => {
    div.style.display = "none";
  });

  // Pegar só as alternativas da questão
  let alternativas = [...q.alternativas];

  // Embaralhar essas alternativas
  embaralhar(alternativas);

  // Mostrar apenas as divs necessárias e preencher o texto
  alternativas.forEach((alt, i) => {
    if (respostasDivs[i]) {
      respostasDivs[i].textContent = alt;
      respostasDivs[i].style.display = "flex";
      respostasDivs[i].classList.remove("selecionada");
    }
  });

  // Salvar a resposta correta original (texto)
  let respostaCorretaTexto = q.alternativas[q.correta];
  checarBtn.dataset.respostaCorreta = respostaCorretaTexto;

  // Reset
  respostaSelecionada = null;
  caixaFeedback.style.display = "none";
  proximoBtn.style.display = "none";
  finalBtn.style.display = "none";
  returnBtn.style.display = "none";
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
      returnBtn.style.display = "block";
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
  // Da um fetch em conclude.php
  fetch('conclude.php', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({
      id_conceito: qtdNum,
      acertos: pontos/10,
      erros: (70 - pontos)/10
    })
  })
  .catch(err => console.error('Erro ao atualizar progresso:', err));
  window.location.href = 'home.php';
});

returnBtn.addEventListener("click", () => {
   // Leva devolta para a tela inicial
  window.location.href = 'home.php';
});

