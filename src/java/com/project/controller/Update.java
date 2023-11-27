/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.project.controller;

import com.project.modal.EmployeeDAO;
import com.project.modal.EmployeeDTO;
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
public class Update extends HttpServlet {

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
            HttpSession session;
            /* TODO output your page here. You may use following sample code. */
            String submit=request.getParameter("submit");
            if(submit.equals("update")){
            String name = request.getParameter("newname");
            String father = request.getParameter("newfather");
            String newemail = request.getParameter("newregemail");
            String contact = request.getParameter("newcontact");
            
           
           
           EmployeeDAO edao = new EmployeeDAO();
           edao.setName(name);
            
        
           edao.setFname(father);
           session = request.getSession();
            String old = (String) session.getAttribute("email");
           edao.setOldemail(old);
           edao.setEmail(newemail);
           edao.setId((int) session.getAttribute("id"));
          
           edao.setMobile(contact);
           
            EmployeeDTO edto = new EmployeeDTO();
            boolean b = edto.Update(edao);
            if(b)
            {
                boolean updatedEmployee = edto.getEmployeeById(edao, edao.getId()); // Retrieve the updated data from the database
                if(updatedEmployee)
                session.setAttribute("name", edao.getName());
                session.setAttribute("father", edao.getFname());
                session.setAttribute("email", edao.getEmail());
                session.setAttribute("contact", edao.getMobile());
                response.sendRedirect("DashBoard.jsp");
            }
            else{
                response.sendRedirect("Register.jsp");
            }
            }
           
            if(submit.equals("password")){
                    String old = request.getParameter("old");
                    String n = request.getParameter("new");
                   
                     EmployeeDAO edao = new EmployeeDAO();
                     edao.setOldpass(old);
                     edao.setPassword(n);
                     session=request.getSession();
                     System.out.println("Sachin id : "+session.getAttribute("id"));
                      edao.setId((int)session.getAttribute("id"));
                      edao.setEmail((String)session.getAttribute("email"));
                      EmployeeDTO edto = new EmployeeDTO();
                       boolean b = edto.updatePassword(edao);
                       System.out.println("Sachin : "+b);
                       if(b){
                           session.setAttribute("password",edao.getPassword());
                           session.setAttribute("message","Password change Succesfully");
                           response.sendRedirect("DashBoard.jsp");
                       }
                       else{
                           session = request.getSession();
                           session.setAttribute("message","Password change failed");
                           response.sendRedirect("DashBoard.jsp");
                       }
                     
                    
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
