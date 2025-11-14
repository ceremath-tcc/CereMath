//Codigo responsavel por levar o usuario para o fundo da pagina
const chatBox = document.getElementById("ia-box");

chatBox.scrollTo({
  top: chatBox.scrollHeight,
  behavior: "smooth"
});



//Funcao responsavel por desavilitar o input apos o envio
const form = document.getElementById("form");
const input = document.getElementById("valor");
const btn_re = document.getElementById("btn-refazer");

form.addEventListener("submit", function (e) {
  if(document.getElementById('loadingSpinner').style.visibility == 'visible'){
    e.preventDefault(); // ignora novos envios
    console.log("Ignorado!");
    return;
  }
  // Desabilita o input
  input.readOnly = true;

  //Mostra o spinner
  document.getElementById('loadingSpinner').style.visibility = 'visible';

  // Aqui você mandaria a mensagem para o backend...
  console.log("Mensagem enviada:", input.value);
});

btn_re.addEventListener("submit", function (e) {
  if(document.getElementById('loadingSpinner').style.visibility == 'visible'){
    e.preventDefault(); // ignora novos envios
    console.log("Ignorado!");
    return;
  }
  // Desabilita o input
  input.readOnly = true;

  //Mostra o spinner
  document.getElementById('loadingSpinner').style.visibility = 'visible';

  // Aqui você mandaria a mensagem para o backend...
  console.log("Mensagem enviada:", input.value);
});


