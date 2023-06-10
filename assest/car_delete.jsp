<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%
    String car_id =request.getParameter("delete");

    sql = "SELECT * FROM `car` WHERE `car_id`='"+car_id+"'" ;
    ResultSet rs1=  con.createStatement().executeQuery(sql);
    while(rs1.next())  { 
	   sql = "SELECT *FROM `PRODUCTS` WHERE `products_id`='"+rs1.getString(7)+"'" ;
	   ResultSet rs =  con.createStatement().executeQuery(sql);
	   if(rs.next()){ 
	        int stock=rs.getInt(8);
            int num=rs1.getInt(5);
            int products_num=(stock+num);	
            sql="UPDATE `products` SET `products_stock` = '"+products_num+"' where products_id='"+rs1.getInt(7)+"';";
		    con.createStatement().executeUpdate(sql);	
            sql = "DELETE  FROM `car` WHERE `car_id`='"+car_id+"'";
            con.createStatement().execute(sql);
	
	}}
	con.close();
	out.print("<script>alert('刪除成功！'); window.location='allproduct.jsp'</script>");

 
%>