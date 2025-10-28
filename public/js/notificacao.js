
// --- Lista inicial de conquistas fixas ---
const fixedAwards = [
  { id: "CRIAR_CONTA", title: "Bem vindo", description: "Conquistada por fazer a primeira conta." }
];

// Exemplo em arquivo script.js 
// Exemplo em arquivo script.js 
fetch(`components/conquista-fetch.php`) 
  .then(response => response.json())
  .then(data => {
    // Se data for [], o forEach não faz nada, e o console mostrará "Nenhuma nova conquista"
    
    if (data.length > 0) {
        console.log("Novas conquistas recebidas:", data);
    } else {
        console.log("Nenhuma nova conquista retornada pelo servidor.");
    }

    data.forEach((q) => { 
        addAward(q.trigger_key, q.nome, q.descricao)
    })
  })
.catch(error => {
    console.error("Erro no Fetch (verifique o header/status HTTP):", error);
});

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
          🏅
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