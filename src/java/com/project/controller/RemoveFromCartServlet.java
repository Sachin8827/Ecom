/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.project.controller;

import com.project.modal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author hp
 */
public class RemoveFromCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           System.out.println("Point Break : ");
            /* TODO output your page here. You may use following sample code. */
               int productId = Integer.parseInt(request.getParameter("product"));
                
            
            
        // Get the user's cart from the session
        HttpSession session = request.getSession();
        ArrayList<ProductDAO> userCart = (ArrayList<ProductDAO>) session.getAttribute("userCart");
        ArrayList<Integer> cart = (ArrayList<Integer>) session.getAttribute("cart");
        // Check if the cart is not null and contains the specified product ID
        if (userCart != null) {
            for (ProductDAO product : userCart) {
                if (product.getId() == productId) {
                    // Remove the product from the cart
                    
                    userCart.remove(product);
                    
                    
                    
                    break; // Assuming there is only one product with the specified ID in the cart
                    
                }
            }
        }
        if (cart != null) {
            for (Integer i : cart) {
                
                System.out.println("Point Break == "+productId);
                System.out.println("Return value :"+i.equals(productId) );
                if ( i.equals(productId)) {
                    // Remove the product from the cart
                    
                    cart.remove(i);
                    session.setAttribute("userCart", userCart);
                    System.out.println("Sachin will be wealthy");
                    session.setAttribute("cart", cart);
                   response.sendRedirect("Cart.jsp");
                    
                    break; // Assuming there is only one product with the specified ID in the cart
                    
                }
            }
             
        }
        
        

        // Update the user's cart in the session
        
       

        }
         
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
