<?php
header('Content-Type: application/json; charset=utf-8');

$dados = file_get_contents('components/load-questoes.php?qtd=7&materia=1');
echo $dados;
