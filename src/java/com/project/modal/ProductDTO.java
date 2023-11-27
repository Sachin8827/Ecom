/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.modal;

import com.project.modal.EmployeeDAO;
import com.project.modal.ProductDAO;
import com.project.service.GetConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hp
 */
public class ProductDTO {
    public boolean insertProduct(ProductDAO pdao) {
        Connection gcon = GetConnection.getConnection();
                    boolean success = false;


                  
                    String insertSql = "INSERT INTO product (productName, price, description, category, stock, company,  dateofproduct) VALUES (?, ?, ?, ?, ?, ?, ?)";

                    try{
                         PreparedStatement insertPs = gcon.prepareStatement(insertSql) ;
                         insertPs.setString(1,pdao.getProduct());
                         insertPs.setInt(2,pdao.getPrice());
                         insertPs.setString(3, pdao.getDiscription());
                         insertPs.setString(4,pdao.getCategory());
                         insertPs.setInt(5, pdao.getStock());
                         insertPs.setString(6, pdao.getManufacure());
                         insertPs.setString(7, pdao.getDate());
                        
                            int rowsInserted = insertPs.executeUpdate();
                            if (rowsInserted > 0) {
                                success = true;
                            
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

                    return success;
                }
                public ProductDAO[] getAllProducts() {
                    Connection connection = GetConnection.getConnection();

                    String selectSql = "SELECT * FROM product";

                    try (PreparedStatement selectPs = connection.prepareStatement(selectSql);
                         ResultSet resultSet = selectPs.executeQuery()) {

                        int rowCount = getRowCount(resultSet);
                        ProductDAO[] productList = new ProductDAO[rowCount];

                        int index = 0;
                        while (resultSet.next()) {
                            ProductDAO product = new ProductDAO();
                            product.setid(resultSet.getInt("id"));
                            product.setProduct(resultSet.getString("productName"));
                            product.setPrice(resultSet.getInt("price"));
                            product.setDiscription(resultSet.getString("description"));
                            product.setCategory(resultSet.getString("category"));
                            product.setStock(resultSet.getInt("stock"));
                            product.setManufacure(resultSet.getString("company"));
                            product.setDate(resultSet.getString("dateofproduct"));

                            productList[index++] = product;
                        }

                        return productList;

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

                    return null; // Handle errors appropriately
                }
                private int getRowCount(ResultSet resultSet) throws SQLException {
                    int rowCount = 0;
                    if (resultSet.last()) {
                        rowCount = resultSet.getRow();
                        resultSet.beforeFirst();
                    }
                    return rowCount;
                }

}
