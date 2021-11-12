var cont_appt_empty, cont_appt, txt_appoint_date, txt_license, txt_engine, txt_address, txt_mechanic_name, txt_mechanic_id;

function verifyAdmin() {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        if (this.responseText == "session expired") {
            open("login.html", "_self");
        } else {
            let user_info = this.responseText.split("\n");
            if (user_info[1] == '0') {
                open("admin.html", "_self");
            }
        }
    };

    xmlhttp.open("GET", "verifyLogin.php?session_id=" + getCookie("uid"));
    xmlhttp.send();
}

function initializeFields() {
    cont_appt_empty = document.getElementById("cont-appt-empty");
    cont_appt = document.getElementById("cont-appt");
    txt_appoint_date = document.getElementById("txt-appoint-date");
    txt_license = document.getElementById("txt-licence");
    txt_engine = document.getElementById("txt-engine");
    txt_address = document.getElementById("txt-address");
    txt_mechanic_name = document.getElementById("txt-mechanic-name");
    txt_mechanic_id = document.getElementById("txt-mechanic-id");
}

function deleteAppointment() {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        location.reload();
    };
    let apptDate = txt_appoint_date.innerHTML.split("/");
    apptDate = apptDate[2] + "/" + apptDate[1] + "/" + apptDate[0];
    xmlhttp.open("GET", "deleteAppt.php?session_id=" + getCookie("uid") +
        "&license=" + txt_license.innerHTML +
        "&mechanic=" + txt_mechanic_id.innerHTML +
        "&apptDate=" + apptDate);
    xmlhttp.send();
}

function getAppointment() {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        let response = this.responseText.split("\n");
        if (response[0] == -1) {
            cont_appt_empty.style.display = "block";
        } else if (response[0] == "session expired" || response.length < 6) {
            open("login.html", "_self");
        } else {
            cont_appt.style.display = "block";
            txt_mechanic_id.innerHTML = response[0];
            txt_appoint_date.innerHTML = response[1];
            txt_license.innerHTML = response[2];
            txt_engine.innerHTML = response[3];
            txt_address.innerHTML = response[4];
            txt_mechanic_name.innerHTML = response[5];
            console.log(response);
        }
    };

    xmlhttp.open("GET", "dashboard.php?session_id=" + getCookie("uid"));
    xmlhttp.send();
}

initializeFields();
verifyAdmin();
getAppointment();

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