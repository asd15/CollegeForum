<%-- 
    Document   : addcmt
    Created on : Aug 23, 2019, 1:09:59 AM
    Author     : Akash
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>DES Forum| News Feed</title>
    </head>
    <body>
        <%
        String uname=(String)request.getSession().getAttribute("user_sid");
            int pid=Integer.parseInt(request.getParameter("pid"));
        %>
         <jsp:include page="sidepane.jsp" />     
        <%
    
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
                PreparedStatement s=con.prepareStatement("select * from newsfeed where pid='"+pid+"'");
                    ResultSet rs=s.executeQuery();
                    while(rs.next())
                     {
                         PreparedStatement s2=con.prepareStatement("select * from interested where pid="+pid);
                         ResultSet r2=s2.executeQuery();
                         while(r2.next()){
                             int intr_uid=r2.getInt("uid");
                             
                             PreparedStatement s3=con.prepareStatement("select * from user where uid="+intr_uid);
                             ResultSet r3=s3.executeQuery();
                             while(r3.next()){
                                 
                                 String intr_fname=r3.getString("fname");
                                 String intr_dp=r3.getString("dp"); 
                                 String intr_lname=r3.getString("lname");
                                 String intr_email=r3.getString("email");
		
	%>
        <div class="row">
            <div class="col l3"></div>
            <div class="col s12 m12 l9">
                <div class="z-depth-4" style="max-height: 1400px">
                    <h3 style="font-family: 'Hind Madurai'; padding-left:10px;padding-top:10px;" class="flow-text"><%=rs.getString("title")%></h3>
                    <div class="divider"></div>
                    
                    <div class="row">
                        <div class="col l1"></div>
                        <div class="col s12 m12 l10" style="padding:20px;text-align: center">
                            <div class="card horizontal sticky-action large">
                                <div class="card-image waves-effect waves-block waves-light">
                                     <img class="activator" src="<%="newsfeed/"+rs.getString("pic")%>">
                                </div>
                                <div class="card-stacked">
                                    <div class="card-content">
                                        <span class="card-title activator grey-text text-darken-4"><%=rs.getString("title")%></span>
                                        <p><%=rs.getString("descr")%></p>
                                    </div>
                                    <% if(session.getAttribute("user_sid") != null){ %> 
                                    <div class="card-action">
                                        <a href="interestedserver.jsp?pid=<%=pid%>" style="color: red"><i class="material-icons" style="color: red">favorite</i>Interested</a>
                                    </div>
                                    <% } %>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                               
                                    <div class="divider"></div>
                                    <div style="padding: 20px">
                                    <h6>People Interested in this Event</h6>
                                    <hr>
                                    <ul class="collection">
                                        <li class="collection-item avatar">
                                            <img src="profile/<%=intr_dp%>" class="circle">
                                            <a href="profileview.jsp?uid=<%=intr_uid%>"><span class="title"><b><%=intr_fname%> <%=intr_lname%></b></span></a>
                                            <br> <span><b><%=intr_email%></b></span>
                                        </li>
                                    </ul>
                                    </div>
       
    <% } } } %>
  
    
    
     <% if(session.getAttribute("user_sid") != null){ %> 
     <div class="divider"></div>
     
     <div class="row" style="padding: 20px">
         <h6>Comment Section</h6><hr>
        <div class="input-field col s12 m12 l12" id="ans">
		<form id="ansform" name="ansform" method="post" action="cmtserver.jsp?pid=<%=pid%>" >
                    <i class="material-icons prefix">border_color</i>
          <textarea  id="textarea1" style="width:500px" class="materialize-textarea"  class="validate" name="comment" required></textarea>
          <label for="textarea1">Comment</label>
        
		   <button type="submit" class="btn black secondary-content" style="text-align:center;" name="qu" action="cmtserver.jsp?qid=<%=pid%>">Submit</button>
                </form>
            </div>
                </div>
<% } %>
   
<%
PreparedStatement st=con.prepareStatement("select * from comments where pid='"+pid+"'");
ResultSet r=st.executeQuery();
while(r.next()){
    int cmt_id=r.getInt("cmt_id");
    String cmt=r.getString("cmt");
    int auid=r.getInt("uid");
    
    PreparedStatement st2=con.prepareStatement("select * from user where uid='"+auid+"'");
    ResultSet r2=st2.executeQuery();
    if(r2.next()==true){
    String fnam=r2.getString("fname");
    String lnam=r2.getString("lname");
    String adp=r2.getString("dp");
 
%>
<ul class="collection">
    <li class="collection-item avatar">
        <img src="<%="profile/"+adp%>" class="circle">
        <span><b><%=fnam%> <%=lnam%></b></span>
        <br>
        <span class="title"><%=cmt%></span><br><hr>
<%   }
}%>
    </li>
</ul>
            </div>
        </div>
        </div>
        
<jsp:include page="footer.jsp" /> 
    </body>
</html>
