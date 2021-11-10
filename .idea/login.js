function login() {
    var txtEmail = document.getElementById("txt-email");
    var txtPass = document.getElementById("txt-pass");

    var email = txtEmail.value;
    var pass = txtPass.value;
    var loginValid = true;

    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        loginValid = this.responseText;
        if (loginValid == "1") {
            open("index.html", "_self");
        } else {
            open("register.html", "_self");
        }
    }

    xmlhttp.open("GET", "login.php?email=" + email + "&pass=" + pass);
    xmlhttp.send();
}

function register() {
    open("index.html", "_self");
}