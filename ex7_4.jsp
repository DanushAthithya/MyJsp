<%@ page import = "java.sql.*,java.io.*,javax.servlet.*" %>
<html>
    <body>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                int regn = Integer.parseInt(request.getParameter("RegNo"));
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/college","root", "");
                String sql;
                sql = "Delete From MARKS Where RegNo=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, regn);
                pstmt.executeUpdate();
                %>
                <h1>Successfully Deleted Values</h1>
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