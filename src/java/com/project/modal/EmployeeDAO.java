/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.modal;

import java.io.Serializable;


public class EmployeeDAO implements Serializable{
    private int id;
    private String name, fname,email,password,mobile,oldemail,oldpass;

    public String getOldpass() {
        return oldpass;
    }

    public void setOldpass(String oldpass) {
        this.oldpass = oldpass;
    }

    public String getOldemail() {
        
        return oldemail;
    }

    public void setOldemail(String oldemail) {
      
        
        this.oldemail = oldemail;
    }

    public EmployeeDAO() {
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id  = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    
    
}
