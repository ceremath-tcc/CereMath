// Pegando o elemento do Canvas
const c = document.getElementById("background");

// Definindo o seu contexto
const ctx = c.getContext("2d");

// definindo o canvas com tamanho máximo da tela
c.height = window.innerHeight;
c.width = window.innerWidth;

// letras do Matrix Rain (Agora com símbolos matemáticos)
const letters = [
  "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", 
  "+", "-", "*", "/", "=", "(", ")", "%", "√", "^", 
  ".", ",", "∞", "∑", "∫", "π", "θ", "sin", "cos", "tan", 
  "log", "ln", "e", "(", ")", ">", "<", "≥", "≤", "≠", "≡"
];

const fontSize = 25;

// definindo quantas colunas serão necessárias pelo tamanho da tela e fonte
const columns = c.width / fontSize;

// criando um array para cada gota, sempre iniciando na posição do y=1
const drops = new Array(Math.floor(columns)).fill(1);

// Função de animação
function draw() {
  // preenchendo a tela toda de preto com opacidade
  ctx.fillStyle = "rgba(245,247,250)";
  ctx.fillRect(0, 0, c.width, c.height);

  // definindo a cor e estilo da fonte
  ctx.fillStyle = "rgb(74,144,226)";
  ctx.font = `${fontSize}px arial`;

  for (let i = 0; i < drops.length; i++) {
    // pegando uma letra randomicamente no nosso array
    const text = letters[Math.floor(Math.random() * letters.length)];

    // escrevendo na tela
    ctx.fillText(text, i * fontSize, drops[i] * fontSize);

    // resetando a posição da gota ao chegar no fim
    if (drops[i] * fontSize > c.height && Math.random() > 0.95) {
      drops[i] = 0;
    }

    // movendo as gotas no eixo y
    drops[i]++;
  }
}

// Função que controla o tempo de execução da animação (2 segundos)
function startAnimation() {
  const startTime = Date.now(); // armazena o momento de início da animação
  
  function animate() {
    // calcula o tempo desde que a animação começou
    const elapsedTime = Date.now() - startTime;

    // enquanto não se passaram 2 segundos, continua a animação
    if (elapsedTime < 500) {
      draw(); // desenha a animação
      requestAnimationFrame(animate); // continua chamando a animação
    } else {
      // Após 2 segundos, limpar a tela
      ctx.clearRect(0, 0, c.width, c.height); // Limpa a tela (tela preta)
    }
  }

  animate(); // inicia a animação
}

// Detecta quando a tecla é pressionada
document.addEventListener("keydown", function() {
  startAnimation(); // Inicia a animação ao pressionar qualquer tecla
});
