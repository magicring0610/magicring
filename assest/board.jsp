<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("name")==null){
    out.print("<script>alert('請先登入'); window.location='login.jsp'</script>");
}
try{
	Class.forName("com.mysql.jdbc.Driver");
	try {   
		String url="jdbc:mysql://localhost/?serverTimezone=UTC";
		Connection con=DriverManager.getConnection(url,"root","1234");
				
		String sql = "USE `Magic`";
		con.createStatement().execute(sql);
				
		String name = (String)session.getAttribute("name");
		
		String productsid =request.getParameter("productsid");
		String cont = request.getParameter("content");
		//換行
		cont=cont.replaceAll("\r","<br>");
		String content=cont;
		java.sql.Date board_date = new java.sql.Date(System.currentTimeMillis());
		if(content==null){	
			out.print("<script>alert('請確認留言欄位是否填寫完整'); window.location='productdetail.jsp?productsid="+request.getParameter("productsid")+"'</script>");
		}else{
			sql = "INSERT INTO `BOARD` (`board_name`, `board_comment`, `product_id`, `board_date`) VALUES('" + name + "','" + content + "','" + productsid +"','" + board_date+"')";
			int no = con.createStatement().executeUpdate(sql);
			if (no > 0){
				
				out.print("<script>alert('留言成功！'); window.location='productdetail.jsp?productsid="+request.getParameter("productsid")+"'</script>");
				con.close();
			}
		}
		
		
	}catch(SQLException sExec) {
			out.println("SQL錯誤"+sExec.toString());
	}	
}				
catch (ClassNotFoundException err) {
	out.println("class錯誤"+err.toString());
}
%>