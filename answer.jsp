<%-- 
    Document   : answer
    Created on : Aug 12, 2019, 6:27:17 PM
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
    <head>
         <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DES's Forum</title>
    </head>
    <body>
        <%
            String uname=(String)request.getSession().getAttribute("user_sid");
            int quid=Integer.parseInt(request.getParameter("quid"));
            
            Class.forName("com.mysql.jdbc.Driver");
           Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
           Statement st=con.createStatement();
            
           ResultSet r1=st.executeQuery("select uid from questions where quid='"+quid+"'");
           if(r1.next()==true){
           int uid2=r1.getInt("uid");
           ResultSet r2=st.executeQuery("select * from user where uid='"+uid2+"'");
           if(r2.next()==true){
           String fname=r2.getString("fname");
           String lname=r2.getString("lname");
           String dp=r2.getString("dp");
           
        %>
    
         <jsp:include page="sidepane.jsp" /> 
        
           
        
        
        <div class="row">
        <div class="col l3"></div>
        <div class="col s12 m12 l9">
        <ul class="collection">
            <li class="collection-item avatar">
            <img src="<%= "profile/"+dp %>" alt="" class="circle">
            <h5><%= fname %> <%= lname %></h5>
            <div class="divider"></div>

          <div class="row">
        <div class="input-field col s12 m12 l12">
		
          <i class="material-icons prefix">forum</i>
          
          <%
              ResultSet r3=st.executeQuery("select * from questions where quid='"+quid+"'");
              if(r3.next()==true){
              String ques=r3.getString("question");
              String desc=r3.getString("description");
              String dat=r3.getString("time");
              
          %>
          <label for="icon_prefix"><b><%= ques %></b></label>
          </div>
         </div>
		 
		 <div class="row">
        <div class="input-field col s12 m12 l12">
          <i class="material-icons prefix">chat</i>
           <label for="icon_prefix"><b><%= desc %></b></label><br><br>&nbsp;
<hr>
	  <span class="title"><%= dat %></span>
        </div>
         </div>
		 <div><br></div><div class="divider"></div>
                 
                 <% if(session.getAttribute("user_sid") != null){ %>   
    <div><br></div><div class="divider"></div>
		<div class="row">
        <div class="input-field col s12 m12 l12" id="ans">
		<form id="ansform" name="ansform" method="post" action="ansserver.jsp?quid=<%= quid %>" >
                    <i class="material-icons prefix">border_color</i>
          <textarea  id="textarea1" style="width:500px" class="materialize-textarea"  class="validate" name="answer" required></textarea>
          <label for="textarea1">Answer</label>
        
		   <button type="submit" class="btn black secondary-content" style="text-align:center;" name="qu" action="ansserver.jsp?qid=<%= quid %>">Submit</button>
                </form>
            </div>
                </div>
<% } %>
    
    <%
    PreparedStatement s=con.prepareStatement("select * from answers where quid='"+quid+"'");
    ResultSet rs=s.executeQuery();
    while(rs.next()){
    int ansid=rs.getInt("ansid");
    String answer=rs.getString("answer");
    int auid=rs.getInt("uid");
    String dat2=rs.getString("time");
    
    ResultSet r5=st.executeQuery("select * from user where uid='"+auid+"'");
    if(r5.next()==true){
    String afname=r5.getString("fname");
    String alname=r5.getString("lname");
    String adp=r5.getString("dp");
    %>
    <ul class="collection">
    <li class="collection-item avatar">
      <img src="<%= "profile/"+adp %>" alt="" class="circle">
      <span><b><%= afname %> <%= alname %></b></span> 
	  <br>
          <span class="title"><%= answer %></span><br><hr>
	  
          
          <% if(session.getAttribute("user_sid") != null){ 
          ResultSet r6=st.executeQuery("select uid from user where uname='"+uname+"'");
          if(r6.next()==true){
          int uid=r6.getInt("uid");
          if(uid==auid){ %>
           <a href="del.jsp" class="secondary-content tooltipped" data-tooltip="Delete"><i class="material-icons">highlight_off</i></a>

          <%
          }
          %> 
    <% }
    }
    %>
            </li>
    </ul>
       
    <% } } } } }%>
        </ul>
     </div>
        </div>
    
 <jsp:include page="footer.jsp" /> 
    </body>
</html>

    </body>
</html>
