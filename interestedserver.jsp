<%-- 
    Document   : interestedserver
    Created on : Aug 24, 2019, 8:49:29 PM
    Author     : Akash
--%>

<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>
<%
int pid=Integer.parseInt(request.getParameter("pid"));
String uname=(String)request.getSession().getAttribute("user_sid");

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
        
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select uid from user where uname='"+uname+"'");
           if(rs.next()==true){
           int uid=rs.getInt("uid");
           
           PreparedStatement s=con.prepareStatement("insert into interested(uid,pid) values(?,?)");
           s.setInt(1, uid);
           s.setInt(2, pid);
           s.executeUpdate();
           response.sendRedirect("index.jsp");
           }
%>

