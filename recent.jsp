<%-- 
    Document   : recent
    Created on : Aug 24, 2019, 11:25:47 AM
    Author     : Akash
--%>
<%@page import="java.sql.*" %>
<div id="test1" class="col s12 m12 l9">
                <div class="z-depth-4" style="max-height:400px; overflow-y:scroll;">
                    
               
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
                    PreparedStatement s=con.prepareStatement("select * from questions order by time desc");
                    ResultSet rs=s.executeQuery();
                    while(rs.next())
                    {
                        int qui=rs.getInt("quid");
                        int uidd=rs.getInt("uid");
                        
                        PreparedStatement stmt1=con.prepareStatement("select * from user where uid="+uidd);
                        ResultSet reslt=stmt1.executeQuery();
                        while(reslt.next()){
                            String fn=reslt.getString("fname");
                            String ln=reslt.getString("lname");
                            String d=reslt.getString("dp");
//                    String d=(String);
//                     DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
//                    DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
//                    String result = df.f/ormat(d);
                    
                    %>
                    <ul class="collection">
                        <li class="collection-item avatar">
                            <img src="profile/<%=d%>" class="circle">
                            <span><b><%=fn%> <%=ln%></b></span><br>
                            <span class="title"><a href=<%="\"answer.jsp?quid=" +rs.getInt("quid")+ "\""%>><%=rs.getString("question")%></a></span>
                            <p><%=rs.getString("time")%></p>
                            
                            <% if(session.getAttribute("user_sid") != null){ %> 
                            <div class="divider"></div>
                            <table class="responsive-table">
            <tr>
                <td><a href="vote.jsp?quid=<%=qui%>&val=1" id="like" class="like tooltipped" data-position="bottom" data-delay="50" data-tooltip="Upvote"><i class="material-icons" style="font-size:20px; color: black">thumb_up</i></a></td>
	  <td><a href="vote.jsp?quid=<%=qui%>&val=2" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Downvote"><i class="material-icons" style="font-size:20px; color:black">thumb_down</i></a></td>
          <td><a href="vote.jsp?quid=<%=qui%>&val=3" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Report"><i class="material-icons" style="color:#FF4A4A;font-size: 20px;color: black">report</i></a></td>
	  </tr>
	   </table> 
                            <% } %>
                            <!--<a href="#" class="secondary-content"><i class="material-icons">highlight_off</i></a>-->
                        </li>
                    </ul>
                    <%
                        }
                    }
                    %>
                </div>
            </div>