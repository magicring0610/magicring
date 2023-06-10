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
				
		String sql = "USE `magic`";
		con.createStatement().execute(sql);
				
		String name = (String)session.getAttribute("name");
		String products_name = request.getParameter("products_name");
		String products_id =request.getParameter("products_id");
		String products_stock =request.getParameter("products_stock");
		String products_price= request.getParameter("products_price");
		String products_png= request.getParameter("products_png");
		String products_num = request.getParameter("num");
		java.sql.Date car_date = new java.sql.Date(System.currentTimeMillis());
		if(Integer.parseInt(products_stock) < Integer.parseInt(products_num)){	
			out.println("<script>alert('請購買數量不要大於庫存！');window.location='allproduct.jsp'</script>");
		}
		
		else{
			int pro_stock=Integer.parseInt(products_stock);
			int pro_price=Integer.parseInt(products_price);
			int number=Integer.parseInt(products_num);   //數量
			int totalprice=(pro_price*number);  //總價
			int pro_num=((pro_stock)-number);     //庫存剩餘
			sql = "INSERT INTO `car` (`car_name`, `car_totalprice`, `car_sum`, `products_id`, `products_png` , `products_name`,`car_date`) VALUES('" + name + "','" + totalprice + "','" + number + "','" + products_id +"','" + products_png +"','" + products_name +"','" + car_date+"')";
			int no = con.createStatement().executeUpdate(sql);
			if (no > 0){
				out.print("<script>alert('加入購物車成功！'); window.location='allproduct.jsp'</script>");
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