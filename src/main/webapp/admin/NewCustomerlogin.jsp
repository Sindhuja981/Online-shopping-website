<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        #password-strength {
            margin-top: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<jsp:include page='../Header.jsp'></jsp:include>

<form method='post' action='/ECommerceProject/AddRegistrationServlet' enctype='multipart/form-data'>
    <div class="container mt-2">
        <div class="card bg-info">
            <div class="card-body">
                <h2>New Customer</h2>
                <div class="row">
                    <div class="col-sm-6">
                        <label for="customerId">Customer id:</label>
                        <input type='number' name='customerId' class="form-control" id="customerId" size='20'><br>
                        <label for="firstname">First Name:</label>
                        <input type='text' name='firstname' class="form-control" id="firstname" size='20'><br>
                        <label for="lastname">Last Name:</label>
                        <input type='text' name='lastname' class="form-control" id="lastname" size='20'><br>
                        <label for="email">Email Id:</label>
                        <input type='email' name='emailid' class="form-control" id="email" size='30'><br>
                        <label for="password">Password:</label>
                        <input type='password' name='password' class="form-control" id="password" size='20' oninput="checkPasswordStrength(this.value)">
                        <div id="password-strength"></div>
                    </div>
                    <div class="col-sm-6">
                        <label for="mobile">Mobile:</label>
                        <input type='number' name='mobile' class="form-control" id="mobile" size='20'><br>
                        <label for="repassword">Re-enter Password:</label>
                        <input type='password' name='repassword' class="form-control" id="repassword" size='20' oninput="validatePasswords(this.value)">
                        <div id="cpwdLabel"></div>
                        <label for="profilePic">Profile Picture:</label>
                        <input type='file' name='profilePic' class="form-control" id="profilePic" size='20'><br>
                        <label for="Date">Registration Date:</label>
                        <input type='date' name='Date' class="form-control" id="Date" size='20'><br>
                    </div>
                </div>
                <div class='row'>
                    <div class='col-md-6'>
                        <input class='btn btn-outline-dark' type="submit" name='submit' value='Register'>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    function checkPasswordStrength(password) {
        var strength = 0;
        if (password.length >= 8) {
            strength += 1;
        }
        if (/[a-z]/.test(password) && /[A-Z]/.test(password)) {
            strength += 1;
        }
        if (/\d/.test(password)) {
            strength += 1;
        }
        if (/[$&+,:;=?@#|'<>.^*()%!-]/.test(password)) {
            strength += 1;
        }
        var strengthText = "";
        switch (strength) {
            case 0:
            case 1:
                strengthText = "Weak";
                break;
            case 2:
                strengthText = "Moderate";
                break;
            case 3:
            case 4:
                strengthText = "Strong";
                break;
        }
        document.getElementById("password-strength").innerHTML = "Password Strength: " + strengthText;
        if (strengthText == "Weak") {
            document.getElementById("password-strength").style.color = 'red';
        } else if (strengthText == "Moderate") {
            document.getElementById("password-strength").style.color = 'blue';
        } else if (strengthText == "Strong") {
            document.getElementById("password-strength").style.color = 'green';
        }
    }
    function validatePasswords(cpassword) {
        var cpwd = document.getElementById("password").value;
        if (cpassword == cpwd) {
            document.getElementById("cpwdLabel").innerHTML = "Passwords match";
            document.getElementById("cpwdLabel").style.color = "green";
        } else {
            document.getElementById("cpwdLabel").innerHTML = "Passwords not match";
            document.getElementById("cpwdLabel").style.color = "red";
        }
    }
</script>

<jsp:include page='../footer.jsp'></jsp:include>
</body>
</html>
