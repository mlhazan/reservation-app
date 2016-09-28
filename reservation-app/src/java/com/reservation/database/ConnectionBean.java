package com.reservation.database;

import java.sql.*;
import javax.servlet.http.*;

/**
 *
 * @author Hasan
 */
public class ConnectionBean implements HttpSessionBindingListener {

     private Connection connection;
     private Statement statement;
     private static final String driver = "org.postgresql.Driver";
     private static final String dbURL = "jdbc:postgresql://localhost:5432/postgres";
     private static final String login = "hasan";
     private static final String password = "safe";

     public ConnectionBean() throws SQLException {
          try {
               Class.forName(driver);
               connection = DriverManager.getConnection(dbURL, login, password);
               statement = connection.createStatement();
          } catch (ClassNotFoundException e) {
               System.err.println("ConnectionBean: driver unavailable");
               connection = null;
          } catch (SQLException e) {
               System.err.println("ConnectionBean: driver not loaded");
               connection = null;
          }
     }

     public Connection getConnection() {
          return connection;
     }

     public void commit() throws SQLException {
          connection.commit();
     }

     public void rollback() throws SQLException {
          connection.rollback();
     }

     public void setAutoCommit(boolean autoCommit)
             throws SQLException {
          connection.setAutoCommit(autoCommit);
     }

     public ResultSet executeQuery(String sql) throws SQLException {
          return statement.executeQuery(sql);
     }

     public int executeUpdate(String sql) throws SQLException {
          return statement.executeUpdate(sql);
     }

     @Override
     public void valueBound(HttpSessionBindingEvent event) {
          System.err.println("ConnectionBean: in the valueBound method");
          try {
               if (connection == null || connection.isClosed()) {
                    connection
                            = DriverManager.getConnection(dbURL, login, password);
                    statement = connection.createStatement();
               }
          } catch (SQLException e) {
               connection = null;
          }
     }

     @Override
     public void valueUnbound(HttpSessionBindingEvent event) {
          try {
               connection.close();
          } catch (SQLException e) {
          } finally {
               connection = null;
          }
     }

     protected void finalize() {
          try {
               connection.close();
          } catch (SQLException e) {
          }
     }
}
