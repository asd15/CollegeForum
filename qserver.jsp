<%-- 
    Document   : qserver
    Created on : Aug 11, 2019, 12:40:12 PM
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <% String question=request.getParameter("question");
           String description=request.getParameter("description");
           String uname=(String)request.getSession().getAttribute("user_sid");
           int interest=Integer.parseInt(request.getParameter("interest"));
           
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
           Statement st=con.createStatement();
           ResultSet r=st.executeQuery("select uid from user where uname='"+uname+"'");
           if(r.next()==true){
           int uid=r.getInt("uid");
           
           
           PreparedStatement s=con.prepareStatement("insert into questions(uid,interest_id,question,description) values(?,?,?,?)");
           s.setInt(1 ,uid);
           s.setInt(2, interest);
           s.setString(3,question);
           s.setString(4,description);
          s.executeUpdate();
           response.sendRedirect("questions.jsp");
           }
        %>
    </body>
</html>
