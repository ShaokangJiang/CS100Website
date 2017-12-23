<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*,java.net.*,website.*,java.util.Date,java.util.Calendar,java.text.SimpleDateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hate Fate-choose fate</title>


  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/><title>Insert title here</title>
     <script type="text/javascript" src="js/des1.js"></script>

    <!--  
    <link rel="stylesheet" type="text/css" href="styles.css">  
    -->  
    

</head>
<body>
<%    
    String h="";
    try{  
         if(request.getParameter("errNo")!=null)  
            h = "Please at least choose 5 hates.";
          if(request.getParameter("errNo1")!=null)  
         	h = "Unknow error happened, please try again later.";
    }catch(Exception e){  
        e.printStackTrace();  
    }  
   %>  
  <% 
  try{
  String name = request.getParameter("name"); 
  String key2 = request.getParameter("key4");
  Public w = new Public();
  Date now = new Date(); 
  SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
  String date = dateFormat.format( now ); 
  String key1 = Md5Utils.MD5Encode(date, "utf-8", false);
  String y = "" + (char)Integer.parseInt(key2);
  String key3 = Md5Utils.MD5Encode(y, "utf-8", false);
  
  name = w.strDec(name, key1, key2, key3);
  
  

  %>
  <nav class="Maroon" role="navigation">
    <div class="nav-wrapper container">
      <a id="logo-container" href="#" class="brand-logo middle"><img src="https://storage2.cuntuku.com/2017/11/07/logo.png"></a>
      <ul class="right hide-on-med-and-down">
        <li><a class="material-icons prefix">account_circle</a><a class="waves-effect waves-light"><%=name %></a><a class="waves-effect waves-light btn blue" href="index.jsp">Log off</a></li>
      </ul>

      <ul id="nav-mobile" class="side-nav">
        <li><a class="material-icons prefix">account_circle</a><a class="waves-effect waves-light"><%=name %></a><a class="waves-effect waves-light btn blue" href="index.jsp">Log off</a></li>
   
      </ul>
      <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons"><span class="white-text">menu</span></i></a>
    </div>
  </nav>
  
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1; y-index:-1; margin:0 auto;">    
<img src="https://cucasa.bn1303.livefilestore.com/y4mNbTHNDQW3AydVQPVsvR2LAPdsIgH5mxnK10dezNoPuy1beb2wrWLFn58FVNAUeT3R8sO29f2xrgNdRjuGGDHH-EEk2j3Shvpqp4yAGP4JJVy9nnSH67Y78DmmXTcVEImIC1Ma91_Jlcel7RydVWyuomdYn9uTRPmNnUvoWk8NNNh7LJqks5ufxZR_m2eBcagmSadcegRJZSNtDLeJQN5uA?width=1400&height=425&cropmode=none" height="50%" width="100%"/>    
</div> 
  
  
  
<p>&nbsp;&nbsp;&nbsp;</p>
    
    
    <%if(name != null){ %>
    
<div class="container">
<h2 class="blue-text">Hello, <%=name %></h2>
</div>






<br></br>
<div class="container">
<form action = "favoritec.jsp" method = "post" onsubmit = "return validate()">  

<SCRIPT LANGUAGE="JavaScript"> 
var c=0,limit=10; 
function doCheck(obj) { 
obj.checked?c++:c--; 
if(c>limit){ 
obj.checked=false; 
var nv = document.getElementById("err");
nv.innerHTML="Wait! Don't choose more than 10.";
c--; 
} 
} 
</SCRIPT> 

          <div class="row">
           <div class="col s1 m2 l2 left">
      <p>&nbsp;&nbsp;&nbsp;</p>
      </div>
        <div class="col s10 m8 l8">
          <div class="card white z-depth-3">
            <div class="card-content black-text">
              <span class="card-title">Now</span>
              <p>Feel free to choose some hates(at least five, but no more than 10):</p>
              <span class="red-text"><%=h %></span><br>
              <span class="red-text" id="err"></span>


          </div>
      <div class="card-action">
      
 <div class="col s5 m4 l4">

    <p>
      <input type="checkbox" id="1" name="hate" value="01" onClick="doCheck(this)"/>
      <label for="1">Video</label>
    </p>
    <p>
      <input type="checkbox" id="2" name="hate" value="02" onClick="doCheck(this)"/>
      <label for="2">Books</label>
    </p>
       <p>
      <input type="checkbox" id="3" name="hate" value="03" onClick="doCheck(this)"/>
      <label for="3">Netflix</label>
    </p>
    <p>
      <input type="checkbox" id="4" name="hate" value="04" onClick="doCheck(this)"/>
      <label for="4">Public Speaking</label>
    </p>
        <p>
      <input type="checkbox" id="5" name="hate" value="05" onClick="doCheck(this)"/>
      <label for="5">Animals</label>
    </p>
    <p>
      <input type="checkbox" id="6" name="hate" value="06" onClick="doCheck(this)"/>
      <label for="6">Anime</label>
    </p>
        <p>
      <input type="checkbox" id="7" name="hate" value="07" onClick="doCheck(this)"/>
      <label for="7">Apple</label>
    </p>
    <p>
      <input type="checkbox" id="8" name="hate" value="08" onClick="doCheck(this)"/>
      <label for="8">Crowds</label>
    </p>
        <p>
      <input type="checkbox" id="9" name="hate" value="09" onClick="doCheck(this)"/>
      <label for="9">Coffee</label>
    </p>
    <p>
      <input type="checkbox" id="10" name="hate" value="10" onClick="doCheck(this)"/>
      <label for="10">Loneliness</label>
    </p>
        
        
        
        
        
        
        </div>
       
           <div class="col s5 m4 l4">
<p>
      <input type="checkbox" id="11" name="hate" value="11" onClick="doCheck(this)"/>
      <label for="11">Mondays</label>
    </p>
    <p>
      <input type="checkbox" id="12" name="hate" value="12" onClick="doCheck(this)"/>
      <label for="12">Family</label>
    </p>
        <p>
      <input type="checkbox" id="13" name="hate" value="13" onClick="doCheck(this)"/>
      <label for="13">This app</label>
    </p>
    <p>
      <input type="checkbox" id="14" name="hate" value="14" onClick="doCheck(this)"/>
      <label for="14">Cold Weather</label>
    </p>
    <p>
      <input type="checkbox" id="15" name="hate" value="15" onClick="doCheck(this)"/>
      <label for="15">Socializing</label>
    </p>
    <p>
      <input type="checkbox" id="16" name="hate" value="16" onClick="doCheck(this)"/>
      <label for="16">Pennies</label>
    </p>
       <p>
      <input type="checkbox" id="17" name="hate" value="17" onClick="doCheck(this)"/>
      <label for="17">Politicians</label>
    </p>
    <p>
      <input type="checkbox" id="18" name="hate" value="18" onClick="doCheck(this)"/>
      <label for="18">Samsung</label>
    </p>
        <p>
      <input type="checkbox" id="19" name="hate" value="19" onClick="doCheck(this)"/>
      <label for="19">Spam Mail</label>
    </p>
    <p>
      <input type="checkbox" id="20" name="hate" value="20" onClick="doCheck(this)"/>
      <label for="20">Rude People</label>
    </p>
       
        
        
        
        
        </div>
        
          <div class="col s5 m4 l4">
 <p>
      <input type="checkbox" id="21" name="hate" value="21" onClick="doCheck(this)"/>
      <label for="21">Slow Wifi</label>
    </p>
    <p>
      <input type="checkbox" id="22" name="hate" value="22" onClick="doCheck(this)"/>
      <label for="22">Olives</label>
    </p>
        <p>
      <input type="checkbox" id="23" name="hate" value="23" onClick="doCheck(this)"/>
      <label for="23">Smokers</label>
    </p>
    <p>
      <input type="checkbox" id="24" name="hate" value="24" onClick="doCheck(this)"/>
      <label for="24">Being broke</label>
    </p>
        <p>
      <input type="checkbox" id="25" name="hate" value="25" onClick="doCheck(this)"/>
      <label for="25">Traffic</label>
    </p>
    <p>
      <input type="checkbox" id="26" name="hate" value="26" onClick="doCheck(this)"/>
      <label for="26">Ads</label>
    </p>
        <p>
      <input type="checkbox" id="27" name="hate" value="27" onClick="doCheck(this)"/>
      <label for="27">Hugs</label>
    </p>
    <p>
      <input type="checkbox" id="28" name="hate" value="28" onClick="doCheck(this)"/>
      <label for="28">Spiders</label>
    </p>
    <p>
      <input type="checkbox" id="29" name="hate" value="29" onClick="doCheck(this)"/>
      <label for="29">Spoilers</label>
    </p>
    <p>
      <input type="checkbox" id="30" name="hate" value="30" onClick="doCheck(this)"/>
      <label for="30">Regrets</label>
    </p>

      
        </div>
                <div class="col s5 m4 l4">
               <p>
      <input type="checkbox" id="31" name="hate" value="31" onClick="doCheck(this)"/>
      <label for="31">Math</label>
    </p>
        <br></br>
        </div>
        <div class="col s5 m4 l4">
               <p>
      <input type="checkbox" id="32" name="hate" value="32" onClick="doCheck(this)"/>
      <label for="32">Teammates</label>
    </p>
        <br></br>
        </div>
        
      

    
        
      
      <div class="row">
      
        <div class="input-field col s12">
        <i class="material-icons prefix">mode_edit</i>
          <textarea id="textarea1" class="materialize-textarea" name="other"></textarea>
          <label for="textarea1">Write some words to describe yourself.</label>
        </div>
      </div>

      
               <input id="key1" class="validate" type="hidden" name="key1" value=<%=key1 %> > 
              <input id="key2" class="validate" type="hidden" name="key2" value=<%=key2 %> > 
              <input id="key3" class="validate" type="hidden" name="key3" value=<%=key3 %> > 
      
      
          <input name="ccid" id="ccid" value=<%=name %> type='hidden'>
               <input id="key4" class="validate" type="hidden" name="key4" value=<%=key2 %> > 
               
               
      <div class="col s6 m8 l8 left">
      <p>&nbsp;&nbsp;&nbsp;</p>
      </div>
      <button class="waves-effect waves-light btn" id="submit">submit</button>
           <script>

    document.getElementById("submit").onclick = function(){
        var loginName = $("#ccid").val();
       	var key1 = $("#key1").val(); 
        var key2 = $("#key2").val(); 
        var key3 = $("#key3").val();  
        loginName = strEnc(loginName,key1,key2,key3);        
        document.getElementById("ccid").value=loginName;
    }
</script>
          
              
<script>
$('#textarea1').val('New Text');
$('#textarea1').trigger('autoresize');
      
</script>



</div>
        </div>
            </div>
            </div>

    </form>  
    
    
</div>

<%}
    else{
    	%>

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
              <p>Please login/register first.</p>
              <p>We will bring you to home page in <span id="mes">5</span> seconds.</p> 
              <a href="index.jsp">Click here</a><a class="black-text"> to go to home page immediately.</a><br>
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
	
    <br></br>
<br></br>
<br></br>
    	<%
    	
    }%>

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
            <br></br>
            <br></br>
            <br></br>
	
	<%
	} 
             
            
            
            %>

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

<script>
setInterval(
window.onload=function(){ 

document.getElementById("float_layer").style.display="none"; 
document.getElementByClass("float_layer").style.display="none"; 
	} , 5000);

</script>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.11';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    </body>
</html>  