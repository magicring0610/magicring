<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<%  
	String username=request.getParameter("username");
	String password=request.getParameter("password");
			
	if(username.equals("adimin") &&  password.equals("1234")){
		session.setAttribute("adimin","adimin");
		//管理員介面jsp
		out.print("<script>alert('管理員登入成功！'); window.location='backstage.jsp' </script>");
	}else{
		sql = "SELECT COUNT(*) FROM `member` WHERE member_username = '"+username+"';";
		ResultSet check=con.createStatement().executeQuery(sql);
		check.next();
		if(check.getInt(1)==0){
			out.print("<script>alert('登入失敗，請確認帳號是否存在');window.location='login.jsp'</script>");
		}else{
			sql = "SELECT * FROM `member` WHERE member_username = '"+username+"';";
			ResultSet rs=con.createStatement().executeQuery(sql);
			rs.next();
			if(password.equals(rs.getString(4))){
				session.setAttribute("username",rs.getString(2));
				session.setAttribute("name",rs.getString(3));
				session.setAttribute("password",rs.getString(4));
				session.setAttribute("mail",rs.getString(5));
				session.setAttribute("phonenumber",rs.getString(6));
				session.setAttribute("sex",rs.getString(7));
				session.setAttribute("birth",rs.getString(8));
				session.setAttribute("address",rs.getString(9));
						
				out.print("<script>alert('登入成功！');window.location='index.jsp'</script>");
			}else{
				out.print("<script>alert('密碼錯誤，請重新輸入密碼！');window.location='login.jsp'</script>");
			}
		}	
	}
%>



