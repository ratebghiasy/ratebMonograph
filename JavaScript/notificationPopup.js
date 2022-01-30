const targetDiv = document.body;
const div = document.getElementById("notification-btn");
console.log({targetDiv,div});
div.onclick = function () 
{
    targetDiv.classList.toggle("notify");
};