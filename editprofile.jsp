<%-- 
    Document   : editprofile
    Created on : Aug 20, 2019, 5:17:08 PM
    Author     : Akash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DES Forum| Edit </title>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script>
            $(document).on("change",'#picfile',function(){
                if (window.File && window.FileReader && window.FileList && window.Blob)
                   {
                       //get the file size and file type from file input field
                       var fsize = $('#picfile')[0].files[0].size;

                       if(fsize>2000000) //do something if file size more than 1 mb (1048576)
                       {
                           alert("File Size More Than 2MB");
                       }
                   }else{
                       alert("Please upgrade your browser, because your current browser lacks some new features we need!");
                   }
                   });

            </script>

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
         %>
         
         <div class="row">
             <div class="col l3"></div>
            <div class="col s12 m12 l9">
                <div class="z-depth-4" style="max-height: 1400px; padding: 20px;">
                    <h4>Edit</h4>
                    <div class="divider"></div>
                    <div class="card">  
                        <div class="card-image">
        <a title="Change profile pic" href="#picmodal" class="waves-effect waves-red modal-trigger" data-target="picmodal"><img src="<%="profile/"+rs.getString("dp")%>" style="height:50%; width:50%" alt="profile_image"></a><br>
                        </div>
        <div class="card-content">
            <form method="post" action="editprofileserver.jsp">
                <div class="row">
                    <div class="input-field col s6 m6 l6">
                        <i class="material-icons prefix" >account_circle</i><input type="text" name="fname" value="<%=rs.getString("fname")%>">
                    </div>
                    <div class="input-field col s6 m6 l6">
                        <input type="text" name="lname" value="<%=rs.getString("lname")%>">
                    </div>
                    
                </div>
                    
                    <div class="row">
                        <div class="input-field col s6 m6 l6">
                            <i class="material-icons prefix">email</i><input type="text" name="email" value="<%=rs.getString("email")%>">
                        </div>
                        <div class="input-field col s6 m6 l6">
                            <i class="material-icons prefix">local_phone</i><input type="text" name="phone" value="<%=rs.getInt("phone")%>">
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
                          <div style="text-align:center">
		   <button type="submit" class="btn black">Update</button>
		   </div>
            </form>
        </div>
                                <div id="test"></div>
                    </div>
        
        
        
        <div id="picmodal" class="modal">
    <div class="modal-content">
      
      <div class="row">
          <form action="uploadpic.jsp" method="post" enctype="multipart/form-data">
              <input type="file" name="picfile" id="picfile">
              <div style="text-align:center">
                    <button type="submit" class="btn" name="pic_upload">Upload</button>
            </div>
          </form>
      </div>
    </div>
        </div>
                </div>
            </div>
         </div>
        <%}%>
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
