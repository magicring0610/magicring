<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>商品資訊</title>
    <style type="text/css">
        body {
            font-weight: bold;
            margin-top: 30px;
            margin-left: 50px;
            font-family: 標楷體;
            background-image: url(image/back.png);
        }

       hr {
    border: none;
    border-top: 1px solid #ccc;
    margin: 20px 0;
    height: 1px;
    background-color: #ccc;
}

       .fixed-button {
            position: fixed;
            top: 10px;
            right: 10px;
            font-size: 18px;
        }
    </style>
</head>
<body>
<h1>所有商品</h1>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost/magic?useSSL=false";
    Connection con=DriverManager.getConnection(url,"root","1234");
    String sql = "SELECT * FROM products";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);

    while (rs.next()) {
        out.println("商品 ID：" + rs.getInt("products_id") + "<br>");
        out.println("商品名稱：" + rs.getString("products_name") + "<br>");
        out.println("商品價格：" + rs.getDouble("products_price") + "<br>");
		out.println("商品庫存：" + rs.getInt("products_stock") + "<br>");
        out.println("商品熱量：" + rs.getDouble("products_cal") + "<br>");
        out.println("商品種類：" + rs.getString("products_type") + "<br>");
        out.println("商品介紹1：" + rs.getString("products_intro1") + "<br>");
        out.println("商品介紹2：" + rs.getString("products_intro2") + "<br>");
        out.println("<hr>");
    }

    con.close();
} catch (ClassNotFoundException e) {
    out.println("class錯誤：" + e.toString());
} catch (SQLException e) {
    out.println("SQL錯誤：" + e.toString());
}
%>

<button class="fixed-button" onclick="location.href='backstage.jsp'">回到後台</button>
</body>
</html>
