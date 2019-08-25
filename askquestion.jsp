<%-- 
    Document   : askquestion
    Created on : Aug 10, 2019, 9:19:04 PM
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
             Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/desdb","root","");
%>
    <jsp:include page="sidepane.jsp" /> 
        
        <div class="row">
            <div class="col l3"></div>
            <div class="col s12 m12 l9">
                <div class="z-depth-4" style="max-height: 1400px; padding: 20px;">
                    <h3 style="font-family: 'Hind Madurai'; padding-left:10px;padding-top:10px;" class="flow-text">Ask Question</h3>
                    <div class="divider"></div>
                   
                    <form method="post" action="qserver.jsp">
                        <div class="row">
                            <div class="input-field col s12 m12 l12">
                                <i class="material-icons prefix">create</i>
                                <input id="icon_prefix" type="text" class="validate" name="question" required>
                                <label for="icon_prefix">Your Question</label>
                            </div>    
                        </div>
                        
                        <div class="row">
                            <div class="input-field col s12 m12 l12">
                                <i class="material-icons prefix">chat</i>
                                <textarea id="icon_prefix2" type="text" class="materialize-textarea"  class="validate" name="description"></textarea>
                                <label for="icon_prefix2">Description</label>
                            </div>
                        </div>
                        
                         <div class="row">
                            <div class="input-field col s12 m12 l6">
                               <select one id="cat" class="myselect">
                                    <option value="" disabled selected>Choose Interest Category</option>
                                    <%
                                    PreparedStatement stmt2=con.prepareStatement("select * from category");
                                    ResultSet res=stmt2.executeQuery();
                                    while(res.next()){
                                    
                                    %>
                                    <option value="<%=res.getInt("cid")%>"><%=res.getString("cname")%></option>
                                    <%}%>
                                </select>
                                <label>Your Categories</label>
                            </div>
                            
                            <div class="input-field col s12 m12 l6 intr myselect" id="intr" name="intr">
                               <select one id="sub-cat" name="interest_id" id="intr2">
                                    <option value="" disabled selected>Select Interest</option>
                                   
                                </select>
                                <label>Your Sub-categories</label>
                            </div>
                        </div>
                        <div style="text-align: center">
                            <button type="submit" class="btn black" style="text-align:center;" name="qu">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        
         <jsp:include page="footer.jsp" />
         <script>
             $(document).ready(function(){
    $('select').formSelect();
  });
         </script>
         
         <script>
         $(document).ready(function(){
             $('#cat').off().change(function(){
                 
                 var val=$(this).val();
                 $('#sub_cat').empty();
                 console.log(val);
                 $.ajax({
                     'method':'POST',
                     'url':'intrest.jsp',
                     'data':{'value':val},
                     
                     success:function(data){
                         $('#intr').html(data);
                         console.log(data);
                }
                 });
             });
         });    
         </script>
         
    </body>
</html>
