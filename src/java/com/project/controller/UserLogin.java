/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.project.controller;


import com.project.modal.ProductDTO;
import com.project.modal.ProductDAO;
import com.project.modal.UserDAO;
import com.project.modal.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class UserLogin extends HttpServlet {

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
            
            /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("emaillog");
           String pass = request.getParameter("pass");
           UserDAO edao = new UserDAO();
           edao.setEmail(email);
           edao.setPassword(pass);
           
            UserDTO edto = new UserDTO();
            
            boolean b = edto.login(edao);
            
            if(b)
            {
               
                HttpSession session = request.getSession();
                       session.setAttribute("id", edao.getId());
                
                       session.setAttribute("name", edao.getName());
                       session.setAttribute("last",edao.getLastName());
                       session.setAttribute("father", edao.getFather());
                       session.setAttribute("email", edao.getEmail());
                       session.setAttribute("gender",edao.getGender());
                       session.setAttribute("mobile", edao.getMobile());
                       session.setAttribute("password",edao.getPassword());
                        response.sendRedirect("DashBoardUser.jsp");
                        ProductDTO pdto = new ProductDTO();
                        ProductDAO  prdao[] = pdto.getAllProducts();
                        session.setAttribute("product", prdao);
                
            }
            else{
                response.sendRedirect("UserLogin.jsp");
            }
            
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
