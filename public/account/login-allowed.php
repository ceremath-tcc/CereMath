<?php
    if(!isset($_SESSION['username']) && !isset($_SESSION['email'])){
        header('Location: /../public/login.php');
        exit();
    }
?>