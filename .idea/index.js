function getMechanic() {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        let respone = this.responseText.split("\n");
        let cont_appt_empty = document.getElementById("cont-appt-empty");
        let cont_appt = document.getElementById("cont-appt");
        if (respone[0] == -1) {
            cont_appt_empty.style.display = "block";
        } else {
            cont_appt.style.display = "block";
            let txt_appoint_date = document.getElementById("txt-appoint-date");
            let txt_mechanic_name = document.getElementById("txt-mechanic-name");
            txt_appoint_date.innerHTML = respone[0];
            txt_mechanic_name.innerHTML = respone[1];
        }
    };

    xmlhttp.open("GET", "index.php?session_id=" + getCookie("uid"));
    xmlhttp.send();
}

getMechanic();

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