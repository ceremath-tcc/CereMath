document.addEventListener("DOMContentLoaded", function () {
    const btTodos = document.getElementById('1-bt');
    const btConcluido = document.getElementById('2-bt');
    const btNaoConcluido = document.getElementById('3-bt');

    const conquistas = document.querySelectorAll('.achievement');

    function mostrarTodos() {
        conquistas.forEach(el => el.style.display = 'flex');
    }

    function mostrarConcluidas() {
        conquistas.forEach(el => {
            if (el.classList.contains('locked')) {
                el.style.display = 'none';
            } else {
                el.style.display = 'flex';
            }
        });
    }

    function mostrarNaoConcluidas() {
        conquistas.forEach(el => {
            if (el.classList.contains('locked')) {
                el.style.display = 'flex';
            } else {
                el.style.display = 'none';
            }
        });
    }

    btTodos.addEventListener('click', function (e) {
        e.preventDefault();
        btTodos.classList.add('active');
        btConcluido.classList.remove('active');
        btNaoConcluido.classList.remove('active');
        mostrarTodos();
    });

    btConcluido.addEventListener('click', function (e) {
        e.preventDefault();
        btTodos.classList.remove('active');
        btConcluido.classList.add('active');
        btNaoConcluido.classList.remove('active');
        mostrarConcluidas();
    });

    btNaoConcluido.addEventListener('click', function (e) {
        e.preventDefault();
        btTodos.classList.remove('active');
        btConcluido.classList.remove('active');
        btNaoConcluido.classList.add('active');
        mostrarNaoConcluidas();
    });
});