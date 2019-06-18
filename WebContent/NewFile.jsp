<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Hate Fate</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/><title>Insert title here</title>
 

    <!--  
    <link rel="stylesheet" type="text/css" href="styles.css">  
    -->  
    <style type="text/css">
body {
    background-image: url(https://audj6g.bn1303.livefilestore.com/y4mlDSTfO3NZw0a1pc5jwrKCgp2LTz-DwTOnBjJss2hrSw8GLBltHXnOAwBYXh77LRMLDN1RvFDG0S8sJpKXImQvPElwe9ejve74NWqpwyQ60L-pT_5HubGgpFwHuA5hRO_k2-dBDpzIUVbP1420erz6l3HXwoIr3S6XMeRas3OIynr37auemrM9bi839J80BL9ghn27aVqn58h0DAwJD23hw?width=2500&height=1664&cropmode=none);
background-size:100% 100%; 
}
</style>


 </head> 
 
 <body> 
   <%
    String h="";
    try{  
         if(request.getParameter("password")!=null)  
            h = "Password are not the same";
    }catch(Exception e){
        e.printStackTrace();
    }
   String user="ss";
   %>


   <form action = "resetc.jsp" method = "post" onsubmit = "return validate();return checkpasswd();">  
          <div class="row">
           <div class="col s1 m2 l4 left">
      <p>&nbsp;&nbsp;&nbsp;</p>
      </div>
        <div class="col s10 m8 l4">
          <div class="card white z-depth-3">
            <div class="card-content black-text">
              <span class="card-title">Forget your password?</span>
              <p>We still need some more information about you. Thank you for your patient.</p>    
              <a class="black-text">If you visit this page by error. Click </a><a href="login.jsp">login</a><a class="black-text"> to go to login.</a>
              <br>
              <span class="red-text"><%=h %></span>  
              <span class="red-text" id="err"></span>   
          </div>
      <div class="card-action">
      

          <input id="icon_telephone" class="validate" type="hidden" name="username" value=<%=user %> maxlength = "50"> 

      
      <div class="input-field col s12">
          <i class="material-icons prefix"><img src="img/ic_vpn_key_24px.svg"></img></i> 
          <input id="password" class="validate" type="password" name="password" value="" maxlength = "50"> 
          <label for="icon_prefix">Password</label>
      </div>
      
      <div class="input-field col s12">
          <i class="material-icons prefix"><img src="img/ic_vpn_key_24px.svg"></img></i> 
          <input id="newword" class="validate" type="password" name="newword" value="" maxlength = "50" onkeyup="validate()"> 
          <label for="icon_prefix">re-enter password</label>
      </div>
      
      <div class="col s6 m8 l7 left">
      <p>&nbsp;</p>
      </div>
      <button class="waves-effect waves-light btn" id="submit">submit</button>
  <script>
          function validate() {
              var pwd1 = document.getElementById("password").value;
              var pwd2 = document.getElementById("newword").value;
              if(pwd1 == pwd2) {
                  document.getElementById("err").innerHTML="<font color='green'></font>";
                  document.getElementById("submit").disabled = false;
              }
              else {
                  document.getElementById("err").innerHTML="<font color='red'>Two times password are not the same.</font>";
                
              }
          }
      </script>
</div> 
        </div>
            </div>
            </div>

    </form>  
 <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.js"></script>
  <script src="js/init.js"></script>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.11';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    </body>
</html>  