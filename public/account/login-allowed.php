<?php
    if(!isset($_SESSION['username'])){
        header('Location: /../public/login.php');
        exit();
    }
?>