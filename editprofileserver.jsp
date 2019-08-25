<%-- 
    Document   : editprofileserver
    Created on : Aug 23, 2019, 4:32:59 PM
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DES Forum</title>
    </head>
    <body>
        <%
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String email=request.getParameter("email");
        int phone=Integer.parseInt(request.getParameter("phone"));
        int interest=Integer.parseInt(request.getParameter("interest"));
        String uname=(String)request.getSession().getAttribute("user_sid");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select uid from user where uname='"+uname+"'");
           if(rs.next()==true){
           int uid=rs.getInt("uid");
           
           PreparedStatement st2=con.prepareStatement("insert into allinterest(uid,interest_id) values(?,?)");
           st2.setInt(1, uid);
           st2.setInt(2, interest);
           st2.executeUpdate();
           
           PreparedStatement s=con.prepareStatement("update user set fname=?,lname=?,email=?,phone=? where uid="+uid);
           s.setString(1 ,fname);
           s.setString(2, lname);
           s.setString(3,email);
           s.setInt(4,phone);
          s.executeUpdate();
           response.sendRedirect("profile.jsp");
           }
        %>
    </body>
</html>
