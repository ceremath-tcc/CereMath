<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
        $dir = "materiais/"; // pasta onde estão os arquivos
        $files = array_diff(scandir($dir), array('.', '..')); // pega lista, ignora "." e ".."
        $pdfs = array_values(array_filter($files, function($file) use ($dir) {
            return pathinfo($file, PATHINFO_EXTENSION) === "pdf";
        }));
        
        // exemplo: pega o 2º PDF da lista (posição 1, já que array começa em 0)
        $pos = 0; 
        if (isset($pdfs[$pos])) {
            $pdf = $dir . $pdfs[$pos];
            echo "<iframe src='$pdf' width='100%' height='600px'></iframe>";
        } else {
            echo "Nenhum PDF nessa posição.";
        }
    ?>
</body>

</html>