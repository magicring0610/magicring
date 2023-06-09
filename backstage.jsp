
<!doctype html>
<%@ page import = "java.sql.*"%> 
<%@page import="java.util.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%
if(session.getAttribute("adimin")==null){
    out.print("<script>alert('請先登入'); window.location='login.jsp'</script>");
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>後臺管理界面</title>
<style type="text/css">
body 
{
  color:#000000;.
  background-image:url(image/back.png); 
  text-align:center; 
  letter-spacing:15px; 
}
ul li 
{
	list-style-type:none; 

}
ul li a 
{
	color:#000000;
	text-decoration: none; 
	list-style-type:none; 
	target:
}
</style>
</head>
<body background="image/back.png">

<h1><font face="標楷體" Size="7" ><b>後臺管理</b></font> <ali></h1>

<ul>
<li><a href="p_add.jsp" ><font face="標楷體" Size="5"><b>產品新增</b></font></a>
<li><a href="p_delete.jsp" ><font face="標楷體" Size="5"><b>產品刪除</b></font></a>
<li><a href="p_update.jsp"><font face="標楷體" Size="5"><b>產品修改</b></font></a>
<li><a href="p_ordersshow.jsp" ><font face="標楷體"Size="5"><b>訂單管理</b></font></a>
<li><a href="p_productshow.jsp" ><font face="標楷體" Size="5"><b>產品瀏覽</b></font></a>
<li><a href="p_membershow.jsp" ><font face="標楷體" Size="5"><b>會員瀏覽</b></font></a>
<li><a href="logout.jsp" ><font face="標楷體" Size="5"><b>登出</b></font></a>
</ul>

</body>
</html>
<!--if(session.getAttribute("adimin")==null){
    out.print("<script>alert('請先登入'); window.location='login.jsp'</script>");
}-->