const button = document.getElementById('exit');
const div = document.getElementById('modal');
const back = document.getElementById('back');

button.addEventListener("click", function() {
    div.style.display = "none";
    back.style.display = "none";
});