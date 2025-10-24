<?php

$python = "C:\\Python313\\python.exe";

if (!file_exists($python)) {
    die("Python não encontrado em: $python");
} else {
    echo "Python encontrado!";
}

echo "\nTEste\n";

$caminho_script = realpath(__DIR__ . "./python/ia.py");

if (!$caminho_script) {
    die("Script Python não encontrado!");
} else {
    echo "Encontradp";
}