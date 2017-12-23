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
    <style type="text/css">
body {
    display: flex;
    min-height: 100vh;
    flex-direction: column;
  }

  main {
    flex: 1 0 auto;
  }
</style>

</head>
<body>


<button class="waves-effect waves-light btn right" id="send" name="submit" onclick="this.disabled=true;this.innerHTML='WAIT'; "><i class="material-icons left">send</i>Send</button>
   
 <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.js"></script>
  <script src="js/init.js"></script>
<div id="fb-root"></div>
</body>
</html>