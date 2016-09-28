/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.reservation.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 *
 * @author Hasan
 */
public class Test {

     public static void main(String[] args) throws SQLException, ClassNotFoundException {
          Class.forName("org.postgresql.Driver");
          String url = "jdbc:postgresql://localhost:5432/postgres";
          Properties props = new Properties();
          props.setProperty("user", "hasan");
          props.setProperty("password", "safe");
         
          Connection conn = DriverManager.getConnection(url, props);

          Statement st = conn.createStatement();
          ResultSet rs = st.executeQuery("SELECT * FROM conferences WHERE seats >0");
          while (rs.next()) {
               System.out.print("Column 1 returned ");
               System.out.println(rs.getString(1));
          }
          rs.close();
          st.close();

          
          while (rs.next()) {
               System.out.print("Column 1 returned ");
               System.out.println(rs.getString(1));
          }
          rs.close();
          st.close();
     }
}
