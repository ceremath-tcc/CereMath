<?php
    session_start();
    header('Content-Type: text/html; charset=utf-8');
    mb_internal_encoding("UTF-8");
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Area de Estudo</title>
    <link rel="stylesheet" href="ia.css">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <?php
    require_once './components/header.php';
    require_once 'components/footer.php';
    require_once './components/fonts.php';
    ?>
    <br>
    <div class="content-box">
        <!--Aqui ficara os materiais-->
        <div class="study-box">
            <?php
            $dir = "materiais/"; // pasta onde estão os arquivos
            $files = array_diff(scandir($dir), array('.', '..')); // pega lista, ignora "." e ".."
            $pdfs = array_values(array_filter($files, function ($file) use ($dir) {
                return pathinfo($file, PATHINFO_EXTENSION) === "pdf";
            }));

            // Pega o elemento na ?titulo
            $pos = $_GET['titulo'] - 1;
            if (isset($pdfs[$pos])) {
                $pdf = $dir . $pdfs[$pos];
                echo "<iframe src='$pdf#toolbar=0' width='95%' height='95%'></iframe>";
            } else {
                echo "Nenhum material encontrado.";
            }
            ?>
            <br>
            <button class="btn-passar type-2"><a href="quiz.php?materia=<?php if (isset($_GET['titulo'])) {
                echo $_GET['titulo'];
            } ?>" class="link space">Ir para o questionario.</a></button>
        </div>

        <!--Aqui fica a IA-->
        <div class="study-box" id="chat-box">
            <button class="button-remove type-2" id="remove"><a href="./components/removehistory.php?titulo=<?php if (isset($_GET['titulo'])) {
                echo $_GET['titulo'];
            } ?>">Reinicie
                    sua conversa</a></button>
            <div class="container-ia" id="ia-box">
                <!--Responsavel por carregar as respostas da IA-->
                <?php
                // Se não existir histórico, não mostra nada
                if (isset($_SESSION['historico'])) {
                    //Se só tiver uma questao sem resposta nao envia
                    if (count($_SESSION['historico']) > 2) {
                        //Define o tamanho do historico
                        foreach ($_SESSION['historico'] as $message) {
                            $role = $message['role'];
                            $content = htmlspecialchars_decode($message['content'], ENT_QUOTES);

                            if ($role == "user") {
                                echo "<div class='message1 user type-2'>";
                                echo $content;
                                echo "</div>";
                            } elseif ($role == "assistant") {
                                echo "<div class='message1 ia type-2'>";
                                echo $content;
                                echo "</div>";
                            }
                        }
                        //Se a contagem for menor que 3
                    } else {
                        echo '<p class="ia-default type-2">Tire suas duvidas aqui!</p>';
                    }
                    //Se $_SESSION nao estiver definido
                } else {
                    echo '<p class="ia-default type-2">Tire suas duvidas aqui!</p>';
                }
                ?>
            </div>
            <div id="loadingSpinner"></div>
            <form method="POST" id="form" action="./ia/set.php?titulo=<?php if (isset($_GET['titulo'])) {
                echo $_GET['titulo'];
            } ?>">
                <div class="input-wrapper">
                    <input type="text" name="valor" id="valor" placeholder="Digite sua questão..." required
                        class="type-1">
                    <button class="btn-2"><a href="./ia/change.php?titulo=<?php if (isset($_GET['titulo'])) {
                        echo $_GET['titulo'];
                    } ?>" class="link" id="btn-refazer">↻</a></button>
                    <button type="submit" class="btn-1">➤</button>
                </div>
            </form>
        </div>
    </div>
    <script src="./js/studybox.js"></script>
</body>

</html>
