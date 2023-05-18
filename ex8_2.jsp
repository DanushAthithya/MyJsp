<%@ page import = "java.sql.*,java.io.*,javax.servlet.*" %>
<html>
    <head>
        <style>
            body{
                background-color: aqua;
            }
        </style>
    </head>
    <body>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                String name = request.getParameter("movie");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb","root", "");
                String sql;
                sql = "SELECT * FROM movie where name=?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                ResultSet rs = pstmt.executeQuery();
                while(rs.next())
                {
                    %>
                    <h1>Movie Detail</h1>
                    <h3>Movie Name:<%=rs.getString("name")%></h3>
                    <h3>Year:<%=rs.getInt("year")%></h3>
                    <h3>Genre:<%=rs.getString("genre")%></h3>
                    <h3>IMDB:<%=rs.getDouble("IMDB")%></h3>
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