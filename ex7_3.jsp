<%@ page import = "java.sql.*,java.io.*,javax.servlet.*" %>
<html>
    <body>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                String department = request.getParameter("Dept");
                int regn = Integer.parseInt(request.getParameter("RegNo"));
                String scho = request.getParameter("Scholarship");
                String nam = request.getParameter("Name");
                Double cgp = Double.parseDouble(request.getParameter("CGPA"));
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/college","root", "");
                String sql;
                sql = "INSERT INTO MARKS VALUES(?,?,?,?,?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, regn);
                pstmt.setString(2, nam);
                pstmt.setString(3, department);
                pstmt.setDouble(4, cgp);
                pstmt.setString(5, scho);
                pstmt.executeUpdate();
                %>
                <h1>Successfully Inserted Values</h1>
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