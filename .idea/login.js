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
        loginValid = this.responseText.split("<br>");
        if (loginValid[0] == "1") {
            setCookie('uid', loginValid[1], 30);
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

function logout() {
    setCookie("uid", "None", 1);
    open("login.html", "_self");
}

function getEmailFromURL() {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const cemail = urlParams.get("email");

    var txtEmail = document.getElementById("txt-email");
    txtEmail.value = cemail;
}

function setCookie(key, value, expiry) {
    const date = new Date();
    date.setTime(date.getTime() + (expiry * 24 * 60 * 60 * 1000));
    let expires = "expires=" + date.toUTCString();
    document.cookie = key + "=" + value + ";" + expires + ";path=/";
}

function getCookie(key) {
    let cookieDb = document.cookie.split(";")
    for (let i = 0; i < cookieDb.length; i++) {
        let cookie = cookieDb[i].trim();
        if (cookie.startsWith(key)) {
            return cookie.substring(key.length + 1);
        }
    }
    return "";
}

getEmailFromURL();