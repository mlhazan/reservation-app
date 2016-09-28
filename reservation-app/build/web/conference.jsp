<%@page import="java.sql.*,com.reservation.database.*"%>
<jsp:useBean id="connection" class="com.reservation.database.ConnectionBean" scope="session"/>
<html>
    <body>
    <center>
        <font size="+2" face="arial"><b>Conference Registration</b></font>
        <form action="shuttle.jsp" method="post">
            <table border=1 bgcolor="tan" width="50%" align="center">
                <tr><td>
                        <table border="0" bgcolor="white" cellspacing=0 width="100%">
                            <tr bgcolor="tan">
                                <th>&nbsp;</th><th>City</th><th>Tickets Remaining</th></tr>
                                    <%
                                         String sql = "SELECT * FROM CONFERENCES";
                                         ResultSet results = connection.executeQuery(sql);
                                         while (results.next()) {
                                              if (results.getInt("seats") > 0) {
                                    %>
                            <td>
                                <input type="radio" name="show"
                                       value="<%= results.getString("id")%>">
                            </td>
                            <% } else { %>
                            <td>&nbsp;</td>
                            <% }%>
                            <td><%= results.getString("city")%></td>
                            <td align="center"><%= results.getString("seats")%></td>
                </tr>
                <% }%>
            </table>
            </td></tr></table>
            <p>
                <input type="submit" value="Next (Choose Shuttle)">
        </form>
    </center>
</body>
</html>