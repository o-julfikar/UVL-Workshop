var txtName, txtPhone, cboAddress, txtAddress, cboCar, txtCar, txtApptDate, cboMechanic, btnCancel, btnApply;

function initializeFields() {
    txtName = document.getElementById("txt-name");
    txtPhone = document.getElementById("txt-phone");
    cboAddress = document.getElementById("cbo-address");
    txtAddress = document.getElementById("txt-address");
    cboCar = document.getElementById("cbo-car");
    txtCar = document.getElementById("txt-car");
    txtApptDate = document.getElementById("txt-appt-date");
    cboMechanic = document.getElementById("cbo-mechanic");
}
function applyAppointment() {

}

function loadMechanics() {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        let mechanics = this.responseText.split("\n");
        for (let mechanic_info of mechanics) {
            if (mechanic_info == "") continue;
            mechanic_info = mechanic_info.split("MECSEP");
            mechanic_id = mechanic_info[0];
            mechanic_name = mechanic_info[1];
            cboMechanic.add(new Option(mechanic_name, mechanic_id));
        }
    };

    xmlhttp.open("GET", "appt.php?session_id=" + getCookie("uid") + "&mechanic=true");
    xmlhttp.send();
}

function load() {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        let responses = this.responseText.split("SPSEPMAZ");
        let rNamePhone = responses[0].split("\n");
        let rAddress = responses[1].split("\n");
        let rCar = responses[2].split("\n");

        txtName.value = rNamePhone[0];
        txtPhone.value = rNamePhone[1];

        for (let address of rAddress) {
            cboAddress.add(new Option(address));
        }
        cboAddress.onchange = function () {
            if (cboAddress.selectedIndex > 0) {
                txtAddress.value = this.value;
            } else {
                txtAddress.value = "";
            }
        };
        if (cboAddress.length > 1) {
            cboAddress.selectedIndex = 1;
            txtAddress.value = cboAddress.value;
        }

        for (let car of rCar) {
            if (car == "") continue;
            car = car.split("CARSEP");
            license = car[0];
            engine = car[1];
            cboCar.add(new Option(license, engine));
        }

        txtApptDate.onchange = function () {
            loadMechanics();
        };
    };

    xmlhttp.open("GET", "appt.php?session_id=" + getCookie("uid") + "&mechanic=false");
    xmlhttp.send();
}

initializeFields();
load();

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