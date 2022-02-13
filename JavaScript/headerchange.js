function changeHeader(){
    var header = document.getElementById('header');
    var scrollValue = window.scrollY;
    if(scrollValue < 1){
        header.classList.remove('header-scroll');
    } else {
        header.classList.add('header-scroll');
    }
}

window.addEventListener('scroll', changeHeader);