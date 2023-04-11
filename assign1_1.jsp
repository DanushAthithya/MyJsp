<%@ page import = "java.sql.*,java.io.*,javax.servlet.*" %>
<html>
    <body>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                String username = request.getParameter("user");
                String password=request.getParameter("pass");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket","root", "");
                String sql;
                sql = "SELECT * FROM credentials where username=? and password=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, password);
                ResultSet rs = pstmt.executeQuery();
                while(rs.next())
                {
                    int amount = rs.getInt("amount");
                    %>
                    <h1>Login Successful</h1>
                    <form action="assign1_2.jsp" method="get">
                        <input type="hidden" name="amount" value="<%=amount%>">
                        <input type="hidden" name="Name" value="<%=username%>">
                        <input type="submit" value="Purchase">
                    </form>

                <% } 
                rs.close();
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