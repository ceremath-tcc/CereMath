<?php
$frases = [
    "A matemática é a poesia das ciências." => "Joseph Fourier",
    "A matemática não mente." => "Carl Friedrich Gauss",
    "A matemática é o alfabeto com o qual Deus escreveu o universo." => "Galileu Galilei",
    "Matemática é a única ciência que pode descrever o mundo real com precisão absoluta." => "Roger Penrose",
    "A matemática é a chave para entender o universo." => "Leonhard Euler",
    "A matemática é o estudo das possibilidades." => "Murray Gell-Mann",
    "A matemática é a música da razão." => "James Joseph Sylvester",
    "A matemática, quando bem compreendida, é tão bela quanto a arte." => "Sophie Germain",
    "A matemática não está apenas em números, mas em tudo o que está ao nosso redor." => "David Hilbert",
    "A matemática é o melhor método de controle do nosso pensamento." => "Albert Einstein",
    "A matemática é uma ciência que ninguém pode ignorar." => "Andrew Wiles",
    "Na matemática, o que sabemos é muito pequeno em comparação com o que não sabemos." => "Pierre-Simon Laplace",
    "Não é a matemática que nos falha, somos nós que falhamos com ela." => "Henri Poincaré",
    "A matemática começa onde a imaginação para." => "Edwin Abbott Abbott",
    "A matemática é o brinquedo dos seres humanos adultos." => "John von Neumann",
    "Tudo o que pode ser pensado é possível." => "Albert Einstein",
    "A matemática é a ciência das relações e das ordens." => "Roger Bacon",
    "A matemática é a mais pura das ciências." => "Euclides",
    "Matemática é o caminho que leva à verdade." => "René Descartes",
    "Matemática é a arte de dar o mesmo nome a coisas diferentes." => "Henri Poincaré",
    "A matemática é a linguagem do universo." => "Galileu Galilei",
    "A matemática não é apenas sobre números, é sobre a maneira de pensar." => "David Hilbert",
    "A matemática é uma forma de arte que organiza o caos." => "Emmy Noether",
    "Se você não pode explicá-lo de forma simples, você não entendeu o suficiente." => "Albert Einstein",
    "A matemática é uma aventura sem fim." => "David Hilbert",
    "Na matemática, o simples e o complexo se encontram e se misturam." => "Blaise Pascal",
    "A matemática é a arte de fazer perguntas." => "Henri Poincaré",
    "A matemática é uma arte tão pura quanto a música." => "Evariste Galois",
    "Matemática é o estudo das formas e das relações." => "Évariste Galois",
    "A matemática é um exercício de liberdade." => "Jorge Luis Borges",
    "A beleza da matemática é a sua simplicidade." => "Srinivasa Ramanujan",
    "A matemática é o reflexo do nosso pensamento." => "David Hilbert",
    "As leis da matemática não são inventadas; elas são descobertas." => "Albert Einstein",
    "Matemática é a ciência que organiza o conhecimento do mundo." => "Isaac Newton",
    "A matemática é o estudo de padrões." => "John Nash",
    "O que importa não é a resposta, mas a maneira de pensar." => "George Polya",
    "A matemática é como o amor; a difícil parte é a entrega." => "Blaise Pascal",
    "A matemática é o coração da ciência." => "Bertrand Russell",
    "A matemática é a ciência que mantém a verdade viva." => "Matthias Schleiden",
    "A matemática é uma linguagem universal que não pode ser mentirosa." => "G.H. Hardy"
];

//Define a data atual com o formato normal (data, mes e ano)
$data_atual_dma = date('d/m/Y');

//Verifica se "dia" foi definido, e se ja passou um dia (frase diferente)
if(!isset($_SESSION['dia']) ||   $_SESSION['dia'] != $data_atual_dma){
    $_SESSION['dia'] = $data_atual_dma;
    $_SESSION['frases'] = array_rand($frases);
}