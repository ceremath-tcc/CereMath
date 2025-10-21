








/*
FICA DENTRO DO
<div id="award-container">
*/






// --- Lista inicial de conquistas fixas ---
const fixedAwards = [
    { id: "html", title: "Conquista HTML", description: "Você desbloqueou HTML!" },
    { id: "css", title: "Conquista CSS", description: "Você desbloqueou CSS!" }
];

// --- Carrega conquistas do localStorage ou usa lista inicial ---
let awards = JSON.parse(localStorage.getItem("awards")) || fixedAwards;

// --- Renderiza na tela ---
function renderAwards() {
    const container = document.getElementById("award-container");
    container.innerHTML = "";

    awards.forEach((award) => {
        const div = document.createElement("div");
        div.className = "award";
        div.dataset.id = award.id;
        div.innerHTML = `
        <div class="icon">
          <img src="https://gustavoguanabara.github.io/html-css/exercicios/modulo-01/ex003/logo-html.png">
        </div>
        <div>
          <h2 class="award-title">${award.title}</h2>
          <p class="award-text">${award.description}</p>
        </div>
        <button class="award-remove">X</button>
      `;

        // --- Evento para remover ---
        div.querySelector(".award-remove").addEventListener("click", () => {
            removeAward(award.id);
        });

        container.appendChild(div);
    });
}

function removeAward(id) {
  const awardDiv = document.querySelector(`.award[data-id="${id}"]`);

  if (!awardDiv) {
    console.log("❌ Award não encontrado:", id);
    return;
  }

  // Adiciona classe para animar
  awardDiv.classList.add("removing");

  // Só remove do DOM e localStorage depois da animação
  setTimeout(() => {
    awards = awards.filter((award) => award.id !== id);
    localStorage.setItem("awards", JSON.stringify(awards));
    renderAwards();
  }, 400);
}


// --- Função para adicionar nova conquista dinamicamente ---
function addAward(id, title, description) {
    // não adiciona se já existir
    if (awards.some((a) => a.id === id)) return;
    awards.push({ id, title, description });
    localStorage.setItem("awards", JSON.stringify(awards));
    renderAwards();
}

// --- Inicializa ---
renderAwards();