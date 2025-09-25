const close = document.getElementById('exit');
const open = document.getElementById('mudar');
const div = document.getElementById('modal');
const back = document.getElementById('back');

close.addEventListener("click", function () {
    div.style.display = "none";
    back.style.display = "none";
});

open.addEventListener("click", function () {
    div.style.display = "block";
    back.style.display = "block";
});
