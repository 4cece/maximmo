function ucFirst(elem){
    return (elem+'').charAt(0).toUpperCase()+elem.substr(1);
}

/* HOVER SOCIAL ICONS */
function showIcons(elem){
    let img = elem;
    let source = img.src.replace("white","orange");
    img.src = source;
    // alert(src)
}
function hideIcons(elem){
    let img = elem;
    let source = img.src.replace("orange","white");
    img.src = source;
    // alert(src)
}

/* NAVBAR */
const activeItemMenu = document.getElementsByClassName("active");
for (let i = 0; i < activeItemMenu.length; i++) {
    let parent = activeItemMenu[i].parentElement;
    parent.innerHTML += '<div class="text-center"><img src="assets/img/nav/nav-underline.svg" height="7"></div>';
}
/* NAVBAR */