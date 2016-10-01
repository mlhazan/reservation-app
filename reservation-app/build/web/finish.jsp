<%-- 
    Document   : finish
    Created on : Sep 29, 2016, 11:04:41 AM
    Author     : Hasan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.reservation.database.*" errorPage="error.jsp"%>

<html>
    <head><title>Confirm Reservation</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <%
            ConnectionBean connection= (ConnectionBean) session.getValue("connection");
            if (request.getParameter("commit") != null) {
                connection.commit();
            } else {
                connection.rollback();
            }
            session.removeAttribute("connection");
        %>
    <center>
        <table id="customers"><tr><td>
                    <% if (request.getParameter("commit") != null) { %>
                    <font size="+2" face="arial"><b>Reservations Confirmed</b></font>
                    <p>
                        Your Reservations confirmed, thanks...
                        <% } else { %>
                        <font size="+2" face="arial"><b>Reservations Canceled</b></font>
                    </p>
                    <p>
                        Your reservations have been canceled.
                    </p>
                    <% }%>
                    <p>
                        <a href="conference.jsp">Book Another Reservation</a>
                    </p>
                </td></tr></table>
    </body>
</html>