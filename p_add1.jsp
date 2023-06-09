<!doctype html>
<%@ page import = "java.sql.*"%> 
<%@page import="java.util.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
       
<html>

<head>
    <title>產品新增JSP</title>
</head>
<body>

<%  
             Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost/";
            Connection con=DriverManager.getConnection(url,"root","1234");
            String sql="USE magic";
            request.setCharacterEncoding("utf-8");
            con.createStatement().execute(sql);
		
					String id=request.getParameter("id");
                    String kind=request.getParameter("kind");
                    String name=request.getParameter("name"); 
                    String intro1=request.getParameter("intro1");
                    String intro2=request.getParameter("intro2");
					String cal=request.getParameter("cal");                 
                    String price=request.getParameter("price");
                    String stock=request.getParameter("stock");
                    String img=request.getParameter("img");
                     
                    sql="SELECT * FROM products WHERE products_name = '"+name+"' ";  
                     ResultSet rs=con.createStatement().executeQuery(sql); 


                     sql ="INSERT products (products_id,products_name,products_cal,products_price,products_intro1,products_intro2,products_png,products_stock,products_type)" 
                        +" VALUES ('"+ id + "','"+name+"','"+cal+"','"+price+"','"+intro1+"','"+intro2+"','"+img+"','"+stock+"','"+kind+"')";
                    con.createStatement().execute(sql);     
                                
         //Step 5: 顯示結果          
                out.print("<script>alert('新增成功'); window.location='p_add.jsp' </script>");
                con.close();
                    %>
                    <button onclick="location.href='backstage.jsp'">回到後台</button>
            </body>

            </html>