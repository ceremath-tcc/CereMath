<?php
    session_start();
    unset($_SESSION['username']);

    header('Location: /../public/login.php');
    exit();