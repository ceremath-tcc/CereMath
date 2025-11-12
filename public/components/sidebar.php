<?php
header('Content-Type: application/json; charset=utf-8');

$json = file_get_contents('https://ceremath.onrender.com/public/components/load-questoes.php?qtd=7&materia=1');

$dados = json_decode($json, true);

echo '<pre>\n';
print_r($dados);
echo '\n</pre>';

