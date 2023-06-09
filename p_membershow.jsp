<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>會員瀏覽</title>
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
<h1>所有會員</h1>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost/magic?useSSL=false";
      Connection con=DriverManager.getConnection(url,"root","1234");

        String sql = "SELECT * FROM member";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            out.println("會員 ID：" + rs.getInt("member_id") + "<br>");
            out.println("會員帳號：" + rs.getString("member_username") + "<br>");
            out.println("會員姓名：" + rs.getString("member_name") + "<br>");
            out.println("會員密碼：" + rs.getString("member_password") + "<br>");
            out.println("會員郵件：" + rs.getString("member_mail") + "<br>");
            out.println("會員電話：" + rs.getString("member_phonenumber") + "<br>");
            out.println("會員性別：" + rs.getString("member_sex") + "<br>");
            out.println("會員生日：" + rs.getString("member_birth") + "<br>");
            out.println("會員地址：" + rs.getString("member_address") + "<br>");
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
