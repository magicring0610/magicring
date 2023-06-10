<%@ page pageEncoding="UTF-8" import="java.util.*, java.sql.*, org.json.*" %>
<%@include file="config.jsp" %>
<%
	session.removeAttribute("name"); 
	session.removeAttribute("username");
	session.removeAttribute("phonenumber");
	session.removeAttribute("mail");
	session.removeAttribute("adimin");
	con.close();
	out.print("<script>alert('登出成功！');window.location='index.jsp'</script>");
%>