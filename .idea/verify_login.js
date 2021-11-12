function getCookie(key) {
    let cookieDb = document.cookie.split(";")
    for (let i = 0; i < cookieDb.length; i++) {
        let cookie = cookieDb[i].trim();
        if (cookie.startsWith(key)) {
            return cookie.substring(key.length + 1);
        }
    }
    return "None";
}

function verifySession() {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        if (this.responseText == "session expired") {
            open("login.html", "_self");
        } else {
            let user_info = this.responseText.split("\n");
            var logged_username = document.getElementById("logged-username");
            logged_username.innerHTML = user_info[0];
        }
    };

    xmlhttp.open("GET", "verifyLogin.php?session_id=" + getCookie("uid"));
    xmlhttp.send();
}

verifySession();