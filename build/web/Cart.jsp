<%-- 
    Document   : Cart
    Created on : 21-Nov-2023, 10:20:51 am
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.project.modal.ProductDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="0">

        <title>JSP Page</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
          <style>
          .plusicon{
              color:green;
              font-size: 2rem;
          }
          .in{
              height: 35px;
              font-size: 2rem;
          }
          </style>
          <script>
            
                    function increaseQuantity(productId,price) {
                        var quantityInput = document.getElementById('quantity' + productId);
                        var currentQuantity = parseInt(quantityInput.value, 10);
                       
                        var v = currentQuantity + 1
                        quantityInput.value = v;
                         var price = price*v;
                        document.getElementById("price"+productId).innerHTML = price;
                       productrPrice();
                    }

                    function decreaseQuantity(productId,price) {
                        var quantityInput = document.getElementById('quantity' + productId);
                        var currentQuantity = parseInt(quantityInput.value, 10);
                        if (currentQuantity > 1) {
                            var v = currentQuantity - 1;
                        quantityInput.value = v;
                         var price = price*v;
                        document.getElementById("price"+productId).innerHTML = price;
                        }
                        productrPrice();
                    }
                    function productrPrice(){
                       var price = document.getElementsByClassName("productprice");
                       var totalPrice = 0;
                       
                       for(var i=0;i<price.length;i++){
                           totalPrice = parseInt(price[i].textContent)+totalPrice;
                       }
                       document.getElementById("price12").innerHTML = totalPrice;
                    }
                    
                    function removeFromCart(productId) {
                        // Send an AJAX request to the servlet to remove the product from the cart
                        $.ajax({
                            type: "GET",
                            url: "RemoveFromCartServlet",
                            data: { product: productId },
                            success: function(response) {
                                // Update the UI or perform any other necessary actions
                                // For example, you can remove the corresponding card from the DOM
                                $("#card" + productId).remove();
                            },
                            error: function(error) {
                                console.log("Error removing product from cart: " + error);
                            }
                        });
                    }


                    
    </script>
          
    </head>
    <body>
         <%
            response.setHeader("Cache-Control", "no-cache, no-store");
            response.setHeader("Pragma", "no-cache");
            
           String name =  (String)session.getAttribute("name");
            String e =  (String)session.getAttribute("email");
             if(e==null){
                    response.sendRedirect("UserLogin.jsp");
            }
//            int empid =  (int)session.getAttribute("id");
           
          
        %>
        <div id="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-12" >
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
                                                            session.setAttribute("userCart",null);
                                                            response.sendRedirect("UserLogin.jsp");
                               }
                        %>
                    </form>
                    <a class="mx-4 py-4"  href="">About Us</a>
                    <a class="mx-4 py-4" href="">Sign up</a>
                </div>
            </div>
        </div>
                                <%
                                    
                                    ArrayList<ProductDAO> userCart = (ArrayList<ProductDAO>)session.getAttribute("userCart");
                                   
                                    
                                    if (userCart != null && !userCart.isEmpty()) {
                                        for (int i = 0; i < userCart.size(); i++) {
                                            ProductDAO product = userCart.get(i);
                                                
                                %>
                                <div class="container mt-5">
                                    <div class="row">
                                    <div class="col-lg-6 col-md-8 col-sm-10" id="card<%= product.getId() %>">
                                         
                                       
                                        <div class="card-body">
                                            <div class="text-center">
                                                    <h2 class="card-title"><%= product.getProduct()%></h2>
                                            </div>
                                                    <p class="card-text"><%= product.getDiscription()%></p>
                                                    <h3> Price : <span id="price<%=product.getId()%>" class="productprice"><%= product.getPrice()%></span></h3>
                                                    <i class="fa fa-plus-circle plusicon mt-3" style="color: green" aria-hidden="true" id="plus<%=product.getId()%>" onclick="increaseQuantity(<%=product.getId()%>,<%= product.getPrice()%>)"></i>
                                                    <input type="text" class="ms-2 in" id="quantity<%=product.getId()%>" value="1" readonly>
                                                      <i class="fa fa-minus-circle plusicon mt-3" style="color: red" aria-hidden="true" id="minus<%=product.getId()%>" onclick="decreaseQuantity(<%=product.getId()%>,<%= product.getPrice()%>)"></i>
                                                       <button class="btn btn-danger" onclick="removeFromCart(<%= product.getId() %>)">Remove</button>
                                        </div>
                                     
                                        <div class="card-footer text-muted">
                                            2 days ago
                                        </div>
                                   
                                    </div>
                                        
                                    </div>
                                        
                                </div>
                    <%
                        }%>
                        <div class="container">
                            <div class="col-lg-5 col-md-4 col-sm-2">
                                <h2>Total Price : <span id="price12"></span></h2>
                        </div>
                        </div>
                   <% } else {
                    %>
                        <h1>Cart Empty</h1>
                    <%
                       }
                    %>

                    
    </body>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</html>
