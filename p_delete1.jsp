<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
    <head><title>成績查詢結果</title></head>
    <body>
        <%@page import="java.sql.*"%>
        <% try {
            // Step 1: 載入資料庫驅動程式
            Class.forName("com.mysql.jdbc.Driver");
            try {
                // Step 2: 建立連線
                String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
                Connection con = DriverManager.getConnection(url, "root", "1234");
                if (con.isClosed())
                    out.println("連線建立失敗");
                else {
                    // Step 3: 選擇資料庫
                    String sql = "USE `magic`";
                    con.createStatement().execute(sql);
                    // Step 4: 執行 SQL 指令的ResultSet
                    request.setCharacterEncoding("UTF-8");
                    String name = request.getParameter("name");
                    sql = "SELECT `products_name` FROM `products`";
                    ResultSet rs = con.createStatement().executeQuery(sql);
                    // Step 5: 進行資料的處理
                    String deleteSql = "DELETE FROM `products` WHERE `products_name` = '" + name + "'";
                    int rec = con.createStatement().executeUpdate(deleteSql);
                    if (rec > 0)
                        out.print("<script>alert('刪除成功'); window.location='p_delete.jsp' </script>");
                    else
                        out.print("<script>alert('刪除失敗'); window.location='p_delete.jsp' </script>");
                }
                // Step 6: 關閉連線
                con.close();
            } catch (SQLException sExec) {
                out.println("SQL錯誤" + sExec.toString());
            }
        } catch (ClassNotFoundException err) {
            out.println("class錯誤" + err.toString());
        }
        %>
        <button onclick="location.href='backstage.jsp'">回到後台</button>
    </body>
</html>
