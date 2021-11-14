function createRow(cid, name, phone, license, engine, apptDate, mecid, mecname, rid) {
    return "" +
        "<tr id = \"" + rid + "tr\">\n" +
        "<td id = \"" + rid + "cid\">" + cid + "</td>\n" +
        "<td id = \"" + rid + "name\">" + name + "</td>\n" +
        "<td id = \"" + rid + "phone\">" + phone + "</td>\n" +
        "<td id = \"" + rid + "license\">" + license + "</td>\n" +
        "<td id = \"" + rid + "engine\">" + engine + "</td>\n" +
        "<td id = \"" + rid + "oapptDate\" hidden>" + apptDate + "</td>\n" +
        "<td id = \"" + rid + "omecid\" hidden>" + mecid + "</td>\n" +
        "<td id = \"" + rid + "tdDate\"><input id = \"" + rid + "apptDate\" type=\"date\" value=\"" + apptDate + "\" onchange=\"appDateChange(this)\"></td>\n" +
        "<td id = \"" + rid + "mecid\"><select id=\"cbo-mechanic-id\">\n" +
        "    <option selected disabled value=\"" + mecid + "\">" + mecname + "</option>\n" +
        "</select></td>\n" +
        "<td id = \"" + rid + "tddelete\"><button id = \"" + rid + "btndelete\" type=\"button\" type=\"button\" class=\"delete-button\" " +
        "onclick=\"deleteAppt(this)\">Delete</button></td>\n" +
        "</tr>"
}

function appDateChange(obj) {
    var rid = obj.id.replace("apptDate", "");
    var mecid = document.getElementById(rid + "mecid").getElementsByTagName("select")[0];
    loadMechanics(mecid, obj.value, 0)
}

function loadMechanics(cboMechanic, apptDate, cboItemOffset) {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        let mechanics = this.responseText.split("\n");

        for (let i = cboItemOffset, end = cboMechanic.options.length; i < end; i++) cboMechanic.options.remove(cboItemOffset);
        for (let mechanic_info of mechanics) {
            if (mechanic_info == "") continue;
            mechanic_info = mechanic_info.split("MECSEP");
            mechanic_id = mechanic_info[0];
            mechanic_name = mechanic_info[1];
            cboMechanic.add(new Option(mechanic_name, mechanic_id));
        }
    };
    xmlhttp.open("GET", "appt.php?session_id=" + getCookie("uid") + "&mechanic=true&apptDate=" + apptDate);
    xmlhttp.send();
}

function applyChanges() {
    let appt_table = document.getElementById("appt-table");
    let rows = appt_table.getElementsByTagName("tbody")[0].getElementsByTagName("tr");
    for (let row of rows) {
        updateAppt(row);
    }
}

function updateAppt(row) {
    var rid = row.id.replace("tr", "");
    var license = document.getElementById(rid + "license").innerHTML;
    var mecid = document.getElementById(rid + "mecid").getElementsByTagName("select")[0].value;
    var apptDate = document.getElementById(rid + "apptDate").value;
    var oapptDate = document.getElementById(rid + "oapptDate").innerHTML;
    var omecid = document.getElementById(rid + "omecid").innerHTML;

    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        // location.reload();
        console.log(this.responseText);
    };

    xmlhttp.open("GET", "updateAppt.php?session_id=" + getCookie("uid") +
        "&license=" + license +
        "&mechanic=" + mecid +
        "&apptDate=" + apptDate +
        "&omecid=" + omecid +
        "&oapptDate=" + oapptDate);
    xmlhttp.send();
}

function deleteAppt(obj) {
    var rid = obj.id.replace("btndelete", "");
    var license = document.getElementById(rid + "license").innerHTML;
    var mecid = document.getElementById(rid + "mecid").getElementsByTagName("select")[0].value;
    var apptDate = document.getElementById(rid + "apptDate").value;
    var tr = document.getElementById(rid + "tr");

    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        tr.hidden = true;
    };

    xmlhttp.open("GET", "deleteAppt.php?session_id=" + getCookie("uid") +
        "&license=" + license +
        "&mechanic=" + mecid +
        "&apptDate=" + apptDate);
    xmlhttp.send();
}

function loadData() {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        if (this.responseText == "session expired") {
            open("login.html", "_self");
        } else {
            let user_infos = this.responseText.split("\n");
            let appt_table = document.getElementById("appt-table");
            appt_table.getElementsByTagName("tbody")[0].innerHTML = "";
            for (let i = 0; i < user_infos.length; i++) {
                let user_info = user_infos[i]
                if (user_info == "") continue;
                user_info = user_info.split("ADMCSSEP");

                let row = createRow(...user_info, i);
                appt_table.getElementsByTagName("tbody")[0].insertAdjacentHTML("beforeend", row);
                var apptDate = document.getElementById(i + "apptDate").value;
                var mecid = document.getElementById(i + "mecid").getElementsByTagName("select")[0];
                loadMechanics(mecid, apptDate, 1);
            }
        }
    };

    xmlhttp.open("GET", "admin.php?session_id=" + getCookie("uid"));
    xmlhttp.send();
}

function verifyAdmin() {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        let response = this.responseText.split("\n");
        if (response[0] == "success") {
            if (response[2] != '0') {
                open("index.html", "_self");
            }
        } else {
            open("login.html", "_self");
        }
    };

    xmlhttp.open("GET", "verifyLogin.php?session_id=" + getCookie("uid"));
    xmlhttp.send();
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

verifyAdmin();
loadData();