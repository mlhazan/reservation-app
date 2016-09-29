<%-- 
    Document   : shuttle
    Created on : Sep 28, 2016, 7:46:40 PM
    Author     : Hasan
--%>

<%@ page import="java.sql.*,com.reservation.database.*" errorPage="error.jsp"%>
<jsp:useBean id="connection" class="com.reservation.database.ConnectionBean"
             scope="session"/>
<%
     String showID = request.getParameter("show");
     connection.setAutoCommit(false);
     String sql;
     sql = "UPDATE CONFERENCES set seats=seats-1 where id=" + showID;
     connection.executeUpdate(sql);
%>
<html>
     <head>
        <title>Conference Reservation Form</title>

       <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
    <center>
        <font size="+2" face="arial"><b>Shuttle Reservation</b></font>
        
        <form action="confirm.jsp" method="post">
            
                        <table id ="customers">
                            <tr><th>&nbsp;</th>
                                <th>Airport</th><th>Time</th><th>Seats Available</th></tr>
                                    <%
                                         sql = "SELECT s.* from shuttles s, conferences c where c.id="
                                                 + showID + " and s.airport = c.airport";
                                         ResultSet results = connection.executeQuery(sql);
                                         while (results.next()) {
                                              if (results.getInt("seats") > 0) {
                                    %>
                            <td>
                                <input type="radio" name="shuttle"
                                       value="<%= results.getString("id")%>"onClick="document.getElementById('button').disabled = false" />
                            </td>
                            <% } else { %>
                            <td>&nbsp;</td>
                            <% }%>
                            <td><%= results.getString("airport")%></td>
                            <td><%= results.getTime("time")%></td>
                            <td align="center"><%= results.getString("seats")%></td>
                </tr>
                <% }%>
            
            </table>
            <p>
                <input type="hidden" name="show" value="<%= showID%>">
             
                <input id="button" type="submit" disabled name="submit" value="Next (Review Reservations)">
        </form>
    </center>
</body>
</html>