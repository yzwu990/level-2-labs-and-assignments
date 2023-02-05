function validate() {

    // Clear error messages
    var spans = document.getElementsByTagName("span");
    for (let i = 0, lenSpan = spans.length; i != lenSpan; i++) {
        spans[0].remove();
    }


    // Set borders to black if user's inputs are corret after wrong attempts
    var inputs = document.getElementsByTagName("input");
    for (let j = 0, lenInput = inputs.length; j != lenInput; j++) {
        inputs[j].style.borderColor = "black";
    }


    // Get values
    var email = document.getElementById("email").value;
    var login = document.getElementById("login").value;
    var password = document.getElementById("pass").value;
    var password2 = document.getElementById("pass2").value;
    var check1 = document.getElementById("newsletter").checked;
    var check2 = document.getElementById("terms").checked;

    /* Regular expressions */

    // Email: xyz@xyz.xyz
    let emailRegEx = /\S+@\S+\.\S+/;

    // User name: can not be empty, less than 20 characters
    let loginRegEx = /^[a-zA-Z0-9]{1,19}$/;

    // Password: at least 6 characters, at least 1 uppercase letter and at least 1 lowercase letter
    let passwordRegex = /^(?=.{6,})(?=.*[a-z])(?=.*[A-Z]).*$/

    // Return conditions.
    let flag = true;

    // Check Email
    if (!emailRegEx.test(email)) {
        flag = false;
        errorMessage("emailField", "\u2718 Email address should be non-empty with the format xyx@xyz.xyz.");
    }

    // Check Username
    if (!loginRegEx.test(login)) {
        flag = false;
        errorMessage("loginField", "\u2718 User name should be non-empty,and within 20 characters long.");
    } else {
        login = document.getElementById("login").value.toLowerCase();
        document.getElementById("login").value = login;
    }

    // Check Password
    if (!passwordRegex.test(password)) {
        flag = false;
        errorMessage("passField", "\u2718 Password should be at least 6 characters:1 uppercase,1 lowercase.");
    }

    // Check Re-type Password
    if (password2 !== password || !passwordRegex.test(password2)) {
        flag = false;
        errorMessage("pass2Field", "\u2718 Please retype password.");
    }

    // Check agreement
    if (check2 == false) {
        flag = false;
        errorMessage("termsField", "\u2003 \u2718 Please accept the terms and conditions.");
    }


    return flag;
}

// Display error messages and set border to red 
function errorMessage(parentNode, message) {
    var messageP = document.createElement("span");
    messageP.style.color = "red";
    var parent = document.getElementById(parentNode);
    parent.appendChild(messageP);
    messageP.innerHTML = message;
    parent.getElementsByTagName("input")[0].style.borderColor = "red";

}


// Alert messages when newsletter is checked
function alertNewsletter() {
    if (document.getElementById("newsletter").checked == true) {
        alert("If you don't receive our emails, please check your spam.")
    }
}
