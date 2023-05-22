<%@ page import = "java.sql.*,java.io.*,javax.servlet.*" %>
<html>
    <head>
        <style>
            body{
                background-color: rgb(13, 33, 87);
                color: black;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }
            input{
                min-width: 20vw;
                padding: 2%;
                font-size: large;
                border-top-left-radius: 5%;
                border-top-right-radius: 5%;
                border-bottom-left-radius: 5%;
                border-bottom-right-radius: 5%;
                background-color: rgb(224, 230, 144);
                border: solid black;
            }
            h1{
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
                    <h1>MENU</h1>
                    <br>
                    <form action="userDetail.jsp">
                            <input type="submit" value="User Detail">
                    <input type="hidden" name="user" value="<%=username%>">
                    <input type="hidden" name="pass" value="<%=password%>">
                    </form><br><br>
                    <form action="search.jsp">
                            <input type="submit" value="Search Players">
                    <input type="hidden" name="user" value="<%=username%>">
                    <input type="hidden" name="pass" value="<%=password%>">
                    </form><br><br>
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