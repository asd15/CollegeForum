<%-- 
    Document   : questions.jsp
    Created on : Aug 4, 2019, 8:21:19 PM
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="tabs.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        
        <title>DES Forum| Questions</title>
    </head>
    <body>
        <%
    
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
                String uname=(String)request.getSession().getAttribute("user_sid");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select uid from user where uname='"+uname+"'");
                if(rs.next()==true){
                int uid=rs.getInt("uid");

	%>
        
        <jsp:include page="sidepane.jsp" />    
        
        <div class="row">
            <div class="col l3"></div>
            <div class="col s12 m12 l9">
                <ul class="tabs">
                    <li class="tab col s3"><a class="one" href="#test1"><i class="material-icons one">live_help</i>Recent</a></li>
                    <li class="tab col s3"><a class="two" href="#test2"><i class="material-icons two">whatshot</i>Trending</a></li>
                    <li class="tab col s3"><a class="three" href="#test3"><i class="material-icons three">star</i>Interest Based</a></li>
                    <li class="tab col s3"><a class="four" href="#test4"><i class="material-icons four">verified_user</i>Your Questions</a></li>
                </ul>
            </div>   
            
            <div class="col l3"></div>
            <jsp:include page="recent.jsp" />
                     
                
                <div id="test2" class="col s12 m12 l9">
                    <div class="z-depth-4" style="max-height:400px; overflow-y:scroll;">
                        <%
                        PreparedStatement s6=con.prepareStatement("select quid, count(ansid) as acnt from answers group by quid order by acnt desc");
                        ResultSet r4=s6.executeQuery();
                        while(r4.next()){
                            int quid=r4.getInt("quid");
                            
                            PreparedStatement s7=con.prepareStatement("select * from questions where quid="+quid);
                            ResultSet r5=s7.executeQuery();
                            while(r5.next()){
                            String question3=r5.getString("question");
                            int quid3=r5.getInt("quid");
                            int uid5=r5.getInt("uid");
                            
                            PreparedStatement s8=con.prepareStatement("select * from user where uid="+uid5);
                            ResultSet r6=s8.executeQuery();
                            while(r6.next()){
                                String fname3=r6.getString("fname");
                                String lname3=r6.getString("lname");
                                String dp3=r6.getString("dp");
                                %>
                                <ul class="collection">
                                    <li class="collection-item avatar">
                                        <img src="profile/<%=dp3%>" class="circle">
                                        <span><b><%=fname3%> <%=lname3%></b></span>
                                <br><a href="answer.jsp?quid="<%=quid3%>><%=question3%></a><br>
                                <% if(session.getAttribute("user_sid") != null){ %> 
                            <div class="divider"></div>
                            <table class="responsive-table">
            <tr>
                <td><a href="vote.jsp?quid=<%=quid3%>&val=1" id="like" class="like tooltipped" data-position="bottom" data-delay="50" data-tooltip="Upvote"><i class="material-icons" style="font-size:20px">thumb_up</i></a></td>
	  <td><a href="vote.jsp?quid=<%=quid3%>&val=2" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Downvote"><i class="material-icons" style="font-size:20px">thumb_down</i></a></td>
          <td><a href="vote.jsp?quid=<%=quid3%>&val=3" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Report"><i class="material-icons" style="color:#FF4A4A;font-size: 20px">report</i></a></td>
	  </tr>
	   </table> 
                            <% } %>
                                    </li>
                                </ul>
                                <%
                                }
                            }
                        }
                        %>
                    </div>
                </div>
            
            
                
                <div id="test3" class="col s12 m12 l9">
                    <div class="z-depth-4" style="max-height:400px; overflow-y:scroll;">
                        <%
                        PreparedStatement s1=con.prepareStatement("select interest_id from allinterest where uid="+uid);
                        ResultSet rs2=s1.executeQuery();
                        while(rs2.next()){
                        int interest_id=rs2.getInt("interest_id");
                        
                        PreparedStatement s2=con.prepareStatement("select * from questions where interest_id="+interest_id+" order by quid desc");
                        ResultSet rs3=s2.executeQuery();
                        while(rs3.next()){
                            String question=rs3.getString("question");
                            int quid=rs3.getInt("quid");
                            int uid2=rs3.getInt("uid");
                            
                         PreparedStatement s3=con.prepareStatement("select * from user where uid="+uid2);
                         ResultSet rs4=s3.executeQuery();
                         while(rs4.next()){
                             String fname=rs4.getString("fname");
                             String lname=rs4.getString("lname");
                             String dp=rs4.getString("dp");
                        %>
                        <ul class="collection">
                            <li class="collection-item avatar">
                                <img src="profile/<%=dp%>" class="circle">
                                <span><b><%=fname%> <%=lname%></b></span>
                                <br><a href="answer.jsp?quid="<%=quid%>><%=question%></a><br>
                                
                                 <% if(session.getAttribute("user_sid") != null){ %> 
                            <div class="divider"></div>
                            <table class="responsive-table">
            <tr>
                <td><a href="vote.jsp?quid=<%=quid%>&val=1" id="like" class="like tooltipped" data-position="bottom" data-delay="50" data-tooltip="Upvote"><i class="material-icons" style="font-size:20px">thumb_up</i></a></td>
	  <td><a href="vote.jsp?quid=<%=quid%>&val=2" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Downvote"><i class="material-icons" style="font-size:20px">thumb_down</i></a></td>
          <td><a href="vote.jsp?quid=<%=quid%>&val=3" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Report"><i class="material-icons" style="color:#FF4A4A;font-size: 20px">report</i></a></td>
	  </tr>
	   </table> 
                            <% } %>
                            </li>
                        </ul>
                        <% } } } %>
                    </div>
                </div>
                    
                    
                    
                    
                
                <div id="test4" class="col s12 m12 l9">
                    <div class="z-depth-4" style="max-height:400px; overflow-y:scroll;">
                        <%
                        PreparedStatement s4=con.prepareStatement("select * from questions where uid="+uid);
                        ResultSet r2=s4.executeQuery();
                        while(r2.next()){
                            String question=r2.getString("question");
                            int uid3=r2.getInt("uid");
                            int quid2=r2.getInt("quid");
                        PreparedStatement s5=con.prepareStatement("select * from user where uid="+uid3);
                        ResultSet r3=s5.executeQuery();
                        while(r3.next()){
                            String dp2=r3.getString("dp");
                            String fname2=r3.getString("fname");
                            String lname2=r3.getString("lname");
                            %>
                            <ul class="collection">
                                <li class="collection-item avatar">
                                    <img src="profile/<%=dp2%>" class="circle">
                                    <span><b><%=fname2%> <%=lname2%></b></span>
                                <br><a href="answer.jsp?quid="<%=quid2%>><%=question%></a><br>
                                
                                <% if(session.getAttribute("user_sid") != null){ %> 
                            <div class="divider"></div>
                            <table class="responsive-table">
            <tr>
                <td><a href="vote.jsp?quid=<%=quid2%>&val=1" id="like" class="like tooltipped" data-position="bottom" data-delay="50" data-tooltip="Upvote"><i class="material-icons" style="font-size:20px">thumb_up</i></a></td>
	  <td><a href="vote.jsp?quid=<%=quid2%>&val=2" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Downvote"><i class="material-icons" style="font-size:20px">thumb_down</i></a></td>
          <td><a href="vote.jsp?quid=<%=quid2%>&val=3" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Report"><i class="material-icons" style="color:#FF4A4A;font-size: 20px">report</i></a></td>
	  </tr>
	   </table> 
                            <% } %>
                                </li>
                            </ul>
                            <%
                        }
                        }
                        %>
                    </div>
                </div>
                
                </div>
            
        <% } %>
        
<jsp:include page="footer.jsp" /> 

<script>
    $(document).ready(function(){
    $('ul.tabs').tabs(
	);
  });
    </script>
    <script>
        $(document).ready(function(){
            $('#like').click(fuction(e){
               e.preventDefault();
    $(this).off("click").attr('href', "javascript: void(0);");
            });
        });
    </script>
    </body>
</html>
 
