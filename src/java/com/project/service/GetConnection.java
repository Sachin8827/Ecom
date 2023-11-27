/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.service;
import java.sql.*;

public class GetConnection {
    public static Connection getConnection(){
//        System.setProperty("javax.net.debug", "ssl");

        Connection con = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MVC","root","root");
        }
        catch(Exception e){
           e.printStackTrace();
        }
        return con;
        
    } 
}
