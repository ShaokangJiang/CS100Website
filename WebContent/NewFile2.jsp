<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script type="text/javascript" src="js/des1.js"></script>
    <script>        
        function getResult(){
            //待加密字符串
            var str = document.getElementById("str").innerText;
            //第一个参数必须；第二个、第三个参数可选
            var key1 = document.getElementById("key1").innerText;  
            var key2 = document.getElementById("key2").innerText; 
            var key3 = document.getElementById("key3").innerText; 
            //加密方法        
            var  enResult = strEnc(str,key1,key2,key3);            
            //解密方法
            var deResult = strDec(enResult,key1,key2,key3);
            //展示结果
            document.getElementById("enStr").innerText = enResult; 
            document.getElementById("dnStr").innerText = deResult; 
        }
    </script>
</head>
<body>
<input type="button" value="获取加密结果与解密结果" onclick="getResult()" />
    <table>
        <tr>
          <td align="left">字符串：</td>
          <td><span id="str">admin</span></td>         
        </tr>
        <tr>          
          <td>加密key：</td>
          <td>key1=<span id="key1">1</span>;key2=<span id="key2">2</span>;key3=<span id="key3">3</span></td>
        </tr>
        <tr>
          <td align="left">加密结果：</td>
          <td align="left"><label id = "enStr"></label></td>
        </tr>
        <tr>
          <td align="left">解密结果： </td>
          <td align="left"><label id = "dnStr"></label></td>
        </tr>
    <table>
</body>
</html>