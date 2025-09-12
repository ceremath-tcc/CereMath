<footer class="footer">
  <div class="footer-bar">
    <span>Deseja nos contatar?</span>
    <button class="footer-toggle">+</button>
  </div>
 
  <div class="footer-content">
    <p><b>Email:</b> ceremath.tcc@gmail.com</p>
    <p>[número do integrante] - [número do integrante] - [número do integrante] - [número do integrante] - [número do integrante]</p>
  </div>
</footer>
 
<style>
  .footer-content p{
    font-size:18px;
  }
 
  .footer {
    z-index: 4;
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    background: #eaecee;
    color: #4a90e2;
    font-family: 'Inter', sans-serif;
    padding: 10px 20px;
    box-shadow: 0 -2px 6px rgba(0,0,0,0.15);
  }
 
  .footer-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
 
 
  .footer-bar span {
    font-weight: 600;
    font-size: 19px;
    text-align:center;
  }
 
  .footer-toggle {
    background: white;
    color: #2c72c7;
    border: none;
    font-size: 20px;
    font-weight: bold;
    width: 36px;
    height: 36px;
    border-radius: 50%;
    cursor: pointer;
    transition: 0.3s;
  }
 
  .footer-toggle:hover {
    background: #1450a8;
    color: white;
  }
 
  .footer-content {
    display: none;
    background: #f9fbfd;
    color: #333;
    padding: 15px;
    border-radius: 10px;
    margin-top: 12px;
    animation: slideUp 0.3s ease;
    font-size:18px;
  }
 
  @keyframes slideUp {
    from {
      opacity: 0;
      transform: translateY(20px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }
</style>
 
<script>
  document.addEventListener("DOMContentLoaded", function () {
    const toggleBtn = document.querySelector(".footer-toggle");
    const content = document.querySelector(".footer-content");
 
    toggleBtn.addEventListener("click", () => {
      if (content.style.display === "block") {
        content.style.display = "none";
        toggleBtn.textContent = "+";
      } else {
        content.style.display = "block";
        toggleBtn.textContent = "–";
      }
    });
  });
</script>