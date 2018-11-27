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
    
    <title>My JSP 'update.jsp' starting page</title>
    
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
    <form action="updateUser" method="post" enctype="Multipart/form-data">
          <table border="1px solid black" align="center" cellpadding="6px" cellspacing="0px" style="text-align: center">
          <tr>
             <td colspan="2"><h3>修改</h3></td>
           </tr>
           
         
           <tr>
             <td>账号:</td>
             <td>
             <input type="hidden" name="userid" value="${info.userid}">
             <input type="text" value="${info.userAccount}" readonly="readonly">
              <input type="hidden" name="userAccount" value="${info.userAccount}">
             <span id="users">${error}</span></td>
           </tr>
           <tr>
             <td>新密码:</td>
             <td><input type="password" name="password" value="">
             	<input type="hidden" name="password1" value="${info.password}">
             <span id="users">${error}</span></td>
           </tr>
           
            <tr>
             <td>确认密码:</td>
             <td><input type="password" name="reqPassword" value=""><span id="users">${error}</span></td>
           </tr>
           
            <tr>
             <td>邮箱:</td>
             <td><input type="text" name="email" value="${info.email}"><span id="users">${error}</span></td>
           </tr>
           
            <tr>
             <td>部门:</td>
             <td>
               <select name="deptid">
	               <option value="0">请选择</option>
	               <c:forEach items="${dept}" var="depts">
	                  <option value="${depts.deptid}"
	                  	<c:if test="${depts.deptid==info.deptid}">selected</c:if>>${depts.deptname}</option>
	               </c:forEach>
               </select>
             </td>
           </tr>
           
           <tr>
             <td>头像:</td>
             <td>
             <img width="40px 40px" alt="" src="uploadFile/${info.pathImage}">
             <input type="file" name="path">
             <input type="hidden" name="pathImage" value="${info.pathImage}">
             <span id="users">${error}</span>${uploadError}
             </td>
           </tr>
           
            <tr>
             <td colspan="21">
             <input type="submit" value="确定" id="ti">
              <a href="chaxun"><input type="button" value="取消"></a>
             </td>
           </tr>
         </table>
         </form>
  </body>
  
  <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
  <script type="text/javascript">
       $("#ti").click(function(){
           var newpassword = $("[name=password]").val();
           var oldpassword = $("[name=password1]").val();
       	   var newreqPassword = $("[name=reqPassword]").val();
	        if(newreqPassword!=newpassword){ 
	          alert("两次密码不一致");
	          return false;
	        }
	        if(oldpassword==newpassword){
	          alert("新密码和旧密码不能一致");
	          return false;
	        } 
       		return true;
       	})
  </script>
</html>
