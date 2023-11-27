<%-- 
    Document   : Register
    Created on : 06-Nov-2023, 9:59:10 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-3yHD5uzSO3VwbHlckyW2w+pNfr+2vLXqVMCzgU2fBbb50pmmUaH1z3sF5HvpFnp7R" crossorigin="anonymous">

        
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
       <script>
           function validateName() {
                        const nameInput = document.getElementById("name").value.trim(); // Replace "name" with your input field's ID
                        const nameWarning = document.getElementById("namewarn");

                        // Regular expression to match only letters and spaces
                        const namePattern = /^[A-Za-z\s]+$/;

                        if (nameInput.length === 0) {
                          nameWarning.innerHTML = "Name field is empty";
                          return false;
                        } else if (!namePattern.test(nameInput)) {
                          nameWarning.innerHTML = "Name can only contain letters and spaces";
                          return false;
                        } else { 
                          nameWarning.innerHTML = "";
                          return true;
                          // The name is valid; you can proceed with further actions or form submission.
                        }
            }
            function validateFatherName() {
                        const fnameInput = document.getElementById("fname").value.trim(); // Replace "name" with your input field's ID
                        const fnameWarning = document.getElementById("fnamewarn");

                        // Regular expression to match only letters and spaces
                        const fnamePattern = /^[A-Za-z\s]+$/;

                        if (fnameInput.length === 0) {
                          fnameWarning.innerHTML = "father Name field is empty";
                          return false;
                        } else if (!fnamePattern.test(fnameInput)) {
                          fnameWarning.innerHTML = "father Name can only contain letters and spaces";
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
                                const isNameValid =validateName();
                                const isFnameValid = validateFatherName();
                                const isEmailValid = validateEmail();
                                const isMobileValid = validateMobileNumber();
                                const isPasswordValid = validatePassword();
                                const isConfirmPasswordValid = validateConfirmPassword();

                                // Check if all validations pass
                                if (isNameValid && isFnameValid && isEmailValid && isMobileValid && isPasswordValid && isConfirmPasswordValid) {
                                  // All validations passed, submit the form
                                  document.getElementById("success").innerHTML = "success";
                                  return true;
                                }
                                else{
                                    return false;
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
                                    if (isNameValid && isLastNameValid && isEmailValid && isMobileValid && isPasswordValid && isConfirmPasswordValid) {
                                        // All validations passed, submit the form
                                        return true;
                                    } else {
                                        // At least one validation failed, do not submit the form
                                        return false;
                                    }
                                }





       </script>
       <style>
           .error{
               color: red;
           }
       </style>
    </head>
    <body>
        <section class="vh-100 bg-image"
            style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
            <div class="mask d-flex align-items-center h-100 gradient-custom-3">
              <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                  <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px;">
                      <div class="card-body p-5">
                        <h2 class="text-uppercase text-center mb-5">Create an account</h2>

                        <form id="yourFormId" onsubmit="return validateForm()" action="Registration">

                          <div class="form-outline mb-4">
                              <input type="text" id="name" class="form-control form-control-lg" onkeyup="validateName()" name="name" />
                            <label class="form-label" for="name">Your Name</label>
                            <p id="namewarn" class="error"></p>
                          </div>
                            
                             <div class="form-outline mb-4">
                                 <input type="text" id="fname" class="form-control form-control-lg" onkeyup="validateFatherName()" name="father" />
                            <label class="form-label" for="fname">Your Father Name</label>
                            <p id="fnamewarn" class="error"></p>
                          </div>

                          <div class="form-outline mb-4">
                            <input type="email" id="email" class="form-control form-control-lg" onkeyup="validateEmail()"name="regemail"/>
                            <label class="form-label" for="email">Your Email</label>
                            <p id="emailwarn" class="error"></p>
                          </div>
                            
                            <div class="form-outline mb-4">
                                <input type="number" id="contact" class="form-control form-control-lg" onkeyup="validateMobileNumber()" name="contact" />
                            <label class="form-label" for="contact">Enter Mobile</label>
                            <p id="mobilewarn" class="error"></p>
                          </div>

                          <div class="form-outline mb-4">
                              <input type="password" id="password" class="form-control form-control-lg" onkeyup="validatePassword()" name="password" />
                            <label class="form-label" for="password">Password</label>
                            <p id="passwordwarn" class="error"></p>
                            
                          </div>

                          <div class="form-outline mb-4">
                              <input type="password" id="confirmPassword" class="form-control form-control-lg"  onkeyup="validateConfirmPassword()"/>
                            <label class="form-label" for="confirmPassword">Repeat your password</label>
                            <p id="confirmPasswordWarn" class="error"></p>
                          </div>

                          <div class="form-check d-flex justify-content-center mb-5">
                            <input class="form-check-input me-2" type="checkbox" value="" id="agree" />
                            <label class="form-check-label" for="agree">
                              I agree all statements in <a href="#!" class="text-body"><u>Terms of service</u></a>
                            </label>
                          </div>

                          <div class="d-flex justify-content-center">
                                <button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
                          </div>

                          <p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="Login.jsp"
                              class="fw-bold text-body"><u>Login here</u></a></p>
                              <h1 id="success"></h1>

                        </form>

                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
</section>
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>    
    
    </body>
</html>
