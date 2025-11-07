<!-- header.php -->
<header class="topbar">
  
  <nav class="menu">
    <a href="home.php" class="type-2 logo" id="logo">CereMath</a>
    <?php
      if(isset($_SESSION['username'])){
        echo "<a href='conta.php' class='btn type-1'><span>👤</span> Conta</a>";
        echo "<a href='conteudos.php' class='btn type-1'><span>📝</span> Lições</a>";
      } else {
        echo "<a href='login.php' class='btn type-1'><span>👤</span> Login</a>";
      }
    ?>
    <a href="conquistas.php" class="btn type-1"><span>🏆</span> Conquistas</a>
    <a href="material.php" class="btn type-1"><span>📖</span> Material</a>
  </nav>
</header>
