<%@ page import = "java.sql.*,java.io.*,javax.servlet.*" %>
<html>
    <body>
        <table>
            <thead>
                <th>Bus Number</th>
                <th>Start</th>
                <th>Destination</th>
                <th>Seats Available</th>
                <th>Cost</th>
            </thead>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root", "");
                String sql;
                sql = "SELECT * FROM list";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();
                while(rs.next())
                {
                    int cost = rs.getInt("cost");
                    int busnum = rs.getInt("busnum");
                    String start = rs.getString("start");
                    String destination = rs.getString("destination");
                    int seats = rs.getInt("seats");
                    if(seats>0)
                    {
                    %>
                        <tr>
                            <td><%=busnum%></td>
                            <td><%=start%></td>
                            <td><%=destination%></td>
                            <td><%=seats%></td>
                            <td><%=cost%></td>
                        </tr>
                <%  }
             } 
                %>
                <br><br>
                <h3>Booking</h3>
                <form action="BusBooking_1.jsp" method="get">
                    <input type="number" name="num" placeholder="Bus Number" >
                    <input type="number" name="ticket" placeholder="Ticket" >
                    <input type="submit">
                </form>
                <%
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