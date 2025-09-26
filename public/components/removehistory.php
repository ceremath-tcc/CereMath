<?php
    session_start();
    if(isset($_SESSION['historico'])){
        unset($_SESSION['historico']);
    }

    $titulo = $_GET['titulo'] ?? '';
    $titulo = intval($titulo);
    header("Location: ../ia.php?titulo=" . urlencode($titulo));
    exit;