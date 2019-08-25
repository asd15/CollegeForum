<%-- 
    Document   : vote
    Created on : Aug 24, 2019, 1:17:43 AM
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
        
        int quid=Integer.parseInt(request.getParameter("quid"));
        int val=Integer.parseInt(request.getParameter("val"));
        System.out.println("val");
        String uname=(String)request.getSession().getAttribute("user_sid");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");

        if(val==1){
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select upvotes from questions where quid="+quid);
        while(rs.next()){
            int cnt=rs.getInt("upvotes");
        cnt=cnt+1;
        
        PreparedStatement s=con.prepareStatement("update questions set upvotes=? where quid="+quid);
        s.setInt(1, cnt);
        s.executeUpdate();
        response.sendRedirect("questions.jsp");
        }
        }
        
        if(val==2){
            Statement s1=con.createStatement();
            ResultSet r=s1.executeQuery("select downvotes from questions where quid="+quid);
            while(r.next()){
                int cnt2=r.getInt("downvotes");
                cnt2=cnt2+1;
                
                PreparedStatement s2=con.prepareStatement("update questions set downvotes=? where quid="+quid);
                s2.setInt(1, cnt2);
                s2.executeUpdate();
                response.sendRedirect("questions.jsp");
            }
        }
        
        if(val==3){
            Statement s3=con.createStatement();
            ResultSet r1=s3.executeQuery("select reports from questions where quid="+quid);
            while(r1.next()){
                int cnt3=r1.getInt("reports");
                cnt3=cnt3+1;
                
                PreparedStatement s4=con.prepareStatement("update questions set reports=? where quid="+quid);
                s4.setInt(1, cnt3);
                s4.executeUpdate();
                response.sendRedirect("questions.jsp");
            }
        }
        %>
    </body>
</html>
