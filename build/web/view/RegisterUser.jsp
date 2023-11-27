<%-- 
    Document   : RegisterUser
    Created on : 08-Nov-2023, 8:41:09 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            max-width: 500px;
            margin-top: 50px;
        }
        .error{
            color: red;
        }
        
    </style>
    <script>
        function validateName() {
                        const nameInput = document.getElementById("name").value.trim(); // Replace "name" with your input field's ID
                        const nameWarning = document.getElementById("namewarn");

                        // Regular expression to match only letters and spaces
                        const namePattern = /^[A-Za-z]+$/;


                        if (nameInput.length === 0) {
                          nameWarning.innerHTML = "Name field is empty";
                          return false;
                        } else if (!namePattern.test(nameInput)) {
                          nameWarning.innerHTML = "Name can only contain letters";
                          return false;
                        } else { 
                          nameWarning.innerHTML = "";
                          return true;
                          // The name is valid; you can proceed with further actions or form submission.
                        }
            }
            function validateLastName() {
                        const lnameInput = document.getElementById("lname").value.trim(); // Replace "name" with your input field's ID
                        const lnameWarning = document.getElementById("lastwarn");

                        // Regular expression to match only letters and spaces
                        const namePattern = /^[A-Za-z]+$/;

                        if (lnameInput.length === 0) {
                          lnameWarning.innerHTML = "Last Name field is empty";
                          return false;
                        } else if (!namePattern.test(lnameInput)) {
                          lnameWarning.innerHTML = "Last Name can only contain letters";
                          return false;
                        } else {
                          lnameWarning.innerHTML = "";
                          return true;
                          // The name is valid; you can proceed with further actions or form submission.
                        }
            }
            function validateFatherName() {
                        const fnameInput = document.getElementById("fname").value.trim(); // Replace "name" with your input field's ID
                        const fnameWarning = document.getElementById("fnamewarn");

                        // Regular expression to match only letters and spaces
                        const namePattern = /^[A-Za-z]+$/;

                        if (fnameInput.length === 0) {
                          fnameWarning.innerHTML = "father Name field is empty";
                          return false;
                        } else if (!namePattern.test(fnameInput)) {
                          fnameWarning.innerHTML = "father Name can only contain letters";
                          return false;
                        } else {
                          fnameWarning.innerHTML = "";
                          return true;
                          // The name is valid; you can proceed with further actions or form submission.
                        }
            }
            
            function validateEmail() {
                            const emailInput = document.getElementById("email").value.trim();
                            const emailWarning = document.getElementById("emailwarn");
                            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

                            if (emailInput.length === 0) {
                              emailWarning.innerHTML = "Email field is empty";
                              return false;
                            } else if (!emailPattern.test(emailInput)) {
                              emailWarning.innerHTML = "Email is not valid";
                              return false;
                            } else {
                              emailWarning.innerHTML = ""; 
                              return true;
                            }
          }
          function validateGender() {
                            const genderSelect = document.getElementById("gender");
                            const genderWarning = document.getElementById("genderwarn");

                            if (genderSelect.value === "") {
                                genderWarning.innerHTML = "Please select a gender.";
                                return false;
                            } else {
                                genderWarning.innerHTML = "";
                                return true;
                            }
          }
          function validateMobileNumber() {
                        const mobileInput = document.getElementById("contact").value.trim();
                        const mobileWarning = document.getElementById("mobilewarn");
                        const mobilePattern = /^[6-9]\d{0,9}$/; // Matches numbers starting with 6, 7, 8, or 9 and up to 10 digits.

                        if (mobileInput.length === 0) {
                          mobileWarning.innerHTML = "Mobile number is empty";
                          return false;
                        }else if(mobileInput.length<10){
                             mobileWarning.innerHTML = "length should be 10";
                            
                        }else if (!mobilePattern.test(mobileInput)) {
                          mobileWarning.innerHTML = "Mobile number is not valid";
                          return false;
                        } else {
                          mobileWarning.innerHTML = "";
                          return true;
                        }
                      }
                      function validatePassword() {
                            const passwordInput = document.getElementById("password").value.trim();
                            const passwordWarning = document.getElementById("passwordwarn");

                            // Regular expression for password validation
                            const passwordPattern = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

                            if (passwordInput.length < 8) {
                              passwordWarning.innerHTML = "Password should be at least 8 characters long";
                              return false;
                            } else if (!passwordPattern.test(passwordInput)) {
                              passwordWarning.innerHTML = "Password is not strong enough";
                              return false;
                            } else {
                              passwordWarning.innerHTML = "";
                              return true;
                            }
                       }
                       function validateConfirmPassword() {
                            const passwordInput = document.getElementById("password").value.trim();
                            const confirmPasswordInput = document.getElementById("confirmPassword").value.trim();
                            const confirmPasswordWarning = document.getElementById("confirmPasswordWarn");

                            if (confirmPasswordInput !== passwordInput) {
                              confirmPasswordWarning.innerHTML = "Passwords do not match";
                              return false;
                            } else {
                              confirmPasswordWarning.innerHTML = "";
                              return true;
                            }
                       }
                        function validateForm() {
                                    // Call individual validation functions and store their results
                                    const isNameValid = validateName();
                                    const isLastNameValid = validateLastName(); // Added for Last Name validation
                                    const isfnameValid  = validateFatherName()
                                    const isEmailValid = validateEmail();
                                    const isMobileValid = validateMobileNumber();
                                    const isPasswordValid = validatePassword();
                                    const isGenderValid  = validateGender();
                                    const isConfirmPasswordValid = validateConfirmPassword();

                                    // Check if all validations pass
                                    if (isNameValid && isLastNameValid && isfnameValid && isEmailValid &&isGenderValid && isMobileValid && isPasswordValid && isConfirmPasswordValid) {
                                        // All validations passed, submit the form
                                        return true;
                                    } else {
                                        // At least one validation failed, do not submit the form
                                        return false;
                                    }
                                }

    </script>
</head>
<body>

<div class="container">
    <h2 class="text-center">Registration Form</h2>
    <form action="UserRegistration" method="POST">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" onkeyup="validateName()">
              <p id="namewarn" class="error"></p>
        </div>
        <div class="form-group">
            <label for="lname">Last Name:</label>
            <input type="text" class="form-control" id="lname" name="lname" onkeyup="validateLastName()">
             <p id="lastwarn" class="error"></p>
        </div>
        <div class="form-group">
            <label for="fname">Father name:</label>
            <input type="text" class="form-control" id="fname" name="fname" onkeyup="validateFatherName()">
             <p id="fnamewarn" class="error"></p>
        </div>
        
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" name="email" onkeyup="validateEmail()">
             <p id="emailwarn" class="error"></p>
        </div>
        <div class="form-group">
            <label for="gender">Gender:</label>
            <select class="form-control" id="gender" name="gender" onchange="validateGender()">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
            <p id="genderwarn" class="error"></p>
        </div>
        <div class="form-group">
            <label for="mobile">Mobile:</label>
            <input type="text" class="form-control" id="contact" name="mobile" onkeyup="validateMobileNumber()">
            <p id="mobilewarn" class="error"></p>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" class="form-control" id="password" name="password" onkeyup="validatePassword()">
            <p id="passwordwarn" class="error"></p>
        </div>
        <div class="form-group">
            <label for="confirmpassword">Confirm Password:</label>
            <input type="password" class="form-control" id="confirmPassword" name="password" onkeyup="validateConfirmPassword()">
             <p id="confirmPasswordWarn" class="error"></p>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Submit</button>
         <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="UserLogin.jsp"
                              class="fw-bold text-body"><u>Login here</u></a></p>
    </form>
</div>

<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

