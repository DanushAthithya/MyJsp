<%@ page import = "java.sql.*,java.io.*,javax.servlet.*" %>
<html>
    <head>
        <style>
            body{
                background-color: rgb(9, 28, 88);
            }
            h1,h3{
                color: white;
            }
        </style>

    </head>
    <body>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                String username = request.getParameter("user");
                String password=request.getParameter("pass");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb","root", "");
                String sql;
                sql = "SELECT * FROM userdetails where username=? and password=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, password);
                ResultSet rs = pstmt.executeQuery();
                while(rs.next())
                {
                    %>
                    <h1>User Detail</h1>
                    <h3>Name:<%=rs.getString("name")%></h3>
                    <h3>Age:<%=rs.getInt("age")%></h3>
                    <h3>City:<%=rs.getString("city")%></h3>
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