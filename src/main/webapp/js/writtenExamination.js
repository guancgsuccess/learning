function radio(option) {
    var options = document.getElementsByClassName("option");
    for ( var i = 0; i < options.length; i++) {
        options[i].children[0].className = "icons";
        options[i].style.borderColor = "#d4d4d4";
    }
    option.children[0].className = "icons test";
    option.style.borderColor = "#25bb9b";
}
