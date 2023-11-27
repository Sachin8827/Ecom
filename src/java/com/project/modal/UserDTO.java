/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.modal;
import com.project.service.GetConnection;
import java.sql.*;
/**
 *
 * @author hp
 */
public class UserDTO {
                    public boolean login(UserDAO edao) {
                                boolean b = false;

                                Connection con = GetConnection.getConnection();
                                System.out.println("Sachin");
                                System.out.println("Sachin"+edao.getPassword());
                                String encodedPass = encodePassword(edao.getPassword());

                                // Define the SQL query to select a user with the provided email and encoded password
                                String selectSql = "SELECT * FROM user WHERE email = ? AND password = ?";

                                try (PreparedStatement selectPs = con.prepareStatement(selectSql)) {
                                    selectPs.setString(1, edao.getEmail());
                                    selectPs.setString(2, encodedPass);

                                    ResultSet resultSet = selectPs.executeQuery();

                                    if (resultSet.next()) {
                                        // User found, set user attributes
                                        b = true;
                                        edao.setId(resultSet.getInt("id"));
                                        edao.setName(resultSet.getString("name"));
                                        edao.setLastName(resultSet.getString("lname"));
                                        edao.setFather(resultSet.getString("fname"));
                                        edao.setMobile(resultSet.getString("mobile"));
                                        edao.setEmail(resultSet.getString("email"));
                                        edao.setGender(resultSet.getString("gender"));

                                        // Decode and set the password
                                        String password = resultSet.getString("password");
                                        edao.setPassword(decodePassword(password));
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                } finally {
                                    try {
                                        if (con != null) {
                                            con.close();
                                        }
                                    } catch (SQLException ex) {
                                        ex.printStackTrace();
                                    }
                                }

                                return b;
                }
                    public boolean insertData(UserDAO edao) {
                            Connection connection = GetConnection.getConnection();
                            boolean success = false;

                            String selectSql = "SELECT * FROM user WHERE email = ?";
                            String insertSql = "INSERT INTO user (name, lname, fname, email, gender, mobile, password) VALUES (?, ?, ?, ?, ?, ?, ?)";

                            try (PreparedStatement selectPs = connection.prepareStatement(selectSql);
                                 PreparedStatement insertPs = connection.prepareStatement(insertSql)) {

                                selectPs.setString(1, edao.getEmail());
                                ResultSet resultSet = selectPs.executeQuery();

                                if (!resultSet.next()) {
                                    insertPs.setString(1, edao.getName());
                                    insertPs.setString(2, edao.getLastName()); // Add Last Name
                                    insertPs.setString(3, edao.getFather());
                                    insertPs.setString(4, edao.getEmail());
                                    insertPs.setString(5, edao.getGender()); // Add Gender
                                    insertPs.setString(6, edao.getMobile());

                                    // Encode the password
                                    String encodedPassword = encodePassword(edao.getPassword());
                                    insertPs.setString(7, encodedPassword);

                                    int rowsInserted = insertPs.executeUpdate();

                                    if (rowsInserted > 0) {
                                        success = true;
                                    }
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            } finally {
                                try {
                                    if (connection != null) {
                                        connection.close();
                                    }
                                } catch (SQLException ex) {
                                    ex.printStackTrace();
                                }
                            }

                            return success;
                        }
                    public boolean updateData(UserDAO edao) {
                                Connection connection = GetConnection.getConnection();
                                boolean success = false;
                                    
                                
                                String updateSql = "UPDATE user SET name = ?, lname = ?, fname = ?, gender = ?, mobile = ? WHERE id = ?";

                                try (
                                     PreparedStatement updatePs = connection.prepareStatement(updateSql)) {
                                     
                                    // Check if the new email already exists
                                    
                                    
                                    
                                   
                                    
                                    
                                        // The new email is not in use, proceed with the update
                                        updatePs.setString(1, edao.getName());
                                        
                                        updatePs.setString(2, edao.getLastName());
                                        System.out.println("sachin");
                                        updatePs.setString(3, edao.getFather());
                                        System.out.println("devendra");
                                        updatePs.setString(4, edao.getGender());
                                        System.out.println("shyam");
                                        updatePs.setString(5, edao.getMobile());
                                        System.out.println("shakil");
                                        updatePs.setInt(6, edao.getId());
                                        System.out.println("piysh");
                                        System.out.println("id : "+edao.getId());
                                        
                                        int rowsUpdated = updatePs.executeUpdate();
                                        System.out.println("Aman");
                                        if (rowsUpdated > 0) {
                                            success = true;
                                            System.out.println("Sachin tendulkar");
                                        }
                                    
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                } finally {
                                    try {
                                        if (connection != null) {
                                            connection.close();
                                        }
                                    } catch (SQLException ex) {
                                        ex.printStackTrace();
                                    }
                                }

                                return success;
                            }
                    public boolean  getUserById(UserDAO edao,int id){
                                    boolean b = false;

                                     Connection gcon = GetConnection.getConnection();

                                                String selectSql = "SELECT * FROM user WHERE id=?";

                                                try (PreparedStatement selectPs = gcon.prepareStatement(selectSql)) {
                                                    selectPs.setInt(1,id);

                                                    System.out.println("Bethade");

                                                    ResultSet rs = selectPs.executeQuery();

                                                    if (rs.next()) {
                                                        // Login successful
                                                        b = true;
                                                        edao.setId(rs.getInt("id"));
                                                        edao.setName(rs.getString("name"));
                                                        System.out.println(""+rs.getInt("id"));
                                                        edao.setLastName(rs.getString("lname"));
                                                        edao.setFather(rs.getString("fname"));
                                                        edao.setGender(rs.getString("gender"));
                                                        edao.setMobile(rs.getString("mobile"));
                                                        edao.setEmail(rs.getString("email"));
                                                    }

                                                } catch (SQLException e) {
                                                    e.printStackTrace();
                                                } finally {
                                                    try {
                                                        if (gcon != null) {
                                                            gcon.close();
                                                        }
                                                    } catch (SQLException ex) {
                                                        ex.printStackTrace();
                                                    }
                                                }


                                    return b;
                                }

                private String encodePassword(String password) {
                    byte[] enc = password.getBytes();
                            String encname = ""; 

                            for (int i = 0; i < enc.length; i++) {
                                if (!encname.isEmpty()) {
                                    encname += "A"; 
                                }
                                        int modifiedValue = enc[i] * 2;
                                        encname += modifiedValue;
                                }
                            return encname;
                }
                private String decodePassword(String encodedPassword) {
                   String[] tokens = encodedPassword.split("A");
                                            byte[] originalBytes = new byte[tokens.length];

                                            for (int i = 0; i < tokens.length; i++) {
                                                int modifiedValue = Integer.parseInt(tokens[i]);
                                                // Divide the modified value by 2 to obtain the original byte value
                                                originalBytes[i] = (byte) (modifiedValue / 2);
                                            }
                                            String decodedString = new String(originalBytes);
                             return decodedString;
                }
}
