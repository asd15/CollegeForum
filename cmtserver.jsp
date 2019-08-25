<%-- 
    Document   : cmtserver
    Created on : Aug 23, 2019, 2:07:08 AM
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DES Forum</title>
    </head>
    <body>
        <%
            String uname=(String)request.getSession().getAttribute("user_sid");
            String comment=request.getParameter("comment");
            int pid=Integer.parseInt(request.getParameter("pid"));
            
            Class.forName("com.mysql.jdbc.Driver");
           Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
           Statement st=con.createStatement();
           ResultSet r=st.executeQuery("select uid from user where uname='"+uname+"'");
           if(r.next()==true){
           int uid=r.getInt("uid");
           
           PreparedStatement s=con.prepareStatement("insert into comments(cmt,uid,pid) values(?,?,?)");
           s.setString(1, comment);
           s.setInt(2, uid);
           s.setInt(3, pid);
           s.executeUpdate();
           response.sendRedirect("addcmt.jsp?pid="+pid);
           }
        %>
    </body>
</html>
