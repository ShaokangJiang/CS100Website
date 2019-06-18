<%@ page language="java" import="java.util.*,java.sql.*,java.net.*,website.*" pageEncoding="utf-8"%>  
<%@ page import="website.*,java.util.Date,java.util.Calendar,java.text.SimpleDateFormat"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/><title>Insert title here</title>
     <script type="text/javascript" src="js/des1.js"></script>
</head>

 <body> 
<% 

           try{ 
        	//  String queryString = request.getQueryString();
           	String code = request.getParameter("code");
           //	System.out.println(code);
           	//code = AesEncryptUtil.desEncrypt(code);
           //	System.out.println(code);
           	code = Publicforlink.DecodePasswd(code);
           //	System.out.println(code);
           	String[] code1 = code.split(";");
           	code1[1] = En_De.Decrypt(code1[1], code1[0]);
           	if(code1[0].equals(code1[1])){
           		
           	

           	String user = code1[0];
           	
               Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); 
               String connectionString =  
               "jdbc:sqlserver://test50.database.windows.net:1433;database=test;user=huangsk100@test50;password=*PASSWORD*;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";  
               Connection conn = DriverManager.getConnection(connectionString); 
               PreparedStatement pStmt1 = conn.prepareStatement("select * from dbo.favorite where Name = '" + user + "'");  
               PreparedStatement pStmt3 = conn.prepareStatement("select * from dbo.login where Name = '" + user + "'");  
               
               
               



%>
   <nav class="Maroon" role="navigation">
    <div class="nav-wrapper container">
      <a id="logo-container" href="#" class="brand-logo middle"><img src="https://storage2.cuntuku.com/2017/11/07/logo.png"></a>
      <ul class="right hide-on-med-and-down">
        <li><a class="large material-icons prefix">account_circle</a><a class="waves-effect waves-light"><%=user %></a><a class="waves-effect waves-light btn blue" href="index.jsp">Log off</a></li>
      </ul>

      <ul id="nav-mobile" class="side-nav">
        <li><a class="large material-icons prefix">account_circle</a><a class="waves-effect waves-light"><%=user %></a><a class="waves-effect waves-light btn blue" href="index.jsp">Log off</a></li>
   
      </ul>
      <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons"><span class="white-text">menu</span></i></a>
    </div>
  </nav>
 
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1; y-index:-1; margin:0 auto;">    
<img src="https://cpcasa.bn1303.livefilestore.com/y4mHDMy7TiaEqMsNsb30i2YAq_PhmDEgRTSHlA024DhNp4BOoSLXVEFlPp_Fhm6uwSQf1Lp2kc526kONcgrWVWIJPgTMRCLIItQN-qpLGekIsrhItJKj8OolwTHVgdQ4E7mMuEkgAPEtlHwARBhU--UChjMuNA5fu_mj-vuZ0UaoKuXd5lRURpIiZiaZaYHuNBaCpEJEw_G3MJm4jJgh6Huwg?width=1400&height=425&cropmode=none" height="50%" width="100%"/>    
</div> 
  
  <%
  String[] greet={"Welcome to HateFate!","Love to loathe!","Bond over anger!","Hello, and despise!","Hey there!","Hate Fate!","Don't rest", "instead detest!","Thanks for visiting!","Greetings friend!"};
  int x=(int)(10*Math.random());
  
  %>
  
  
  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<div class="container">

<h2 class="blue-text"><%=greet[x] %></h2>
</div>


<!-- verificate -->
<%
            ResultSet rs1 = pStmt1.executeQuery();
            ResultSet rs3 = pStmt3.executeQuery();
            rs1.next();
            rs3.next();
            String f = rs1.getNString("favorite");
            String p = rs1.getNString("verificate");
            String g = rs1.getNString("code");
            String email1 = rs3.getNString("Date1");
            if(p.equals("0")){
            if(code1.length>2){
            String value = code1[2];
            
            if(g.equals(value)){
            	 PreparedStatement tmt2 = conn.prepareStatement("update dbo.favorite set verificate='"+ "1" +"' where Name='"+user+"'");
                 int rst1 = tmt2.executeUpdate();  
                 if (rst1 != 0){  
                	String code2 = "";
                	code2 = user + ";" + En_De.Encrypt(user, user) + ";";
                	code2 = Publicforlink.EncodePasswd(code2);
                	
                     	%>
                     	<jsp:forward page="success.jsp">
                 	<jsp:param name="code" value="<%=code2 %>"/> 
                 	</jsp:forward>
                     	<%
                     }else{
                     	out.println("<script language='javascript'>alert('Sign up failed, please contact us.');window.location.href='register.jsp';</script>");    
                     }
            }else{
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
                     	<br>
                     	<!-- re-send code -->
	<br>
	<br>
	<div class="row">
           <div class="col s1 m2 l4 left">
      <p>&nbsp;&nbsp;&nbsp;</p>
      </div>
        <div class="col s10 m8 l4">
          <div class="card white z-depth-3">
            <div class="card-content black-text">
              <span class="card-title">Sorry!</span>
              <p>Something wrong happen, please re-send.</p>
              <a class="black-text">Maybe the mail is your spam box. Please re-check it.</a>
              <div class="card-action">
              <p>You can also click this button to send one again.</p>
                 <input id="key1" class="validate" type="hidden" name="key1" value=<%=key1 %> > 
              <input id="key2" class="validate" type="hidden" name="key2" value=<%=key2 %> > 
              <input id="key3" class="validate" type="hidden" name="key3" value=<%=key3 %> > 
              
              <form action = "sendmail.jsp" method = "post" onsubmit = "return validate()">  
              <input id="1" type="hidden" name="email" value=<%=email1 %>> 
                          <input id="key4" class="validate" type="hidden" name="key4" value=<%=key2 %> > 
               <input id="2"  type="hidden" name="code" value=<%=g %>> 
                <input id="3"  type="hidden" name="user" value=<%=user %>> 
              <center>
              <button class="waves-effect waves-light btn" id="submit">re-send</button>
              </center>
              </form>
              </div>
          </div>
 <script>

    document.getElementById("submit").onclick = function(){
    	
    	
        var z1 = $("#1").val();
       
        var z3 = $("#3").val();
       	var key1 = $("#key1").val(); 
        var key2 = $("#key2").val(); 
        var key3 = $("#key3").val(); 
        z1 = strEnc(z1,key1,key2,key3);    
       
        z3 = strEnc(z3,key3,key2,key1); 
        document.getElementById("1").value=z1;
        
        document.getElementById("3").value=z3;
    }
</script>

        </div>
            </div>
            </div>

                     	<%
            }}else{
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
            		<br>
                     	<!-- re-send code -->
	<br>
	<br>
	<div class="row">
           <div class="col s1 m2 l4 left">
      <p>&nbsp;&nbsp;&nbsp;</p>
      </div>
        <div class="col s10 m8 l4">
          <div class="card white z-depth-3">
            <div class="card-content black-text">
              <span class="card-title">Sorry!</span>
              <p>It seems that you didn't verificate your account yet.</p>
              <a class="black-text">Maybe the mail is your spam box. Please re-check it.</a>
              <div class="card-action">
              <p>You can also click this button to send one again.</p>
                 <input id="key1" class="validate" type="hidden" name="key1" value=<%=key1 %> > 
              <input id="key2" class="validate" type="hidden" name="key2" value=<%=key2 %> > 
              <input id="key3" class="validate" type="hidden" name="key3" value=<%=key3 %> > 
              
              <form action = "sendmail.jsp" method = "post" onsubmit = "return validate()">  
              <input id="1" type="hidden" name="email" value=<%=email1 %>> 
                          <input id="key4" class="validate" type="hidden" name="key4" value=<%=key2 %> > 
               <input id="2"  type="hidden" name="code" value=<%=g %>> 
                <input id="3"  type="hidden" name="user" value=<%=user %>> 
              <center>
              <button class="waves-effect waves-light btn" id="submit">re-send</button>
              </center>
              </form>
              </div>
          </div>
 <script>

    document.getElementById("submit").onclick = function(){
    	
    	
        var z1 = $("#1").val();
        
        var z3 = $("#3").val();
       	var key1 = $("#key1").val(); 
        var key2 = $("#key2").val(); 
        var key3 = $("#key3").val(); 
        z1 = strEnc(z1,key1,key2,key3);    
        
        z3 = strEnc(z3,key3,key2,key1); 
        document.getElementById("1").value=z1;
       
        document.getElementById("3").value=z3;
    }
</script>

        </div>
            </div>
            </div>
            	
            	<%
            	
            	
            	
            	
            	
            	
            }
     %>  
<!-- choose hate for the first time -->
<%}else{
	Date now = new Date(); 
    SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");//可以方便地修改日期格式 
    String date = dateFormat.format( now );
    String key1 = Md5Utils.MD5Encode(date, "utf-8", false);
    int u1 = (int)Math.random()*126;
    while(u1<=32) u1++;
    String key2 = "" + u1 ;
    char i1 = (char)u1;
    String key3 = Md5Utils.MD5Encode("" + i1, "utf-8", false);
	
	
	if(f.equals("0")){
	
	%>


<br><br>
<br>
   <div class="container">
   <div class="row">
    <div class="col l10 m10 s10">
     <div class="card-panel hoverable">
    <h5>Oh! it seems you don't have any hate right now.</h5>
    <a class="black-text">Click the add </a><i class="material-icons">add</i> to add at least 5 hates to start search.</a>
    </div>
   </div>
   </div>
   </div>
   <div style="position: fixed;top:auto; left: auto; right: 50px;bottom:50px;" >
   <!-- Element Showed -->
   <form method="post" action="favorite.jsp">
<input id="1" type="hidden"  name="name" value=<%=user %>>
     <input id="key1" class="validate" type="hidden" name="key1" value=<%=key1 %> > 
     <input id="key2" class="validate" type="hidden" name="key2" value=<%=key2 %> > 
     <input id="key3" class="validate" type="hidden" name="key3" value=<%=key3 %> > 
              
                          <input id="key4" class="validate" type="hidden" name="key4" value=<%=key2 %> > 
  <button id="add" class="large waves-effect waves-light btn btn-floating" type="submit"><i class="large material-icons">add</i></button>
  </form>
  
  <script>
    document.getElementById("add").onclick = function(){
        var z1 = $("#1").val();
       	var key1 = $("#key1").val(); 
        var key2 = $("#key2").val(); 
        var key3 = $("#key3").val(); 
        z1 = strEnc(z1,key1,key2,key3);    
        document.getElementById("1").value=z1;
    }
</script>
  
  <!-- Tap Target Structure -->
  <div class="tap-target" data-activates="add">
    <div class="tap-target-content">
      <h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add some hates first!</h5>
      <p>&nbsp;&nbsp;&nbsp;In order to use this app, simply choose a few of the listed topics that you dislike by clicking on them, and get connected to another hate-filled like-minded individual!</p>
    </div>
  </div>
  </div>
  <script type="text/javascript">
  window.onload=function(){ 
  $('.tap-target').tapTarget('open');
  }
  </script>

      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
      <!-- change hate and list -->
 <%
 rs1.close();
	pStmt1.close();
 conn.close();

}else{
	String[] h = f.split(";");
	%>
	

<br><br>
<br>
   <div class="container">
   <div class="row">
    <div class="col l10 m10 s10">
     <div class="card-panel">
    <h5>Hi! Here are some people who have the same hate as you.</h5>
    <p>Click the edit <i class="material-icons">edit</i> to add some hates to start search.</p>
    <a class="black-text">Here are what you hate: </a>
    <!-- show specific hate -->
    <%
    String q = "";
    for(String value: h){
        if (value.equals("01")) q += "Video,";
	if (value.equals("02")) q += "Books,";
	if (value.equals("03")) q += "Netflix,";
	if (value.equals("04")) q += "Public Speaking,";
	if (value.equals("05")) q += "Animals,";
	if (value.equals("06")) q += "Anime,";
	if (value.equals("07")) q += "Apple,";
	if (value.equals("08")) q += "Crowds,";
	if (value.equals("09")) q += "Coffee,";
	if (value.equals("10")) q += "Loneliness,";
	if (value.equals("11")) q += "Mondays,";
	if (value.equals("12")) q += "Family,";
	if (value.equals("13")) q += "This app,";
	if (value.equals("14")) q += "Cold Weather,";
	if (value.equals("15")) q += "Socializing,";
	if (value.equals("16")) q += "Pennies,";
	if (value.equals("17")) q += "Politicians,";
	if (value.equals("18")) q += "Samsung,";//add
	if (value.equals("19")) q += "Spam Mail,";
	if (value.equals("20")) q += "Rude People,";
	if (value.equals("21")) q += "Slow Wifi,";
	if (value.equals("22")) q += "Olives,";
	if (value.equals("23")) q += "Smokers,";
	if (value.equals("24")) q += "Being broke,";
	if (value.equals("25")) q += "Traffic,";
	if (value.equals("26")) q += "Ads,";
	if (value.equals("27")) q += "Hugs,";
	if (value.equals("28")) q += "Spiders,";
	if (value.equals("29")) q += "Spoilers,";
	if (value.equals("30")) q += "Regrets,";
	if (value.equals("31")) q += "Math,";
	if (value.equals("32")) q += "Teammates,";//add
    }
    out.print(q.substring(0, q.length()-1));
   

    %>
    </div>
   </div>
   </div>
   </div>
   <div style="position: fixed;top:auto; left: auto; right: 50px;bottom:50px;" >
   <!-- Element Showed -->
   <form method="post" action="favorite.jsp">
<input id="1" type="hidden"  name="name" value=<%=user %>>
     <input id="key1" class="validate" type="hidden" name="key1" value=<%=key1 %> > 
              <input id="key2" class="validate" type="hidden" name="key2" value=<%=key2 %> > 
              <input id="key3" class="validate" type="hidden" name="key3" value=<%=key3 %> > 
              
                          <input id="key4" class="validate" type="hidden" name="key4" value=<%=key2 %> > 

  <button id="add" class="large waves-effect waves-light btn btn-floating" type="submit"><i class="large material-icons">edit</i></button>
  </form>
 <script>
    document.getElementById("add").onclick = function(){
        var z1 = $("#1").val();
       	var key1 = $("#key1").val(); 
        var key2 = $("#key2").val(); 
        var key3 = $("#key3").val(); 
        z1 = strEnc(z1,key1,key2,key3);    
        document.getElementById("1").value=z1;
    }
</script>
  
  </div>

<!-- find people who have the same hate -->
    		   <div class="container">
    		      <div class="row">
    <div class="col l10 m10 s10">
	<%
	Public w = new Public();
	String length = w.strEnc(user, key1, key2, key3);
    int distance = h.length;
	int count = 0;
	String same="";
	
	PreparedStatement pStmt2 = conn.prepareStatement("select * from dbo.favorite");  
    ResultSet rs2 = pStmt2.executeQuery();
    while(rs2.next()){
    	String[] check = rs2.getNString("favorite").split(";");
    	int d=check.length;
    	for(int i=0;i<distance;i++){
    		for(int j=0;j<d;j++){
    			if(h[i].equals(check[j])){
    				count+=1;
    				same+=h[i]+";";
    			}
    		}
    	}
    	String name=rs2.getNString("Name");
    	if(name.equals(user)){
    		same="";
    }else if(count>3){
    		String[] u = same.split(";");
    		same="";
    		String other=rs2.getNString("other");
    		
    		
    		%>

  <ul class="collapsible popout" data-collapsible="accordion">
   <li>
      <div class="collapsible-header"><i class="material-icons">account_circle</i><%=name %>
      	<div class="row">
      	<br>
      	<br>
    <a class="black-text">You have the same hate at: </a>

<%
    q = "";
    for(String value: u){
    if (value.equals("01")) q += "Video,";
	if (value.equals("02")) q += "Books,";
	if (value.equals("03")) q += "Netflix,";
	if (value.equals("04")) q += "Public Speaking,";
	if (value.equals("05")) q += "Animals,";
	if (value.equals("06")) q += "Anime,";
	if (value.equals("07")) q += "Apple,";
	if (value.equals("08")) q += "Crowds,";
	if (value.equals("09")) q += "Coffee,";
	if (value.equals("10")) q += "Loneliness,";
	if (value.equals("11")) q += "Mondays,";
	if (value.equals("12")) q += "Family,";
	if (value.equals("13")) q += "This app,";
	if (value.equals("14")) q += "Cold Weather,";
	if (value.equals("15")) q += "Socializing,";
	if (value.equals("16")) q += "Pennies,";
	if (value.equals("17")) q += "Politicians,";
	if (value.equals("18")) q += "Samsung,";//add
	if (value.equals("19")) q += "Spam Mail,";
	if (value.equals("20")) q += "Rude People,";
	if (value.equals("21")) q += "Slow Wifi,";
	if (value.equals("22")) q += "Olives,";
	if (value.equals("23")) q += "Smokers,";
	if (value.equals("24")) q += "Being broke,";
	if (value.equals("25")) q += "Traffic,";
	if (value.equals("26")) q += "Ads,";
	if (value.equals("27")) q += "Hugs,";
	if (value.equals("28")) q += "Spiders,";
	if (value.equals("29")) q += "Spoilers,";
	if (value.equals("30")) q += "Regrets,";
	if (value.equals("31")) q += "Math,";
	if (value.equals("32")) q += "Teammates,";//add
    }
    out.print(q.substring(0, q.length()-1));
   

    %>
    <p>Their profile: <%=other %></p>
    <a class="black-text">Contact: </a>
        <%
        String email="";
        PreparedStatement pStmt = conn.prepareStatement("select * from dbo.login where Name = '" + name + "'");  
        ResultSet rs = pStmt.executeQuery();
        if(rs.next()) email = rs.getNString("Date1");
        
        rs.close();
        pStmt.close();
        
        
    %>
    <a href="mailto:<%=email %>"><%=email %></a>
    </div>
    </div>
    <!-- content of writing -->
    <div class="collapsible-body">
      <div class="row">
       <form action="sendmail3.jsp" method = "post" onsubmit = "return validate()">  
        <div class="input-field col s12">
        <i class="material-icons prefix">mode_edit</i>
        <input type="hidden" name="email" value=<%=email+";"+length %>>
        <input type="hidden" name="username" value=<%=user+";"+length %>>
		<input id="key1" class="validate" type="hidden" name="key1" value=<%=key1 %> > 
              <input id="key2" class="validate" type="hidden" name="key2" value=<%=key2 %> > 
              <input id="key3" class="validate" type="hidden" name="key3" value=<%=key3 %> > 
              <input id="key4" class="validate" type="hidden" name="key4" value=<%=key2 %> > 
              <input id="textarea2" type="hidden" name="textarea2" value="">
          <textarea id="textarea1" class="materialize-textarea" name="other"></textarea>
          <label for="textarea1">What do you want to say to him/her?</label>
        </div>
          <button class="waves-effect waves-light btn right" id="send" name="submit"><i class="material-icons left">send</i>Send</button>
      </form>
       
      </div>
</div> 

     </li>
<br>

    		<% 
    		

    	}
    	count = 0;
    }
    

rs2.close();
pStmt2.close();
rs1.close();
pStmt1.close();
conn.close(); 
%>
</ul>
    </div>
</div>
</div>

      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>





<%} %>




<%}
            pStmt1.close();
            conn.close();  
            	}else{
            		%>
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
              <span class="card-title">Where do you come from?</span>
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

            		
            		<%
            	}
            	}catch(Exception e) { 
	e.printStackTrace(); 
	
	%>
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
              <span class="card-title">Where do you come from?</span>
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
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.11';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    </body>
</html>