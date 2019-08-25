<%-- 
    Document   : logout
    Created on : 9 Aug, 2019, 1:37:20 PM
    Author     : Gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
HttpServletResponse httpResponse = (HttpServletResponse) response;
httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
httpResponse.setHeader("Pragma", "no-cache"); 
httpResponse.setDateHeader("Expires", 0); 
                        session.removeAttribute("user_sid");
            request.getSession().invalidate(); 
            if(session!=null)
            {
                session=null;%>
                          <jsp:forward page="index.jsp"/>
        <%            }
            
        %>
          
    </body>
</html>
