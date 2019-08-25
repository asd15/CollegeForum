<%-- 
    Document   : profile
    Created on : 16 Aug, 2019, 12:37:54 AM
    Author     : Gaurav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>

<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DES Forum| Profile</title>
        <style>
            .label_class
            {
                font-size:28px; 
            }
        </style>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        
    </head>
    <body>

         <jsp:include page="sidepane.jsp" /> 
         <%
             String uname=(String)request.getSession().getAttribute("user_sid");
             Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
        System.out.println(uname);
        PreparedStatement stmt=con.prepareStatement("select * from user where uname='"+uname+"'");
        ResultSet rs=stmt.executeQuery();
        while(rs.next())
        {
            int uid=rs.getInt("uid");
           
                
                
         %>
         <div class="row">
             <div class="col l3"></div>
            <div class="col s12 m12 l8">
                <div class="z-depth-4" style="max-height: 1400px; padding: 20px;">
                    <h4>Profile</h4>
                    <div class="divider"></div>
                    <div class="card">
                    <div class="card-image">
                    <img src="<%="profile/"+rs.getString("dp")%>" style="height:30%;width:30%" alt="profile_image"  >
                    <span class="card-title"><%=rs.getString("fname")+"  "+rs.getString("lname")%></span>
                    <a class="btn-floating waves-effect waves-light black" style="float:right; "  href="editprofile.jsp" ><i class="material-icons">create</i></a>
                    </div>  
                    <div class="card-content">
                        <ul> <li  style="display:inline-block;"><i class="material-icons prefix" style="float:left; margin-right:10px;">email</i></li><li style="display:inline-block;"><%=rs.getString("uname")%><span></span></li></ul> 
                        <ul> <li  style="display:inline-block;"><i class="material-icons prefix" style="float:left; margin-right:10px;">local_phone</i></li><li style="display:inline-block;"><span><%=rs.getString("phone")%></span></li></ul>
                    <ul> <li  style="display:inline-block;"><i class="material-icons prefix" style="float:left; margin-right:10px;">cake</i></li><li style="display:inline-block;"><span><%=rs.getString("dob")%></span></li></ul>
                    <div class="divider"></div>
                    <h6><u><b>My Interests</b></u></h6>
                    <%  PreparedStatement s=con.prepareStatement("select interest_id from allinterest where uid='"+uid+"'");
            ResultSet r=s.executeQuery();
            while(r.next()){
                int interest_id=r.getInt("interest_id");
                       
                       PreparedStatement st2=con.prepareStatement("select * from interest where interest_id='"+interest_id+"'");
                ResultSet r2=st2.executeQuery();
                while(r2.next()){
                   %>
                    <ul> <li  style="display:inline-block;"><i class="material-icons prefix" style="float:left; margin-right:10px; color:#FFE000">grade</i></li><li style="display:inline-block;"><span><%=r2.getString("interest_name")%></span></li></ul>
                    <%} } %>
                    </div>
                    </div>
                </div>
             </div>
         </div>
         <%}%>
        <jsp:include page="footer.jsp" /> 
                
        
    </body>
</html>
