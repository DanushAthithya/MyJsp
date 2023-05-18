<%@ page import="java.io.*,java.util.*,java.lang.*"%>
<html>
    <body>
        <%
        String text=request.getParameter("CypherPassage");
        text.trim();
        System.out.println(text);
        String spltex[]=text.split(" ");
        String splt[]=new String[spltex.length];
        int k=0;
        for(String str:spltex)
        {
            char ch[]=new char[str.length()];
            for(int i = 0; i < str.length(); i++)
            {
                char c = str.charAt(i);
                int a =c;
                a=a+3;
                if(a>122)
                {
                    int x=a%122;
                    a=97+x-1;
                }
                else if(a>90 && a<=96)
                {
                    int x=a%90;
                    a=65+x-1;
                }
                ch[i]=(char)a;
            }
            splt[k]=String.valueOf(ch);
            System.out.println(ch);
            k++;
        }
        System.out.println(splt);
        String textres=String.join(" ",splt);
        %>
        <p><%=textres%></p>
    </body>
</html>