function checkLogin() {
    var email = document.getElementById("txt-email").value;
    var loginValid = true;

    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        loginValid = this.responseText;
        if (loginValid == "0") {
            open("register.html?email=" + email, "_self");
        } else {
            open("login_verified.html?email=" + email, "_self");
        }
    }

    xmlhttp.open("GET", "check_account.php?email=" + email);
    xmlhttp.send();
}

function verifyLogin() {
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
            var txtInvalidLogin = document.getElementById("txt-invalid-login");
            txtInvalidLogin.style.display = "block";
            txtInvalidLogin.style.animation = "fadeIn 0.3s"
        }
    }

    xmlhttp.open("GET", "login.php?email=" + email + "&pass=" + pass);
    xmlhttp.send();
}

function getEmailFromURL() {
    alert("hello")
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const cemail = urlParams.get("email");

    var txtEmail = document.getElementById("txt-email");
    txtEmail.value = cemail;
}