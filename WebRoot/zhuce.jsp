<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'zhuce.jsp' starting page</title>
    
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
    <form action="insertUserInfo" method="post" enctype="Multipart/form-data">
          <table border="1px solid black" align="center" cellpadding="6px" cellspacing="0px" style="text-align: center">
          <tr>
             <td colspan="2"><h3>注册</h3></td>
           </tr>
           <tr>
           
             <td>头像:</td>
             <td><input type="file" name="path"><span id="users">${error}</span>${uploadError}</td>
           </tr>
         
           <tr>
             <td>账号:</td>
             <td><input type="text" name="userAccount"><span id="userAccount">${error}</span></td>
           </tr>
           
            <tr>
             <td>新密码:</td>
             <td><input type="password" name="password"><span id="users">${error}</span></td>
           </tr>
           
            <tr>
             <td>确认密码:</td>
             <td><input type="password" name="reqPassword"><span id="que">${error}</span></td>
           </tr>
           
            <tr>
             <td>邮箱:</td>
             <td><input type="text" name="email"><span id="email">${error}</span></td>
           </tr>
           
            <tr>
             <td>部门:</td>
             <td>
               <select name="deptid">
               <option value="0">请选择</option>
               <c:forEach items="${departmentList}" var="depts">
                  <option value="${depts.deptid}">${depts.deptname}</option>
               </c:forEach>
               </select>
             </td>
           </tr>
           
            <tr>
             <td colspan="21">
             <input type="submit" value="确定" id="ti">
             <a href="index.jsp"><input type="button" value="返回"></a>
              <input type="reset" value="清空">
             </td>
           </tr>
         </table>
         </form>
  </body>
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
  <script type="text/javascript">
     $(function(){
       $("#ti").click(function(){
       var userAccount = $("[name=userAccount]").val();
       var password = $("[name=password]").val();
       var email = $("[name=email]").val();
       var reqPassword = $("[name=reqPassword]").val();
       var deptId = $("[name=deptId]").val();
       var path = $("[name=path]").val();
       
       if(userAccount==""){
	       alert("账号不能为空");
	       return false;
       } 

       if(password==""){
	       alert("密码不能为空");
	       return false;
       } 
       
       var ss = /^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/; 
       if(email==""){
           alert("邮箱不能为空");
           return false;
       } else if(!ss.test(email)){
           $("#email").html("邮箱格式错误"); 
           return false;
       } 
       
       if(reqPassword==""){
           alert("确认密码不能为空");
           return false;
       }else if(reqPassword!=password){
           $("#que").html("两个密码不一致");
           return false;
       } 
       
       if(deptId=="0"){
       	   alert("部门不能为请选择");
           return false;
       } 
        
       if(path==""){
	        alert("头像不能为空");
	        return false;
       } 
       	return true;   
       });
       
        $("[name=userAccount]").change(function(){
          var userAccount = $("[name=userAccount]").val();
          $.post("checkUserAccount","userAccount="+userAccount,function(data){
             if(data=="true"){
                $("#userAccount").html("账号已存在");
                return true;
             }else if(data=="false"){
              $("#userAccount").html(" ");
                return false;
             }
          });
       });
       
     });
  </script>
</html>
