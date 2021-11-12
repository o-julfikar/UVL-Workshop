var txtName, txtPhone, cboAddress, txtAddress, cboCar, txtCar, txtEngine, txtApptDate, cboMechanic, btnCancel, btnApply;

function initializeFields() {
    txtName = document.getElementById("txt-name");
    txtPhone = document.getElementById("txt-phone");
    cboAddress = document.getElementById("cbo-address");
    txtAddress = document.getElementById("txt-address");
    cboCar = document.getElementById("cbo-car");
    txtCar = document.getElementById("txt-car");
    txtEngine = document.getElementById("txt-engine");
    txtApptDate = document.getElementById("txt-appt-date");
    cboMechanic = document.getElementById("cbo-mechanic");
}
function applyAppointment() {
    var fullname = txtName.value;
    var phone = txtPhone.value;
    var address = txtAddress.value;
    var license = txtCar.value;
    var engine = txtEngine.value;
    var apptDate = txtApptDate.value;
    var mechanic = cboMechanic.value;

    var flagAddress = cboAddress.selectedIndex == 0;
    var flagCar = cboCar.selectedIndex == 0;

    const apptRequest = new XMLHttpRequest();
    apptRequest.onload = function () {
        open("index.html", "_self");
    }

    if (fullname == "" || phone == "" || address == "" || license == "" || engine == "" || cboMechanic.selectedIndex == 0) {
        alert("All the fields are required");
        return;
    }

    apptRequest.open("GET", "insertAppt.php?" +
        "session_id=" + getCookie("uid") +
        "&fullname=" + fullname +
        "&phone=" + phone +
        "&address=" + address +
        "&license=" + license +
        "&engine=" + engine +
        "&apptDate=" + apptDate +
        "&mechanic=" + mechanic +
        "&flagCar=" + flagCar +
        "&flagAddress=" + flagAddress);
    apptRequest.send();
}

function loadMechanics() {
    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function () {
        console.log(this.responseText);
        let mechanics = this.responseText.split("\n");

        for (let i = 1, end = cboMechanic.options.length; i < end; i++) cboMechanic.options.remove(1);
        for (let mechanic_info of mechanics) {
            if (mechanic_info == "") continue;
            mechanic_info = mechanic_info.split("MECSEP");
            mechanic_id = mechanic_info[0];
            mechanic_name = mechanic_info[1];
            cboMechanic.add(new Option(mechanic_name, mechanic_id));
        }
    };
    let apptDate = txtApptDate.value;
    xmlhttp.open("GET", "appt.php?session_id=" + getCookie("uid") + "&mechanic=true&apptDate=" + apptDate);
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
            if (address == "") continue;
            let cont = address.length > 20? "..." : "";
            cboAddress.add(new Option(address.substring(0, Math.min(20, address.length)) + cont, address));
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

        cboCar.onchange = function () {
            if (this.selectedIndex > 0) {
                txtCar.value = this.selectedOptions[0].text;
                txtEngine.value = this.value;
            } else {
                txtCar.value = "";
                txtEngine.value = "";
            }
        };

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