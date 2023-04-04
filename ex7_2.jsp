<%@ page import = "java.sql.*,java.io.*,javax.servlet.*" %>
<html>
    <body>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                String department = request.getParameter("course");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/college","root", "");
                String sql;
                sql = "SELECT * FROM marks where Dept=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, department);
                ResultSet rs = pstmt.executeQuery();
                while(rs.next())
                {
                    int reg = rs.getInt("RegNo");
                    String name = rs.getString("Name");
                    String dept = rs.getString("Dept");
                    Double cgpa = rs.getDouble("CGPA");
                    String sch = rs.getString("Scholarship");
                    %>
                    <p>RegNum:<%=reg%></p>
                    <p>Name:<%=name%></p>
                    <p>Department:<%=dept%></p>
                    <p>CGPA:<%=cgpa%></p>
                    <p>Scholarship:<%=sch%></p>
                    <br><br>
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