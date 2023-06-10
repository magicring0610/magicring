<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>訂單資訊</title>
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
<h1>訂單瀏覽</h1>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost/magic?useSSL=false";
    Connection con = DriverManager.getConnection(url, "root", "1234");
    String sql = "SELECT * FROM orders";
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);

    while (rs.next()) {
        int productID = rs.getInt("product_id");
        String productName = "";
        String productPrice = "";
        int productQuantity = rs.getInt("product_num"); // 获取商品数量
       
        String productQuery = "SELECT products_name, products_price FROM products WHERE products_id = " + productID;
        Statement productStmt = con.createStatement();
        ResultSet productRs = productStmt.executeQuery(productQuery);
        if (productRs.next()) {
            productName = productRs.getString("products_name");
            productPrice = productRs.getString("products_price");
        }
        productRs.close();
        productStmt.close();

        int totalPrice = Integer.parseInt(productPrice) * productQuantity; // 计算订单金额
		int to_totalPrice = totalPrice+60;
        out.println("訂單ID：" + rs.getInt("order_id") + "<br>");
        out.println("買家名稱：" + rs.getString("order_name") + "<br>");
        out.println("商品ID："  + productID + " - " + productName + "<br>");
        out.println("商品價格："  + productPrice + "<br>");
        out.println("商品數量：" + productQuantity + "<br>");
        out.println("訂單金額："  + to_totalPrice + "<br>"); // 输出订单金额
        out.println("取貨方式：" + rs.getString("get_way") + "<br>");
        out.println("優惠：" + rs.getString("coupon") + "<br>");
        out.println("付款方式：" + rs.getString("pay_way") + "<br>");

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
