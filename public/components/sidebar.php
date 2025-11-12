<?php
header('Content-Type: application/json; charset=utf-8');

file_get_contents(__DIR__ . '/load-questoes.php?qtd=7&materia=1');
echo $dados;
