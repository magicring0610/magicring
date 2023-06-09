<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!-- Step 0: import library -->
<%@page import = "java.sql.*"%>
<html>
    <head><title>商品刪除</title>
    <style type="text/css">
body 
{
  
  margin-top: 30px;
  margin-left: 50px;
  font-family: 標楷體;
  background-image:url(image/back.png); 
}
select,input
{
  width:350px;
  height:30px;
  font-size:20px;
}

</style>
    </head>
    <body> 
     <h1><font color = black back>產品刪除</font></h1>
        <form action="p_delete1.jsp" method="post">
<% try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else
           {
//Step 3: 選擇資料庫
           String sql="USE `magic`";
           con.createStatement().execute(sql);

//Step 4: 執行 SQL 指令的ResultSet 
           sql = "SELECT `products_name` FROM `products`";
           ResultSet rs=con.createStatement().executeQuery(sql);

//Step 5：進行資料的處理
           out.println("<select size='1'   , name = 'name'>");
//將Name所有資料以下拉式選單表現
           while(rs.next())
                out.println("<option>" + rs.getString(1));
           out.println("</select>");
       }
//Step 6: 關閉連線
       con.close();
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
    out.println("class錯誤"+err.toString());
}
        %>   
        <br><br><input type="submit" value="刪除">
  </form>
  <button onclick="location.href='backstage.jsp'">回到後台</button>
    </body>
</html>