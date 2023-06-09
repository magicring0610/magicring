<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "config.jsp" %> 
<%  
    
    String old_password = request.getParameter("old");
    String new_password1 = request.getParameter("new");
	String new_password2 = request.getParameter("checknew");

	sql="SELECT * FROM `member` WHERE `member_username`='"+session.getAttribute("username")+"';";
	ResultSet rs=con.createStatement().executeQuery(sql);
	if(rs.next()){
		if(old_password.equals(rs.getString(4))){
			if(old_password.equals("") || new_password1.equals("") || new_password2.equals("")){
				out.print("<script>alert('修改失敗，各項欄位不得為空！');window.location='profile.jsp'</script>");
				con.close();
			} 
			else if(!new_password1.equals(new_password2)){
				out.print("<script>alert('兩次輸入密碼不一致，請再試一次');window.location='profile.jsp'</script>");
				con.close();
			}
			else if(new_password1.equals(old_password)){
				out.print("<script>alert('不能重覆設定原來的密碼，請再試一次');window.location='profile.jsp'</script>");
				con.close();
			}
			else if(new_password1.equals(new_password2)){
				sql="UPDATE MEMBER SET `member_password` = '"+new_password1+"' WHERE `member_username`='"+session.getAttribute("username")+"';";
				int success=con.createStatement().executeUpdate(sql);
			
				if (success>0){
					session.removeAttribute("username"); 
					out.print("<script>alert('密碼變更成功，請重新登入！'); window.location='login.jsp' </script>");
				}
				con.close();
			}
		
		}
		else{
			out.print("<script>alert('舊密碼輸入錯誤，請再試一次');window.location='profile.jsp'</script>");
			con.close();
		}
	}
%>