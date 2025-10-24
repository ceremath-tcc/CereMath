<?php
require __DIR__ . '/../src/controller/conceitoController.php';
require "./components/conquista-add.php";
$controller = new ConceitoController();
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    //Pega os dados (o id da session e os outros vao ser enviados pelo arquivo progress.php)
    $id = $_SESSION['id'];
    $id_materia = $_POST['id_conceito'];
    $acertos = $_POST['acertos'];
    $erros = $_POST['erros'];

    //Aqui ele vai efetivar a mudança
    $controller->setConceito($id, $id_materia, $acertos, $erros);

    if (!isset($_SESSION['triggers_ativados'])) {
        $_SESSION['triggers_ativados'] = [];
    }

    //Verifica se é o pra finalizar o conceito
    switch ($id_materia) {
        //Conjunto
        case 5:
            ativarTriggerSession("CONCLUIU_CONJUNTOS");
            break;

        //Função afim
        case 10:
            ativarTriggerSession("CONCLUIU_FUNCAO_AFIM");
            break;

        //Função quadratica
        case 16:
            ativarTriggerSession("CONCLUIU_FUNCAO_QUADRATICA");
            break;
        
        //Fução exponencial
        case 21:
            ativarTriggerSession("CONCLUIU_FUNCAO_EXPONENCIAL");
            break;
        
        //Trigonometria
        case 26:
            ativarTriggerSession("CONCLUIU_TRIGONOMETRIA");
            break;

        //Matriz
        case 30:
            ativarTriggerSession("CONCLUIU_MATRIZES");
            break;
        
        //Sistema Linear
        case 33:
            ativarTriggerSession("CONCLUIU_SISTEMAS_LINEARES");
            break;
        
        //Função modular
        case 36:
            ativarTriggerSession("CONCLUIU_FUNCAO_MODULAR");
            break;
        
        //Progressao aritmetica
        case 39:
            ativarTriggerSession("CONCLUIU_PROGRESSAO_ARITMETICA");
            break;
        
        //Progressao geometrica
        case 42:
            ativarTriggerSession("CONCLUIU_PROGRESSAO_GEOMETRICA");
            break;

    }

    //Se nao usou a IA
    if(!in_array( "CHAT_IA_PRIMEIRA_VEZ", $_SESSION['triggers_ativados'])){
        ativarTriggerSession('SEM_AJUDA_IA');
    }

    //Coloca essa aqui (Vai checar toda vez que terminou)
    ativarTriggerSession("PRIMEIRA_LICAO");
} else {
    //Senão ele for metodo post, vai te enviar de volta pra home
    header('Location: home.php?erro');
    exit;
}

//No final, se nao deu erro te envia pra home
header('Location: home.php');
exit;