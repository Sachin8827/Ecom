/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.project.controller;

import com.project.modal.EmployeeDAO;
import com.project.modal.EmployeeDTO;
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
public class UpdateUser extends HttpServlet {

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
           HttpSession session;
            /* TODO output your page here. You may use following sample code. */
            
            String submit=request.getParameter("submit");
            if(submit.equals("update")){
            String newname = request.getParameter("newname");
            String newlast = request.getParameter("newlastname");
            String newfather = request.getParameter("newfather");
            String newemail = request.getParameter("newregemail");
            String newgender = request.getParameter("newgender");
            String contact = request.getParameter("newcontact");
                System.out.println(""+newgender);
           
           
           UserDAO edao = new UserDAO();
           edao.setName(newname);
            
           edao.setLastName(newlast);
           edao.setFather(newfather);
           session = request.getSession();
//            String old = (String) session.getAttribute("email");
//           edao.setOldemail(old);
            edao.setGender(newgender);
           edao.setEmail(newemail);
           edao.setId((int) session.getAttribute("id"));
           
           edao.setMobile(contact);
           
            UserDTO udto = new UserDTO();
            boolean b = udto.updateData(edao);
            
            if(b)
            {
                boolean updateUser = udto.getUserById(edao, edao.getId()); // Retrieve the updated data from the database
                
                if(updateUser)
                    session.setAttribute("id", edao.getId());
                    session.setAttribute("name", edao.getName());
                    session.setAttribute("last", edao.getLastName());
                    session.setAttribute("father", edao.getFather());
                    session.setAttribute("email", edao.getEmail());
                    session.setAttribute("gender", edao.getGender());
                    session.setAttribute("contact", edao.getMobile());
                    session.setAttribute("message", "Success");
                    response.sendRedirect("DashBoardUser.jsp");
            }
            else{
                session.setAttribute("message", "failed");
                response.sendRedirect("DashBoardUser.jsp");
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
