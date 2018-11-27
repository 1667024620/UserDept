<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
    <title>My JSP 'userlist.jsp' starting page</title>
    
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
    <form action="chaxun">
          <table border="1px solid black" align="center" cellpadding="5px" cellspacing="0px" style="text-align: center">
            <tr>
              <td colspan="6"><h4>用户列表</h4></td>
            </tr>
            
            <tr>
            <td colspan="6" align="center">
                                               用户账号:<input type="text" value="${userAccount}" name="userAccount">
                                                   部门:<select name="deptid">
	                   <option value="0" <c:if test="${deptid==0}">selected</c:if>>请选择</option>
		                  <c:forEach items="${departmentList}" var="depts">
		                    <option value="${depts.deptid}"
		                    	<c:if test="${deptid==depts.deptid}">selected</c:if>>${depts.deptname}</option> 
		                  </c:forEach>                                  
                	 </select>
               <input type="submit" value="查询">
               <input type="reset" value="清空">
            </td>
            </tr>
            <tr style="background-color: blue">
              <th>序号</th>
              <th>用户账号</th>
              <th>邮箱</th>
              <th>所属部门</th>
              <th>创建时间</th>
              <th>操作</th>
            </tr>
            
            <c:forEach items="${userInfoList}" var="li" varStatus="status">
            	<c:if test="${status.count%2==0}">
            		 <tr style="background-color: red">
		                <td align="center">${li.userid}</td>
		                <td>${li.userAccount}</td>
		                <td>${li.email}</td>
		                <td>
		               		<c:forEach items="${departmentList}" var="depts">
		               			<c:if test="${depts.deptid==li.deptid}">${depts.deptname}</c:if>
		                    </c:forEach>     
		               	</td>
		                <td><fmt:formatDate value="${li.createdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                <td>
			              <a href="selectuserid?userid=${li.userid}"><input type="button" value="修改"/></a>
		                  <input class="delUser" userid="${li.userid}" type="button" value="删除" />
						</td>
		              </tr>
            	</c:if>
	             <c:if test="${status.count%2==1}">
	            		 <tr>
			                <td align="center">${li.userid}</td>
			                <td>${li.userAccount}</td>
			                <td>${li.email}</td>
			                <td>
			               		<c:forEach items="${departmentList}" var="depts">
			               			<c:if test="${depts.deptid==li.deptid}">${depts.deptname}</c:if>
			                    </c:forEach>     
			               	</td>
			                <td><fmt:formatDate value="${li.createdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			                <td>
			                 <a href="selectuserid?userid=${li.userid}"><input type="button" value="修改"/></a>
		                  	  <input class="delUser" userid="${li.userid}" type="button" value="删除" />
			                </td>
			              </tr>
	            	</c:if>
            </c:forEach>
            
            <tr>
              <td colspan="6">
             	   共${pageTotal}页
                <a href="${pageContext.request.contextPath}/chaxun?pageNum=1&userAccount=${userAccount}&deptid=${deptid}">首页</a>
				<c:if test="${pageNum>1}">
					 <a href="${pageContext.request.contextPath}/chaxun?pageNum=${pageNum-1}&userAccount=${userAccount}&deptid=${deptid}">上一页</a>
				</c:if>
				<c:if test="${pageNum<pageTotal}">
               		 <a href="${pageContext.request.contextPath}/chaxun?pageNum=${pageNum+1}&userAccount=${userAccount}&deptid=${deptid}">下一页</a>
               	</c:if>
               	<a href="${pageContext.request.contextPath}/chaxun?pageNum=${pageTotal}&userAccount=${userAccount}&deptid=${deptid}">末页</a>
                                               第${pageNum}页
              </td>
            </tr>
            
            
          </table>
        ${falg}
        </form>
  </body>
  <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
  <script type="text/javascript">
  $(".delUser").on("click",function(){
  	var obj = $(this);
  	if(confirm("确定要删除吗？")){
			$.ajax({
				type:"GET",
				url:"delUser",
				data:{userid:obj.attr("userid")},
				dataType:"json",
				success:function(data){
					if(data=="1"){
						alert("删除成功!!!");
						obj.parents("tr").remove();
					}else{
						alert("删除失败!!!");
					}
				}
			})
  		}
  })
  </script>
</html>
