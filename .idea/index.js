var cont_appt_empty, cont_appt, txt_appoint_date, txt_license, txt_engine, txt_address, txt_mechanic_name,
    txt_mechanic_id, sub_container;

function createApptCard(row, apptDate, license, engine, address, mechanicID, mechanicName) {
    return `
                <div class="appointment-container" id="cont-appt${row}">
                    <button id="btnDel${row}" type="button" class="btn-delete" onclick="deleteAppointment(this)">X</button>
                    <table>
                        <thead>
                        <tr>
                            <td colspan="2">Appointment</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="appoint-labl">Date</td>
                            <td class="appoint-val" id="txt-appoint-date${row}">${apptDate}</td>
                        </tr>
                        <tr>
                            <td class="appoint-labl">Car License Number</td>
                            <td class="appoint-val" id="txt-licence${row}">${license}</td>
                        </tr>
                        <tr>
                            <td class="appoint-labl">Car Egnine Number</td>
                            <td class="appoint-val" id="txt-engine${row}">${engine}</td>
                        </tr>
                        <tr>
                            <td class="appoint-labl">Address</td>
                            <td class="appoint-val" id="txt-address${row}">${address}</td>
                        </tr>
                        <tr hidden>
                            <td class="appoint-labl">Mechanic</td>
                            <td class="appoint-val" id="txt-mechanic-id${row}">${mechanicID}</td>
                        </tr>
                        <tr>
                            <td class="appoint-labl">Mechanic</td>
                            <td class="appoint-val" id="txt-mechanic-name${row}">${mechanicName}</td>
                        </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn-edit" onclick="alert('Coming soon...')">Edit</button>
                </div>`;
}

function createEmptyApptCard() {
    return `
                <div class="appointment-container-unavailable">
                    <p>There are no available appointments</p>
                    <button type="button" class="btn-edit" onclick="openAppointmentForm()">Request for new appointment</button>
                </div>
    `
}

function verifyAdmin() {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        let response = this.responseText.split("\n");
        if (response[0] == "success") {
            if (response[2] == '0') {
                open("admin.html", "_self");
            }
        } else {
            open("login.html", "_self");
        }
    };

    xmlhttp.open("GET", "verifyLogin.php?session_id=" + getCookie("uid"));
    xmlhttp.send();
}

function initializeFields() {
    sub_container = document.getElementById("sub-container");
}

function deleteAppointment(card) {
    var rid = card.id.replace("btnDel", "");
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        location.reload();
    };
    var txt_appoint_date = document.getElementById("txt-appoint-date" + rid);
    var txt_license = document.getElementById("txt-licence" + rid);
    var txt_mechanic_id = document.getElementById("txt-mechanic-id" + rid);

    let apptDate = txt_appoint_date.innerHTML.split("/");
    apptDate = apptDate[2] + "/" + apptDate[1] + "/" + apptDate[0];

    xmlhttp.open("GET", "deleteAppt.php?session_id=" + getCookie("uid") +
        "&license=" + txt_license.innerHTML +
        "&mechanic=" + txt_mechanic_id.innerHTML +
        "&apptDate=" + apptDate);
    xmlhttp.send();
}

function toDate(parseString) {
    parseString = parseString.split("/");
    parseString = parseString[2] + "/" + parseString[1] + "/" + parseString[0];
    return Date.parse(parseString);
}

function getAppointment() {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        let responses = this.responseText.split("\n");
        let apptCards = []
        if (responses[0] == -1) {
            apptCards.push(createEmptyApptCard());
        } else if (responses[0] == "session expired") {
            open("login.html", "_self");
        } else if (responses[0] == "APPTLIST") {
            let sortedResponses = responses.splice(1).sort((a, b) => toDate(a.split("APPTSEP")[0]) - toDate(b.split("APPTSEP")[0]));
            for (let s of sortedResponses)
                console.log((s.split("APPTSEP")[0]));
            // console.log(sortedResponses);
            for (let i = 0; i < sortedResponses.length; i++) {
                apptCards.push(createApptCard(i, ...sortedResponses[i].split("APPTSEP")));
            }
        }
        for (let apptCard of apptCards) {
            sub_container.insertAdjacentHTML("beforeend", apptCard);
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