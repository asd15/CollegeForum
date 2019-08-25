<%-- 
    Document   : registration
    Created on : Aug 5, 2019, 12:24:08 AM
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
       <%
         String fname=request.getParameter("fname");
         String lname=request.getParameter("lname");
         String email=request.getParameter("email");
         String uname=request.getParameter("username");
         String password=request.getParameter("password");
         String cpassword=request.getParameter("confirm_password");
         
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
        PreparedStatement stmt=con.prepareStatement("insert into user(fname,lname,email,uname,password) values(?,?,?,?,?)");
        stmt.setString(1,fname);
        stmt.setString(2,lname);
        stmt.setString(3,email);
        stmt.setString(4,uname);
        stmt.setString(5,password);
        int i=stmt.executeUpdate();
         System.out.println(i);
         if(i>0){ 
         response.sendRedirect("index.jsp");
         }
         else{
         response.sendRedirect("questions.jsp");
         }
         
      
       %>
    </body>
</html>
