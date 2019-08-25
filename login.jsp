<%-- 
    Document   : login
    Created on : 5 Aug, 2019, 10:18:59 PM
    Author     : Gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
        String uname=request.getParameter("username");
        String password=request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
        Statement stmt=con.createStatement();
        
        ResultSet rs=stmt.executeQuery("select * from user where uname='"+uname+"'and password='"+password+"'");
        if(rs.next()==true)
        {
            session=request.getSession(true);
            session.setAttribute("user_sid",rs.getString("uname"));
            response.sendRedirect("index.jsp");
        }
        else
        {
            System.out.println("Check");
        }
        con.close();
        }
            catch(Exception e){out.println(e.getMessage());}
        %>
    </body>
</html>
