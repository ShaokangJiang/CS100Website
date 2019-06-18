<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ page import="website.*,java.util.Date,java.util.Calendar,java.text.SimpleDateFormat"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Hate Fate</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/><title>Insert title here</title>
     <script type="text/javascript" src="js/des1.js"></script>

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
         if(request.getParameter("email")!=null)  
            h = "Your email is invalid.";
         if(request.getParameter("code")!=null)  
             h = "Invalid vertification code.";
         if(request.getParameter("errNo1")!=null)  
             h = "Unknown error happened. Please re-send the email. We are sorry about that.";
    }catch(Exception e){
        e.printStackTrace();
    }
    Date now = new Date(); 
    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");//可以方便地修改日期格式 
    String date = dateFormat.format( now );
    String key1 = Md5Utils.MD5Encode(date, "utf-8", false);
    int u = (int)Math.random()*126;
    while(u<=32) u++;
    String key2 = "" + u ;
    char i = (char)u;
    String key3 = Md5Utils.MD5Encode("" + i, "utf-8", false);
   %>
 
 <nav class="Maroon" role="navigation">
    <div class="nav-wrapper container">
      <a id="logo-container" href="#" class="brand-logo middle"><img src="https://storage2.cuntuku.com/2017/11/07/logo.png"></a>
      <ul class="right hide-on-med-and-down">
        <li><a class="waves-effect waves-light btn blue" href="login.jsp">Login</a><a class="waves-effect waves-light btn blue" href="register.jsp">Sign up</a></li>
      </ul>

      <ul id="nav-mobile" class="side-nav">
        <li><a class="waves-effect waves-light btn blue" href="login.jsp">Login</a><a class="waves-effect waves-light btn blue" href="register.jsp">Sign up</a></li>
   
      </ul>
      <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons"><span class="white-text">menu</span></i></a>
    </div>
  </nav>
  

 <br></br>
 <br></br>




    <form action = "forgetc.jsp" method = "post" onsubmit = "return validate()">  
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
          </div>
      <div class="card-action">
      
      <div class="input-field col s12">
          <i class="material-icons prefix"><img src="img/ic_email_24px.svg"></img></i> 
          <input id="loginName" class="validate" type="text" name="email" value=""> 
          <label for="icon_prefix">email</label>
      </div>
      
            <input id="key4" class="validate" type="hidden" name="key4" value=<%=key2 %> > 
      <div class="col s12 m3 l3">
      <br>
         <div id="v_container" style="width: 100px;height: 40px;">
              <canvas id="verifyCanvas" width="100" height="40" style="cursor: pointer;">Don't support your browser.</canvas>
         </div> 
         </div>
    <div class="input-field col s12 m8 l8 right">
              <input type="text" id="code_input" class="validate" value=""/>
              <label for="icon_prefix">CAPTCHA</label>

      </div>
              <input id="key1" class="validate" type="hidden" name="key1" value=<%=key1 %> > 
              <input id="key2" class="validate" type="hidden" name="key2" value=<%=key2 %> > 
              <input id="key3" class="validate" type="hidden" name="key3" value=<%=key3 %> > 
      <div class="col s6 m8 l7 left">
      <p>&nbsp;</p>
      </div>
      <button class="waves-effect waves-light btn" id="submit">submit</button>
                    <script src="js/gVerify.js"></script>
              <input name="ccid" id="ccid" value="" type='hidden'>
            
      <script>
      var verifyCode = new GVerify("v_container");
      
  	function validate() {
      var res = verifyCode.validate(document.getElementById("code_input").value);
      if(res){
          document.getElementById("ccid").value="true";
      }else{
          document.getElementById("ccid").value="false";
      }
      
  }
      document.getElementById("submit").onclick = function(){
    	  
    		
          var loginName = $("#loginName").val();
          var key1 = $("#key1").val(); 
          var key2 = $("#key2").val(); 
          var key3 = $("#key3").val(); 
          $("#loginName").attr('type','password');  
          loginName = strEnc(loginName,key1,key2,key3);       
          document.getElementById("loginName").value=loginName;
      }
</script>

</div> 
        </div>
            </div>
            </div>

    </form>  
    
    
      <br></br>
  <br></br>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
<footer class="page-footer Maroon">
    <div class="container">
      <div class="row">
        <div class="col l6 s12">
          <h5 class="white-text">About us</h5>
          <p class="grey-text text-lighten-4">We are four university students from Illinois Institute of Technology, who are in an intro course in computer science. Our main driving force behind this app is to get that lovely A. Also to connect the community around us, and get people talking to others.
		  </p>


        </div>
        <div class="col l3 s12">
          <h5 class="white-text">Contact us</h5>
          <ul>
            <li><a class="white-text" href="mailto:sjiang27@hawk.iit.edu">Shaokang Jiang</a></li>
            <li><a class="white-text" href="mailto:sechevarria@hawk.iit.edu">Samuel Echevarria</a></li>
            <li><a class="white-text" href="mailto:dgarcia12@hawk.iit.edu">Danny Garcia</a></li>
            <li><a class="white-text" href="mailto:vyu1@hawk.iit.edu">Vincent Yu</a></li>
          </ul>
        </div>
        <div class="col l3 s12">
          <h5 class="white-text">Connect</h5>
          <ul>
             <div class="fb-like" data-href="https://www.facebook.com/HateFate-519114148433189/" data-layout="button" data-action="like" data-size="large" data-show-faces="true" data-share="true"></div>
          </ul>
        </div>
      </div>
    </div>
    <div class="footer-copyright">
      <div class="container">
      </div>
    </div>
  </footer>
  

  
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