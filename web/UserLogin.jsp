<%-- 
    Document   : UserLogin
    Created on : 09-Nov-2023, 12:20:43 am
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <script>
        function validateEmail() {
                            const emailInput = document.getElementById("email").value.trim();
                            const emailWarning = document.getElementById("emailwarn");
                            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

                            if (emailInput.length === 0) {
                              emailWarning.innerHTML = "Email field is empty";
                            } else if (!emailPattern.test(emailInput)) {
                              emailWarning.innerHTML = "Email is not valid";
                            } else {
                              emailWarning.innerHTML = ""; 
              }
          }
          function validatePassword() {
                        const passwordInput = document.getElementById("pass").value.trim();
                        const passwordWarning = document.getElementById("passwarn");

                        if (passwordInput.length === 0) {
                          passwordWarning.innerHTML = "Password field is empty";
                        } else {
                          passwordWarning.innerHTML = "";
                        }
          }
          function validateForm() {
                        const isEmailValid = validateEmail();
                        const isPasswordValid = validatePassword();

                        if (isEmailValid && isPasswordValid) {
                            return true;
                        } else {
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
    
  <!-- Email input -->
  <div class="row mt-5">
      <div class="col-lg-5 col-md-3">
          
      </div>
      <div class="col-lg-3 col-md-6 col-sm-12">
          <h1>Login Form</h1>
          <form action="UserLogin" onsubmit="return validateForm()">
                  <div class="form-outline mb-4 mt-4">
                      <input type="email" id="emaillog" class="form-control" onkeyup="validateEmail()" name="emaillog" />
                  <label class="form-label" for="emaillog">Email address</label>
                  <p id="emailwarn" class="error"></p>
                </div>

                <!-- Password input -->
                <div class="form-outline mb-4">
                    <input type="password" id="pass" class="form-control" onkeyup="validatePassword()" name="pass" />
                  <label class="form-label" for="pass">Password</label>
                  <p id="passwarn" class="error"></p>
                </div>

                <!-- 2 column grid layout for inline styling -->
                <div class="row mb-4">
                  <div class="col d-flex justify-content-center">
                    <!-- Checkbox -->
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
                      <label class="form-check-label" for="form2Example31"> Remember me </label>
                    </div>
                  </div>

                  <div class="col">
                    <!-- Simple link -->
                    <a href="#!">Forgot password?</a>
                  </div>
                </div>

                <!-- Submit button -->
                <button class="btn btn-primary btn-lg btn-block" type="submit" >Login</button>

                <!-- Register buttons -->
                <div class="text-center">
                  <p>Not a member? <a href="RegisterUser.jsp">Register</a></p>
                  <p>or sign up with:</p>
                  <button type="button" class="btn btn-link btn-floating mx-1">
                    <i class="fab fa-facebook-f"></i>
                  </button>

                  <button type="button" class="btn btn-link btn-floating mx-1">
                    <i class="fab fa-google"></i>
                  </button>

                  <button type="button" class="btn btn-link btn-floating mx-1">
                    <i class="fab fa-twitter"></i>
                  </button>

                  <button type="button" class="btn btn-link btn-floating mx-1">
                    <i class="fab fa-github"></i>
                  </button>
                </div>
              </form>
      </div>
      <div class="col-lg-3 col-md-3">
          
      </div>
  </div>

    <!-- Include Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
