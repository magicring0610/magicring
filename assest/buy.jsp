<%@ page import = "java.sql.*, java.util.*"%>
<%@ page import = "java.util.Date, java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    try {
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
		if(session.getAttribute("name") != null )
		{
			
			sql="USE `magic`";
			con.createStatement().execute(sql);

			sql = "SELECT * FROM `car` WHERE `car_name`='"+session.getAttribute("name").toString()+"'";
			ResultSet rs = con.createStatement().executeQuery(sql);
				
			String shipway = request.getParameter("shipway");
			String payment = request.getParameter("payment");
			String coupon = request.getParameter("coupon");
			String order_id;
			
			while(rs.next())
			{
				sql = "INSERT `orders`(`order_name`,`product_id`,`product_num`,`get_way`,`coupon`,`pay_way`) "+"VALUE('"+session.getAttribute("name").toString()+"','"+rs.getString(7)+"','"+rs.getInt(5)+"','"+shipway+"','"+coupon+"','"+payment+"')";
				con.createStatement().executeUpdate(sql);
					
				sql = "SELECT `products_stock` FROM `products` WHERE `products_id`='"+rs.getInt(7)+"'";
				ResultSet re = con.createStatement().executeQuery(sql);
				int stock=0;
				while(re.next())
				{
					stock = re.getInt(1);
					stock = stock - rs.getInt(5);
					
				}
				sql = "UPDATE `products` SET `products_stock`='"+stock+"' WHERE `products_id`='"+rs.getInt(7)+"'";
					con.createStatement().executeUpdate(sql);
				
				
			}
			
			sql = "DELETE FROM `car` WHERE `car_name`='"+session.getAttribute("name").toString()+"'";
			con.createStatement().executeUpdate(sql);
		con.close();
		}
		out.print("<script>alert('下單成功！');window.location='index.jsp'</script>");
        
		 }
		
		 }
		 catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
	}
   
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}




%>




