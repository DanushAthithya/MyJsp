<%@ page import = "java.sql.*,java.io.*,javax.servlet.*" %>
<html>
    <body>
        <%
            int busno = Integer.parseInt(request.getParameter("num"));
            int ticket = Integer.parseInt(request.getParameter("ticket"));
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root", "");
                String sql;
                sql = "UPDATE list set seats=(seats-?) where busnum=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, ticket);
                pstmt.setInt(2,busno);
                pstmt.executeUpdate();
                %>
                <h1>Successfully Booked <%=ticket%> Tickets for the Bus Number <%=busno%></h1>
                <%
                pstmt.close();
                conn.close();
            }
            catch(Exception e)
            {
                %>
                <h1>Invalid Input</h1>
                <%

                System.out.print("Do not connect to DB - Error:"+e);
            }
            %>
    </body>
</html>