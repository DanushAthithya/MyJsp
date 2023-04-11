<%@ page import = "java.sql.*,java.io.*,javax.servlet.*,java.util.*" %>

<html>
    <head>
        <script>
            let tot=0;
            function validate(num)
            {
                console.log("In");
                num=parseInt(num);
                //var num=parseInt(document.getElementById("num").value);
                console.log(num);
                var price=parseInt(document.getElementsByName("v")[num].value);
                console.log(price);
                var quan=parseInt(document.getElementsByName("q")[num].value);
                console.log(quan);
                tot+=(price*quan);
                document.getElementById("bal").innerHTML=tot;
                document.getElementById("balance").value=tot;
            }
        </script>
    </head>
    <body>
        <%
            try{
                int amount = Integer.parseInt(request.getParameter("amount"));
                String username = request.getParameter("Name");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket","root", "");
                String sql;
                sql = "SELECT * FROM products";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();
                
                int i=0;
                while(rs.next())
                {
                    int price = rs.getInt("Price");
                    String name = rs.getString("Name");
                    %>
                    <p><%=name%>(<%=price%>):</p>
                    <input type="hidden" value="<%=price%>" name="v">
                    <input type="number" value="0" name="q">
                    <!-- <input type="hidden" id="num" name="num" value="<%=i%>"> -->
                    <button id="<%=i%>" onclick="validate(this.id)">Conform</button>
                    <br>
                <% 
                    i++;} 
                %>
                <form action="assign1_3.jsp">
                <input type="hidden" value="<%=username%>" name="Name" id="name">
                <input type="hidden" id="balance" name="balance">
                <input type="hidden" value="<%=amount%>" id="amount" name="amount">
                <br>
                <input type="submit" value="Purchase">
                </form>
                <br>
                <div id="bal"></div>
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