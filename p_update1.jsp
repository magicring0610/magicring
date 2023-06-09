<!doctype html>
<%@ page import = "java.sql.*"%> 
<%@page import="java.util.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<html>
    <head>
        <title>商品修改</title>
    </head>
    <body>      
	  <%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost/";
    Connection con = DriverManager.getConnection(url, "root", "1234");
    String useSql = "USE magic";
    request.setCharacterEncoding("utf-8");
    con.createStatement().execute(useSql);

    String id = request.getParameter("id");
    String kind = request.getParameter("kind");
    String name = request.getParameter("name");
    String intro1 = request.getParameter("intro1");
    String intro2 = request.getParameter("intro2");
    String cal = request.getParameter("cal");
    String price = request.getParameter("price");
    String stock = request.getParameter("stock");
    String img = request.getParameter("img");

    String sql = "UPDATE products SET products_type = '" + kind + "', products_name = '" + name + "', products_intro1 = '" + intro1 + "', products_intro2 = '" + intro2 + "', products_cal = '" + cal + "', products_price = '" + price + "', products_stock = '" + stock + "', products_png = '" + img + "' WHERE products_id = '" + id + "'";
    Statement stmt = con.createStatement();
    int rec = stmt.executeUpdate(sql);
    if (rec > 0) {
        out.print("<script>alert('更新成功'); window.location='p_update.jsp' </script>");
    } else {
       out.print("<script>alert('更新失敗'); window.location='p_update.jsp' </script>");
    }

    con.close();
%>


        <button onclick="location.href='backstage.jsp'">回到後台</button>
    </body>
</html>
