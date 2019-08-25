<%-- 
    Document   : index
    Created on : Aug 4, 2019, 2:20:50 AM
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
        <style>
            .ellip{
                display: -webkit-box;
                -webkit-line-clamp: 9;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
            }
        </style>
        <title>DES's Forum</title>
    </head>
    
    <body>
        
        
        <jsp:include page="sidepane.jsp" />     
    
        
        <div class="row">
            <div class="col l3">
            </div>
            <div class="col l9">
                <nav style="background-color: #000000">
    <div class="nav-wrapper">
      <form>
        <div class="input-field">
          <input id="search" type="search" required>
          <label class="label-icon" for="search"><i class="material-icons">search</i></label>
          <i class="material-icons">close</i>
        </div>
      </form>
    </div>
  </nav> 
            </div>
        </div>
        
        <%
    
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
		
	%>
        <div class="row">
            <div class="col l3"></div>
            <div class="col s12 m12 l9">
                <div class="z-depth-4" style="max-height: 1400px">
                    <h3 style="font-family: 'Hind Madurai'; padding-left:10px;padding-top:10px;" class="flow-text">News Feed</h3>
                    <div class="divider"></div>
                   <%

                    PreparedStatement s=con.prepareStatement("select * from newsfeed");
                    ResultSet rs=s.executeQuery();
                    while(rs.next())
                     {
                         int pid=rs.getInt("pid");
//                    String d=(String);
//                     DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
//                    DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
//                    String result = df.f/ormat(d);
                    
                    %>
                    <div class="row">
                        <div class="col s12 m12 l6" style="padding:20px">
                            <div class="card horizontal sticky-action small">
                                <div class="card-image waves-effect waves-block waves-light">
                                    <a href=<%="\"addcmt.jsp?pid=" +rs.getInt("pid")+"\""%>>  <img class="activator" src="<%="newsfeed/"+rs.getString("pic")%>"></a>
                                </div>
                                <div class="card-stacked">
                                    <div class="card-content">
                                        <span class="card-title activator grey-text text-darken-4"><%=rs.getString("title")%></span>
                                        <div class="ellip">
                                        <p style="font-size: 12px;"><%=rs.getString("descr")%></p>
                                        </div>
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
                    <%
                    }
                    %>

                </div>
            </div>
        </div>
        
<jsp:include page="footer.jsp" /> 
    </body>
</html>
