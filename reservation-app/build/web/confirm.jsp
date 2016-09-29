<%-- 
    Document   : confirm
    Created on : Sep 29, 2016, 10:47:50 AM
    Author     : Hasan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.reservation.database.*" errorPage="error.jsp"%>
<jsp:useBean id="connection" class="com.reservation.database.ConnectionBean" scope="session"/>
<!DOCTYPE html>

<%
     String sql;
     String shuttleID = request.getParameter("shuttle");
     String showID = request.getParameter("show");
   
     sql = "UPDATE shuttles set seats=seats-1 where id=" + shuttleID;
     connection.executeUpdate(sql);
     sql = "SELECT c.city, c.airport, s.time from conferences c, "
             + "shuttles s where c.id=" + showID + " and s.id=" + shuttleID;
     ResultSet results = connection.executeQuery(sql);
     results.next();
     

%>
<html>
    <head>
        <title>Conference Reservation Form</title>

        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
    <center>
        <font size="+2" face="arial"><B>Reservation Confirmation</b></font>
        <form action="finish.jsp" method=post>

            <table id="customers">
                <tr><th>Summary</th></tr>
                <tr><td>
                        Reservations have been requested for
                        the <b><%= results.getString("city")%></b>
                        show, with a complimentary shuttle from
                        the <b><%= results.getString("airport")%></b> airport
                        departing at <b><%= results.getTime("time")%></b>.
                        <p>
                            To confirm your reservations select commit below.
                        </p>
                    </td>
                </tr>
            </table>

            <p>
                <input type="submit" name="commit" value="Commit Reservation">
                <input type="submit" name="rollback" value="Cancel Reservations">
            </p>
        </form>
    </center>
</body>
</html>