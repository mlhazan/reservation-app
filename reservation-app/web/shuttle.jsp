<%-- 
    Document   : shuttle
    Created on : Sep 28, 2016, 7:46:40 PM
    Author     : Hasan
--%>

<%@ page import="java.sql.*,com.reservation.database.*"%>
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
    <body>
    <center>
        <font size="+2" face="arial"><b>Shuttle Reservation</b></font>
        <form action="confirm.jsp" method="post">
            <table border=1 bgcolor="tan" width="50%" align="center">
                <tr><td>
                        <table border="0" bgcolor="white" cellspacing=0 width="100%">
                            <tr bgcolor="tan"><th>&nbsp;</th>
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
                                       value="<%= results.getString("id")%>">
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
            </td></tr></table>
            <p>
                <input type="hidden" name="show" value="<%= showID%>">
                <input type="submit" value="Next (Review Reservations)">
        </form>
    </center>
</body>
</html>