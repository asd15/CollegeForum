<%-- 
    Document   : ansserver
    Created on : Aug 13, 2019, 12:45:41 AM
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DES's NMITD</title>
    </head>
    <body>
        <%
            String uname=(String)request.getSession().getAttribute("user_sid");
            String answer=request.getParameter("answer");
            int quid=Integer.parseInt(request.getParameter("quid"));
            
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
           Statement st=con.createStatement();
           ResultSet r=st.executeQuery("select uid from user where uname='"+uname+"'");
           if(r.next()==true){
           int uid=r.getInt("uid");
           
           PreparedStatement s=con.prepareStatement("insert into answers(quid,uid,answer) values(?,?,?)");
           s.setInt(1, quid);
           s.setInt(2, uid);
           s.setString(3,answer);
           s.executeUpdate();
           response.sendRedirect("answer.jsp?quid="+quid);
           }
        %>
        
    </body>
</html>
