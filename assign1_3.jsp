<%@ page import = "java.sql.*,java.io.*,javax.servlet.*,java.util.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
    <body>
                <%
                String bal = request.getParameter("balance");
                String name = request.getParameter("Name");
                int amount = Integer.parseInt(request.getParameter("amount"));
                %>
                <form action="assign1_4.jsp" method="get">
                <c:set var = "balance" value = "<%=bal%>" />
                <c:set var = "nam" value = "<%=name%>" />
                <c:set var = "amoun" value = "<%=amount%>" />
                <p>Bill:</p>
                <c:out value = "${balance}"/>
                <input type="hidden" name="balance" value="<%=bal%>">
                <p>Username:</p>
                <c:out value = "${nam}"/>
                <input type="hidden" name="username" value="<%=name%>">
                <p>Wallet:</p>
                <c:out value = "${amoun}"/>
                <input type="hidden" name="amount" value="<%=amount%>"><br>
                <input type="submit" value="Conform">
                </form>
                
    </body>
</html>