<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <style>
            .error{
                color: red;
            }
        </style>
        <script>
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
        </script>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control","no-cache,no-store");
            String e =  (String)session.getAttribute("email");
             if(e==null){
                    response.sendRedirect("Login.jsp");
            }
//            int empid =  (int)session.getAttribute("id");
           String name =  (String)session.getAttribute("name");
           String fname = (String)session.getAttribute("father");
           
           String contact =  (String)session.getAttribute("mobile");
           String password = (String)session.getAttribute("password");
          
        %>

        <div id="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-12">
                    <h1 class="mt-3 ms-3">Welcome : <%=name%></h1>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-12">
                    <form class="d-flex">
                        <input class="form-control me-2 my-4 border border-primary" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-primary my-4" type="submit">Search</button>
                    </form>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 d-flex">
                    <form action='' id="log">
                        <input type="submit" name="submit" value="Logout" class="btn btn-primary mt-4">
                        <%
                                String s = request.getParameter("submit");
                               if (s != "" && s != null && s.equals("Logout")) 
                               {
                                                           session.setAttribute("email", null);
                                                            session.invalidate();
                                                           
                                                            response.sendRedirect("Login.jsp");
                               }
                        %>
                    </form>
                    <a class="mx-4 py-4"  href="">About Us</a>
                    <a class="mx-4 py-4" href="">Sign up</a>
                </div>
            </div>
        </div>



        <!-- Modal -->
        <div class="text-center mt-5">
            <button class="btn btn-primary btn-center" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">View Profile</button>
        </div>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header">
                <h5 id="offcanvasRightLabel">Your Profile</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <table class="table table-bodered">
<!--                     <tr>
                        <td>
                            id
                        </td>
                        <td>
                            <%--=empid--%>
                        </td>
                    </tr>-->
                    <tr>
                        <td>
                            Name
                        </td>
                        <td>
                            <%=name%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Father Name
                        </td>
                        <td>
                            <%=fname%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            email
                        </td>
                        <td>
                            <%=e%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mobile
                        </td>
                        <td>
                            <%=contact%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password
                        </td>
                        <td>
                            <%=password%>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <!-- Button trigger modal -->
        <div class="text-center mt-5">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Update Profile
            </button>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Update Your profile here</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="yourFormId" onsubmit="return validateForm()" action="Update">

                            <div class="form-outline mb-4">
                                <input type="text" id="name" class="form-control form-control-lg" onkeyup="validateName()" name="newname" value="<%=name%>" />
                                <label class="form-label" for="name">Your Name</label>
                                <p id="namewarn" class="error"></p>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="text" id="fname" class="form-control form-control-lg" onkeyup="validateFatherName()" name="newfather" value="<%=fname%>" />
                                <label class="form-label" for="fname">Your Father Name</label>
                                <p id="fnamewarn" class="error"></p>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="email" id="email" class="form-control form-control-lg" onkeyup="validateEmail()"name="newregemail" value="<%=e%>"/>
                                <label class="form-label" for="email">Your Email</label>
                                <p id="emailwarn" class="error"></p>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="number" id="contact" class="form-control form-control-lg" onkeyup="validateMobileNumber()" name="newcontact" value="<%=contact%>" />
                                <label class="form-label" for="contact">Enter Mobile</label>
                                <p id="mobilewarn" class="error"></p>
                            </div>



                            <div class="form-check d-flex justify-content-center mb-5">
                                <input class="form-check-input me-2" type="checkbox" value="" id="agree" />
                                <label class="form-check-label" for="agree">
                                    I agree all statements in <a href="#!" class="text-body"><u>Terms of service</u></a>
                                </label>
                            </div>

                            <div class="d-flex justify-content-center">
                                <button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" value="update" name="submit">Update</button>
                            </div>



                        </form>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>
        <div class="text-center mt-5">
            <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">Change Password</button>
        </div>
        <div class="offcanvas offcanvas-top" tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel">
            <div class="offcanvas-header">
                <h5 id="offcanvasTopLabel">Change your password</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body text-center">
                <div class="mx-auto"> <!-- Center the table -->
                    <form action="Update">
                        <table class="table table-hover">
                        <tr>
                            <td>
                                Enter Old Password
                            </td>
                            <td>
                                <input type="text" placeholder="Old Password" name="old">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Enter New Password
                            </td>
                            <td>
                                <input type="password" id="password" placeholder="New Password" name="new" onkeyup="validatePassword()" >
                                <p id="passwordwarn" class="error"></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Confirm Password
                            </td>
                            <td>
                                <input type="password" id="confirmPassword"  placeholder="Confirm Password" name="new2" onkeyup="validateConfirmPassword()">
                                 <p id="confirmPasswordWarn" class="error"></p>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"> <!-- Span both columns -->
                                <input class="btn btn-primary" type="submit" name="submit" value="password" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
                <div class="text-center mt-5">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1">
              Add product
            </button>
                </div>>

            <!-- Modal -->
                    <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                           <div class="container mt-2">
                <form action="Product" method="post" onsubmit="return validateSubmit()">
                    <div class="form-group">
                        <label for="productName">Product Name:</label>
                        <input type="text" class="form-control" id="productName" name="productName" onkeyup="validateProductName()">
                        <p id="productnamewarn" class="error"></p>
                    </div>
                    
                    
                   <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="number" class="form-control" id="price" name="price" oninput="validatePrice()">
                        <p id="pricewarn" class="error"></p>
                    </div>


                   <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea class="form-control" id="description" name="description" rows="4" oninput="validateDescription()"></textarea>
                        <p id="descriptionwarn" class="error"></p>
                    </div>


                    <div class="form-group">
                        <label for="category">Category:</label>
                        <select class="form-control" id="category" name="category">
                            <option value="Mobile">Mobile</option>
                            <option value="Laptop">Laptop</option>
                            <option value="Accessories">Accessories</option>
                            <!-- Add more options as needed -->
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="stock_quantity">Stock Quantity:</label>
                        <input type="number" class="form-control" id="stock_quantity" name="stock_quantity" oninput="validateStockQuantity()">
                        <p id="stock_quantity_warn" class="error"></p>
                    </div>


                   <div class="form-group">
                        <label for="manufacturer">Manufacturer:</label>
                        <input type="text" class="form-control" id="manufacturer" name="manufacturer" oninput="validateManufacturer()">
                        <p id="manufacturer_warn" class="error"></p>
                    </div>


                    <div class="form-group">
                        <label for="date_added">Date Added:</label>
                        <input type="date" class="form-control" id="date_added" name="date_added" oninput="validateDateAdded()">
                        <p id="date_added_warn" class="error"></p>
                    </div>


                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                  </div>
                </div>
              </div>
            </div>                 
                                
                               

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
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
                                } else if (mobileInput.length < 10) {
                                    mobileWarning.innerHTML = "length should be 10";

                                } else if (!mobilePattern.test(mobileInput)) {
                                    mobileWarning.innerHTML = "Mobile number is not valid";
                                    return false;
                                } else {
                                    mobileWarning.innerHTML = "";
                                    return true;
                                }
                            }
                            function validateForm() {
                                // Call individual validation functions and store their results
                                const isNameValid = validateName();
                                const isFnameValid = validateFatherName();
                                const isEmailValid = validateEmail();
                                const isMobileValid = validateMobileNumber();


                                // Check if all validations pass
                                if (isNameValid && isFnameValid && isEmailValid && isMobileValid) {
                                    // All validations passed, submit the form

                                    return true;
                                } else {
                                    return false;
                                }
                            }
                            function validateProductName() {
                                const productnameInput = document.getElementById("productName").value.trim(); // Replace "name" with your input field's ID
                                const productnameWarning = document.getElementById("productnamewarn");

                                // Regular expression to match only letters and spaces
                                const namePattern = /^[A-Za-z0-9\s]+$/;

                                if (productnameInput.length === 0) {
                                    productnameWarning.innerHTML = "Product Name field is empty";
                                    return false;
                                } else if (!namePattern.test(productnameInput)) {
                                    productnameWarning.innerHTML = "Product Name can only contain letters and spaces and numbers";
                                    return false;
                                } else {
                                    productnameWarning.innerHTML = "";
                                    return true;
                                    // The name is valid; you can proceed with further actions or form submission.
                                }
                            }
                            function validatePrice() {
                                    const priceInput = document.getElementById("price").value.trim();
                                    const priceWarning = document.getElementById("pricewarn");

                                    // Regular expression to match a positive decimal number
                                    const pricePattern = /^\d+(\.\d{1,2})?$/;

                                    if (priceInput.length === 0) {
                                        priceWarning.innerHTML = "Price field is empty";
                                        return false;
                                    } else if (!pricePattern.test(priceInput)) {
                                        priceWarning.innerHTML = "Enter a valid price (e.g., 10 or 10.99)";
                                        return false;
                                    } else if (parseFloat(priceInput) > 50000) {
                                        priceWarning.innerHTML = "Price should not be greater than 50000";
                                        return false;
                                    } else {
                                        priceWarning.innerHTML = "";
                                        return true;
                                        // The price is valid; you can proceed with further actions or form submission.
                                    }
                                }
                                function validateDescription() {
                                    const descriptionInput = document.getElementById("description").value.trim();
                                    const descriptionWarning = document.getElementById("descriptionwarn");

                                    if (descriptionInput.length === 0) {
                                        descriptionWarning.innerHTML = "Description field is empty";
                                        return false;
                                    } else if (descriptionInput.length > 500) {
                                        descriptionWarning.innerHTML = "Description should not exceed 500 characters";
                                        return false;
                                    } else {
                                        descriptionWarning.innerHTML = "";
                                        return true;
                                        // The description is valid; you can proceed with further actions or form submission.
                                    }
                                }
                                function validateStockQuantity() {
                                        const stockQuantityInput = document.getElementById("stock_quantity").value.trim();
                                        const stockQuantityWarning = document.getElementById("stock_quantity_warn");

                                        if (stockQuantityInput.length === 0) {
                                            stockQuantityWarning.innerHTML = "Stock Quantity field is empty";
                                            return false;
                                        } else if (isNaN(stockQuantityInput) || parseInt(stockQuantityInput) <= 0) {
                                            stockQuantityWarning.innerHTML = "Enter a valid stock quantity";
                                            return false;
                                        } else if (parseInt(stockQuantityInput) > 500) {
                                            stockQuantityWarning.innerHTML = "Stock Quantity should not be more than 500 pieces";
                                            return false;
                                        } else {
                                            stockQuantityWarning.innerHTML = "";
                                            return true;
                                            // The stock quantity is valid; you can proceed with further actions or form submission.
                                        }
                                    }
                                    function validateManufacturer() {
                                        const manufacturerInput = document.getElementById("manufacturer").value.trim();
                                        const manufacturerWarning = document.getElementById("manufacturer_warn");

                                        // Regular expression to match only letters and spaces
                                        const manufacturerPattern = /^[A-Za-z\s]+$/;

                                        if (manufacturerInput.length === 0) {
                                            manufacturerWarning.innerHTML = "Manufacturer field is empty";
                                            return false;
                                        } else if (!manufacturerPattern.test(manufacturerInput)) {
                                            manufacturerWarning.innerHTML = "Manufacturer can only contain letters and spaces";
                                            return false;
                                        } else {
                                            manufacturerWarning.innerHTML = "";
                                            return true;
                                            // The manufacturer is valid; you can proceed with further actions or form submission.
                                        }
                                    }
                                    function validateDateAdded() {
                                        const dateAddedInput = document.getElementById("date_added").value.trim();
                                        const dateAddedWarning = document.getElementById("date_added_warn");

                                        if (dateAddedInput.length === 0) {
                                            dateAddedWarning.innerHTML = "Date Added field is empty";
                                            return false;
                                        } else {
                                            // You can add additional checks here, such as ensuring the date is within a specific range.
                                            // For example, if you want to ensure the date is not in the future, you can compare it with the current date.
                                            const currentDate = new Date().toISOString().split('T')[0];

                                            if (dateAddedInput > currentDate) {
                                                dateAddedWarning.innerHTML = "Date Added cannot be in the future";
                                                return false;
                                            }

                                            dateAddedWarning.innerHTML = "";
                                            return true;
                                            // The date is valid; you can proceed with further actions or form submission.
                                        }
                                    }
                                    function validateSubmit() {
                                            // Call individual validation functions and store their results
                                        const isProductNameValid = validateProductName();
                                        const isPriceValid = validatePrice();
                                        const isDescriptionValid = validateDescription();
                                        const isStockQuantityValid = validateStockQuantity();
                                        const isManufacturerValid = validateManufacturer();
                                        const isDateAddedValid = validateDateAdded();

                                        // Check if all validations pass
                                        if (
                                            isProductNameValid &&
                                            isPriceValid &&
                                            isDescriptionValid &&
                                            isStockQuantityValid &&
                                            isManufacturerValid &&
                                            isDateAddedValid
                                        ) {
                                            // All validations passed, submit the form
                                            return true;
                                        } else {
                                            return false;
                                        }
                                    }








        </script>
    </body>
</html>
