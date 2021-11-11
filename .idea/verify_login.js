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

function verifySession() {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        if (!(this.responseText == "verified")) {
            open("login.html", "_self");
        }
    };

    xmlhttp.open("GET", "verifyLogin.php?session_id=" + getCookie("uid"));
    xmlhttp.send();
}

verifySession();