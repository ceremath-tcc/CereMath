<?php
    session_start();
    if(isset($_SESSION['username'])){
        header('Location: /../public/home.php');
        exit();
    }
?>