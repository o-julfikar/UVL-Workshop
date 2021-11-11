var txtName = document.getElementById("txt-name");
var txtEmail = document.getElementById("txt-email");
var txtPass = document.getElementById("txt-pass");
var txtConfirm = document.getElementById("txt-confirm-pass");
var txtPhone = document.getElementById("txt-phone");
var txtAddress = document.getElementById("txt-address");

const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const cemail = urlParams.get("email");

txtEmail.value = cemail;

function register() {
    const registerRequest = new XMLHttpRequest();
    registerRequest.onload = function () {
        open("login.html?email=" + this.responseText, "_self");
    }

    registerRequest.open("GET", "register.php?" +
        "email=" + txtEmail.value +
        "&pass=" + txtPass.value +
        "&fullname=" + txtName.value +
        "&phone=" + txtPhone.value +
        "&address=" + txtAddress.value);
    registerRequest.send();
}