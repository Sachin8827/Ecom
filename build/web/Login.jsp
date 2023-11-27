<%-- 
    Document   : Login.jsp
    Created on : 06-Nov-2023, 8:57:43 pm
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

    </script>
    <style>
        .error{
            color: red;
            
        }
    </style>
    </head>
    <body>
       <section class="vh-100" style="background-color: #508bfc;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center  h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card shadow-2-strong" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <h3 class="mb-5">Sign in</h3>

            <form action="Login" method="post">
                        <div class="form-outline mb-4">
                            <input type="email" id="email" class="form-control form-control-lg" onkeyup="validateEmail()" name="email" />
                          <label class="form-label" for="email">Email</label>
                          <p id="emailwarn" class="error"></p>
                        </div>

                        <div class="form-outline mb-4">
                          <input type="password" id="pass" class="form-control form-control-lg" onkeyup="validatePassword()"name="pass" />
                          <label class="form-label" for="pass">Password</label>
                          <p id="passwarn" class="error"></p>
                        </div>

                        <!-- Checkbox -->
                        <div class="form-check d-flex justify-content-start mb-4">
                          <input class="form-check-input" type="checkbox" value="" id="form1Example3" />
                          <label class="form-check-label" for="form1Example3"> Remember password </label>
                        </div>

                        <button class="btn btn-primary btn-lg btn-block" type="submit" >Login</button>
          </form>


            <hr class="my-4">
            <span>New User, </span>
            <a href="Register.jsp">Sign up</a> <br><br>
            <button class="btn btn-lg btn-block btn-primary" style="background-color: #dd4b39;"
              type="submit"><i class="fa fa-google me-2"></i> Sign in with google</button>
            <button class="btn btn-lg btn-block btn-primary mb-2 mt-2" style="background-color: #3b5998;"
              type="submit"><i class="fa fa-facebook-f me-2"></i>Sign in with facebook</button>

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
