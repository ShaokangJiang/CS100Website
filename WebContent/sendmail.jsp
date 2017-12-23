<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%@ page import="website.*,java.util.Date,java.util.Calendar,java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>

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
    


 </head> 
 
 
 <body>
 
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
  
  <center>
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1; y-index:-1; margin:0 auto;">    
<img src="https://cpcasa.bn1303.livefilestore.com/y4mHDMy7TiaEqMsNsb30i2YAq_PhmDEgRTSHlA024DhNp4BOoSLXVEFlPp_Fhm6uwSQf1Lp2kc526kONcgrWVWIJPgTMRCLIItQN-qpLGekIsrhItJKj8OolwTHVgdQ4E7mMuEkgAPEtlHwARBhU--UChjMuNA5fu_mj-vuZ0UaoKuXd5lRURpIiZiaZaYHuNBaCpEJEw_G3MJm4jJgh6Huwg?width=1400&height=425&cropmode=none" height="50%" width="100%"/>    
</div> 
</center>


<%try{ %>
 <br></br>
 <br></br>
 

	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="row">
           <div class="col s1 m2 l4 left">
      <p>&nbsp;&nbsp;&nbsp;</p>
      </div>
        <div class="col s10 m8 l4">
          <div class="card white z-depth-3">
            <div class="card-content black-text">
              <span class="card-title">Successfully</span>
              <p>We have sent an email to your account just now. Please follow the instructions to verify your account. Sometimes it will go to the spam.</p>
               <p>We will bring you to login page in <span id="mes">5</span> seconds.</p> 
              <a href="login.jsp">Click here</a><a class="black-text"> to go to login page immediately.</a><br>
          </div>



        </div>
            </div>
            </div>
           
	
	 <%
 String email = request.getParameter("email");
 String code = request.getParameter("code");
 String user = request.getParameter("user");
 String key2 = request.getParameter("key4");
 Public w = new Public();
 Date now = new Date(); 
 SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");//可以方便地修改日期格式 
 String date = dateFormat.format( now ); 
 String key1 = Md5Utils.MD5Encode(date, "utf-8", false);
 String y = "" + (char)Integer.parseInt(key2);
 String key3 = Md5Utils.MD5Encode(y, "utf-8", false);
 
 email = w.strDec(email, key1, key2, key3);

 user = w.strDec(user, key3, key2, key1);
 
 user = test.encrypt1(user);
	
 
	SendMailBySSL.main(email,"verification link", "http://www.huangsk100.me/success1.jsp?code=" + code + "&name=" + user);
 

             
%>

      
      <script language="javascript" type="text/javascript"> 
var i = 5; 
var intervalid; 
intervalid = setInterval("fun()", 1000); 
function fun() { 
if (i == 0) { 
window.location.href = "login.jsp"; 
clearInterval(intervalid); 
} 
document.getElementById("mes").innerHTML = i; 
i--; 
} 
</script> 
 
 
<%}catch(Exception e){  
    e.printStackTrace();  
	%>

	<br></br>
	<br></br>
	<br></br>
	<div class="row">
           <div class="col s1 m2 l4 left">
      <p>&nbsp;&nbsp;&nbsp;</p>
      </div>
        <div class="col s10 m8 l4">
          <div class="card white z-depth-3">
            <div class="card-content black-text">
              <span class="card-title">Sorry!</span>
              <p>Something goes wrong.</p>
              <p>We will bring you to home page in <span id="mes">5</span> seconds.</p> 
              <a href="index.jsp">Click here</a><a class="black-text"> to go to home page immediately.</a><br>
              <a class="black-text">if you find this page shows many times, please contact us.</a>
          </div>


      
      <script language="javascript" type="text/javascript"> 
var i = 5; 
var intervalid; 
intervalid = setInterval("fun()", 1000); 
function fun() { 
if (i == 0) { 
window.location.href = "index.jsp"; 
clearInterval(intervalid); 
} 
document.getElementById("mes").innerHTML = i; 
i--; 
} 
</script> 
    


        </div>
            </div>
            </div>
            <%} %>
 <br></br>
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