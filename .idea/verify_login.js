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
        let response = this.responseText.split("\n");
        if (response[0] == "success") {
            let user_info = this.responseText.split("\n");
            var logged_username = document.getElementById("logged-username");
            logged_username.innerHTML = user_info[1];
        } else {
            open("login.html", "_self");
        }
    };

    xmlhttp.open("GET", "verifyLogin.php?session_id=" + getCookie("uid"));
    xmlhttp.send();
}

verifySession();