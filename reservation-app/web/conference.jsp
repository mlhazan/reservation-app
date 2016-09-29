<%@page import="java.sql.*,com.reservation.database.*" errorPage="error.jsp"%>
<jsp:useBean id="connection" class="com.reservation.database.ConnectionBean" scope="session"/>
<html>
    <head>
        <title>Conference Reservation Form</title>

       <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
    <center>
        <font size="+2" face="arial"><b>Conference Registration</b></font>
        
        <form action="shuttle.jsp" method="post">
            <table id="customers">

                <tr>
                    <th>&nbsp;</th><th>City</th><th>Tickets Remaining</th></tr>
                        <%
                             String sql = "SELECT * FROM CONFERENCES";
                             ResultSet results = connection.executeQuery(sql);
                             while (results.next()) {
                                  if (results.getInt("seats") > 0) {
                        %>
                <tr>
                    <td>
                        <input type="radio" name="show"
                               value="<%= results.getString("id")%>" onClick="document.getElementById('button').disabled = false" />
                    </td>
                    <% } else { %>
                    <td>&nbsp;</td>
                    <% }%>
                    <td><%= results.getString("city")%></td>
                    <td align="center"><%= results.getString("seats")%></td>
                </tr>
                <% }%>
            </table>

            <p>
                <input id="button" type="submit" disabled name="submit" value="Next (Choose Shuttle)" disabled>
        </form>
    </center>
</body>
</html>