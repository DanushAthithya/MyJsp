<%@ page import = "java.sql.*,java.io.*,javax.servlet.*" %>
<html>
    <body>
        <%
            try{
                String nam = request.getParameter("username");
                int amount = Integer.parseInt(request.getParameter("amount"));
                int tot = Integer.parseInt(request.getParameter("balance"));
                int balance=amount-tot;
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket","root", "");
                String sql;
                sql = "UPDATE credentials set amount=? where username=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, balance);
                pstmt.setString(2, nam);
                pstmt.executeUpdate();
                %>
                <h1>Successfully Purchased</h1>
                <%
                pstmt.close();
                conn.close();
            }
            catch(Exception e)
            {
                System.out.print("Do not connect to DB - Error:"+e);
            }
            %>
    </body>
</html>