<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  	<form action="login" method="post">
    <div align="center" style="width: 100%;">
    	<table>
          <tr>
             <td colspan="2"><h1>登陆</h1></td>
           </tr>
           <tr>
             <td>账号:</td>
             <td><input type="text" name="userAccount"><span id="aa">${error}</span></td>
           </tr>
           <tr>
           	<td></td>
           </tr>
            <tr>
             <td>密码:</td>
             <td><input type="password" name="password"></td>
           </tr>
           <tr>
           	<td></td>
           </tr>
            <tr>
             <td colspan="2">
             <input type="submit" value="登录" id="ti">
             <a href="zhuce"><input type="button" value="注册"></a>
             </td>
           </tr>
          </table>
    </div>
    </form>
  </body>
  <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
  
  <script type="text/javascript">
  	 $("[name=userAccount]").change(function(){
        var userAccount  = $("[name=userAccount]").val();
        var password = $("[name=password]").val();
             $.post("checkUserAccount","userAccount="+userAccount,function(data){
	            if(data=="true"){
	              $("#aa").html(" ");
	               return true;
	            }else if(data=="false"){
	               $("#aa").html("账户不存在");
	            }
          	 });
     });
  </script>
  
</html>
