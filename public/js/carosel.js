const cards = document.querySelectorAll(".card");
let current = 1; // começa no card do meio

function updateCarousel() {
  cards.forEach((card, i) => {
    card.classList.remove("active");
    if (i === current) card.classList.add("active");
  });
}

document.querySelector(".prev").addEventListener("click", () => {
  current = (current - 1 + cards.length) % cards.length;
  updateCarousel();
});

document.querySelector(".next").addEventListener("click", () => {
  current = (current + 1) % cards.length;
  updateCarousel();
});

updateCarousel();
