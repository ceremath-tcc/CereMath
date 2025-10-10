<?php
require __DIR__ . '/../../src/controller/questaoController.php';
$controller = new QuestaoController();

session_start();

//Caso o id nao esteja definido, vai mandar de volta

/*
if (!isset($_SESSION['id_questao'])) {
    header('Location: ./home.php');
    exit();
}

$id_materia = $_SESSION['id_questao'];
*/

$id_materia = 1;

//Vai guardar os valores nessa array
$perguntas = [];

for ($i = 0; $i < 5; $i++) {

    //Recebe a quetao do banco de dados
    $questoes = $controller->checkEnunciado($id_materia);
    //Caso esteja vazio, volta novamente
    if (empty($questoes)) {
        header('Location: ./home.php');
        exit();
    }
    //Seleciona o valor da questao aleatoria
    $valor_questao = rand(1, count($questoes));




    //Recebe a variavel do banco de dados baseado no id da questao selecionada
    $string_varaiveis = $controller->checkVariaveis($valor_questao);
    //Caso esteja vazio, volta novamente
    if (empty($string_varaiveis)) {
        header('Location: ./home.php');
        exit();
    }
    
    //Seleciona a variavel aleatoria
    $valor_variavel = rand(1, count($string_varaiveis)-1);
    print_r($string_varaiveis[])
    



    //Recebe a variavel do banco de dados baseado no id da questao selecionada
    $alternativas = $controller->checkAlternativas($valor_questao, $valor_variavel);
    //Caso esteja vazio, volta novamente
    print_r($alternativas);
    //Seleciona a alternativa aleatoria
    $valor_alternativa = rand(1, count($alternativas));


    //Guarda a questao aleatoria
    $enunciado = $questoes[$valor_questao-1];



    //Separa a questao a partir do espaço e separa a virgula das palavras
    $enunciado = preg_split('/(\s+|(?<=,)|(?=,))/', $enunciado, -1, PREG_SPLIT_NO_EMPTY);



    //Guarda a resposta aleatoria
    $variavel = $varaiveis[$valor_questao][$valor_variavel];

    //Troca os placeholders pelos seus valores correspondentes
    foreach ($enunciado as $key => &$value) {
        if ($value == "v1") {
            $value = $variavel[0];
        } elseif ($value == "v2") {
            $value = $variavel[1];
        } elseif ($value == "v3") {
            $value = $variavel[2];
        } elseif ($value == "v4") {
            $value = $variavel[3];
        } elseif ($value == "v5") {
            $value = $variavel[4];
        } elseif ($value == "v6") {
            $value = $variavel[5];
        } elseif ($value == "v7") {
            $value = $variavel[6];
        } elseif ($value == "v8") {
            $value = $variavel[7];
        }
    }


    //Guarda o enunciado gerado em uma string
    $result = "";
    for ($j = 0; $j < count($enunciado); $j++) {
        if ($enunciado[$j] == ',' || $enunciado[$j] == ';') {
            $result .= $enunciado[$j];
        } else {
            $result .= " " . $enunciado[$j];
        }
        print ($enunciado[$j] . " ");
    }

    $val_resposta = $alternativas[$valor_alternativa];
    $perguntas[] = [[$result], [$val_resposta]];
}

print_r($perguntas);