<!doctype html>
<%@ page import = "java.sql.*"%> 
<%@page import="java.util.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<html>
  <head>
    <title>產品新增</title>
<style type="text/css">
body 
{
  
  margin-top: 30px;
  margin-left: 50px;
  font-family: 標楷體;
  background-image:url(image/back.png); 
}


</style>
  </head>
  <body>
  
  <h1><font color = black back>產品新增</font></h1>
    <form name="Product" method = "post" action = "p_add1.jsp" >
        
        
	    <p>產品ID：<input type="text" name="id" required><br>
        <p>產品分類：<input type="text" name="kind" required><br>
	    <p>產品名稱：<input type="text" name="name" required><br>
	    <p>產品介紹1：<input type="text" name="intro1" required><br>
        <p>產品介紹2：<input type="text" name="intro2" required><br>
        <p>產品卡路里：<input type="text" name="cal" required><br>
	    <p>產品價格：<input type="text" name="price" required><br>
	    <p>產品庫存：<input type="text" name="stock" required ><br>
        <p>產品圖片路徑：<input type="text" name="img" required><br>
       

		
        <p>
        <input type = "submit" value = "新增產品" name="submit"> 
        <input type = "reset" value = "重新設定" name="reset">
       
        </p>
       
    </form>
     <button onclick="location.href='backstage.jsp'">回到後台</button>
  </body>
</html>