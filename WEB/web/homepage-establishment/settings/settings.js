/**
 * Created by Alex on 5/11/2017.
 */

window.onload = function() {
    // sendGetSettingsRequest
    var client = new XMLHttpRequest();
    client.onload = handleGetSettingsResponse;
    client.open("POST", "/WEB_war_exploded/app/account/settings/get", true);
    client.setRequestHeader("Content-type", "text/plain");
    client.send(getCookie("token"));
}

function handleGetSettingsResponse() {
    console.log("Status: " + this.status);
    if (this.status == 200 && this.responseText != null) {
        var response = this.responseText;
        console.log(response);
        if (response == "Invalid Token") {

        } else {
            var inComingJson = JSON.parse(response);
            document.getElementById("name").value = inComingJson.name;
            document.getElementById("phone").value = inComingJson.phone;
            document.getElementById("address").value = inComingJson.address;
            document.getElementById("zip").value = inComingJson.zip;
            document.getElementById("time-open").value = inComingJson.timeOpen;
            document.getElementById("time-close").value = inComingJson.timeClose;
        }
    } else {
        console.log("An error occurred");
    }
}

function sendChangePasswordRequest() {
    var json = {};
    json.token = getCookie("token");
    json.oldPassword = document.getElementById("old-password").value;
    json.newPassword = document.getElementById("password").value;
    if (json.newPassword != document.getElementById("password-confirm").value) {
        console.log("Passwords do not match");
        return;
    }
    var client = new XMLHttpRequest();
    client.onload = handleChangePasswordResponse;
    client.open("POST", "/WEB_war_exploded/app/account/settings/changePassword", true);
    client.setRequestHeader("Content-type", "text/plain");
    client.send(JSON.stringify(json));
}

function handleChangePasswordResponse() {
    if (this.status == 200 && this.responseText != null) {
        var response = this.responseText;
        if (response == "Password changed successfully") {
            document.getElementById("old-password").value = "";
            document.getElementById("password").value = "";
            document.getElementById("password-confirm").value = "";
        } else {
            // TODO tell the user password change failed and what went wrong
        }
        // for some reason this alert appears before above fields are cleared
        alert(response);
    } else {
        console.log("An error occurred");
    }
}

function sendSetSettingsRequest() {
    var json = {};
    json.token = getCookie("token");
    json.name = document.getElementById("name").value;
    json.phone = document.getElementById("phone").value;
    json.address = document.getElementById("address").value;
    json.zip = document.getElementById("zip").value;
    json.imageSrc = document.getElementById("imageSrc").value;
    json.timeOpen = document.getElementById("time-open").value;
    json.timeClose = document.getElementById("time-close").value;
    var client = new XMLHttpRequest();
    client.onload = handleSetSettingsResponse;
    client.open("POST", "/WEB_war_exploded/app/account/settings/set", true);
    client.setRequestHeader("Content-type", "text/plain");
    client.send(JSON.stringify(json));
}

function handleSetSettingsResponse() {
    console.log("Status: " + this.status);
    if (this.status == 200 && this.responseText != null) {
        var response = this.responseText;
        if (response == "Settings changed successfully") {

        } else {

        }
    } else {
        console.log("An error occurred");
    }
}