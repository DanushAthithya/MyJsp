<%@ page import = "java.sql.*,java.io.*,javax.servlet.*" %>
<html>
    <head>
        <style>
            body{
                background-color: rgb(13, 37, 73);
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
                String name = request.getParameter("name");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb","root", "");
                String sql;
                sql = "SELECT * FROM player where name=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                ResultSet rs = pstmt.executeQuery();
                while(rs.next())
                {
                    %>
                    <h1>Player Detail</h1>
                    <h3>Player Name:<%=rs.getString("name")%></h3>
                    <h3>Age:<%=rs.getInt("age")%></h3>
                    <h3>Country:<%=rs.getString("country")%></h3>
                    <h3>Height(in cm):<%=rs.getDouble("height")%></h3>
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