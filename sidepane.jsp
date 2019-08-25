<div class="row">
        <div class="col l2">
<ul id="slide-out" class="sidenav sidenav-fixed">
          <a href="#!user"><img  style="height:200px; width:210px; padding-left: 30px" src="des.jpg"></a>
          
          <% if(session.getAttribute("user_sid") == null){ %>
          <li class="z-depth-4"><a href="#modal1" class="waves-effect waves-red modal-trigger" data-target="modal1"><i class="material-icons">announcement</i>Ask Question</a></li>
          <% } else { %>
          <li class="z-depth-4"><a href="askquestion.jsp" class="waves-effect waves-red"><i class="material-icons">announcement</i>Ask Question</a></li>
          <% } %>
          
            <li class="active"><a href="index.jsp" class="waves-effect waves-red"><i class="material-icons">home</i>Home</a></li>
            
             <% if(session.getAttribute("user_sid") == null){ %>
            <li><a href="#modal1" class="waves-effect waves-red modal-trigger" data-target="modal1"><i class="material-icons">forum</i>Questions</a></li>
             <% } else { %>
            <li><a href="questions.jsp" class="waves-effect waves-red"><i class="material-icons">forum</i>Questions</a></li>
             <% } %>
            <% if(session.getAttribute("user_sid") == null){ %>
            <li><a href="#modal1" class="waves-effect waves-red modal-trigger" data-target="modal1"><i class="material-icons">settings</i>Profile</a></li>
             <% } else { %>
             <li><a href="profile.jsp" class="waves-effect waves-red"><i class="material-icons">settings</i>Profile</a></li>
            <% } %>
            <% if(session.getAttribute("user_sid") == null){ %>
            <li><a href="#modal1" class="waves-effect waves-red modal-trigger" data-target="modal1"><i class="material-icons">account_box</i>Login</a></li>
            <% } else { %>
            <li><a href="logout.jsp" class="waves-effect waves-red " ><i class="material-icons">account_box</i>Logout</a></li>
            <% } %>
            
            <li class="no-padding">
             <ul class="collapsible collapsible-accordion">
          <li>
            <a class="collapsible-header waves-effect waves-red"><i class="material-icons">school</i>Alumni<i class="material-icons">arrow_drop_down</i></a>
            <div class="collapsible-body">
              <ul>
                <li><a href="registration.jsp">Home</a></li>
                <li><a href="#!">Gallery</a></li>
                <li><a href="#!">Third</a></li>
                <li><a href="#!">Fourth</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </li>
      <li><a href="studentcouncil.jsp" class="waves-effect waves-red"><i class="material-icons">group</i>Student Council</a></li>
      <li><a href="contact.jsp" class="waves-effect waves-red"><i class="material-icons">contact_mail</i>Contact Us</a></li>
          </ul>
  </div>
            <div class="col s12 m12 l10">
            <jsp:include page="toppane.jsp" /> 
    </div>
    </div>
        
      <div id="modal1" class="modal">
    <div class="modal-content">
      <h4 class="center">Login or Sign up!</h4>
      <div class="row">
    <form class="col s12" method="post" action="login.jsp">
      <div class="row">
        <div class="input-field col s12 m12 l6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" type="text" class="validate" name="username" required>
          <label for="icon_prefix">Username</label>
        </div>
        <div class="input-field col s12 m12 l6">
          <i class="material-icons prefix">lock</i>
          <input id="password" class="validate" type="password" name="password" required>
          <label for="password">Password</label>
        </div>
      </div>
	  
	  <div style="text-align:center">
<button type="submit" class="btn" name="login_user">Login</button>
</div>

    </form>
	
  &nbsp;
  &nbsp;
 


 <h5 class="center">New to our Forum? Sign up!</h5>
    <div class="row">
    <form class="col s12" method="post" action="registration.jsp" id="regform">
      <div class="row">
        <div class="input-field col s12 m12 l6">         
          <input type="text" class="validate" name="fname" required id="fname">
          <label>Firstname</label>
        </div>
        <div class="input-field col s12 m12 l6" >         
          <input id="lastname" class="validate" type="text" name="lname" required>
          <label for="lname">Lastname</label>
        </div>
      </div>
<div class="row">
<div class="input-field col s12 m12 l6">         
          <input id="email" type="email" class="validate" name="email" required>
          <label for="email">email@abc.com</label>
        </div>
		<div class="input-field col s12 m12 l6">         
          <input  type="text" class="validate" name="username" required>
          <label>Username</label>
        </div>
</div>	
<div class="row">
<div class="input-field col s12 m12 l6">         
          <input id="password" type="password" class="validate" name="password" required minlength="6">
          <label for="password">Password</label>
        </div>
		<div class="input-field col s12 m12 l6">         
          <input id="confirm_password" type="cpassword" class="validate" name="confirm_password" required>
          <label for="cpassword">Confirm Password</label>
		  <span id="message"></span>
        </div>
</div>


<div style="text-align:center">
<button type="submit" class="btn"  name="reg_user" id="reg">Register</button>  
</div>

    </form>
<div style="text-align:center">
<!--<a class="waves-effect waves-orange btn-flat" name="reg_user">Sign up</a></div>-->
  </div>
   </div>
    
  </div>
  
  </div>
   </div>
            