<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "config.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Bungee+Inline&family=Lobster+Two&family=Pacifico&family=Rubik+Puddles&display=swap" rel="stylesheet">
    <title>搜尋結果</title>
    <link rel="stylesheet" href="assest/allproduct.css">
    <link rel="stylesheet" href="assest/col.css">
	<style>
	.countcar {
    margin: 3px;
    padding: 1px 5px;
    display: inline-block;
    border-radius: 50px;
    background-color: #7D4F50;
    color: #F8EDEB;
    font-weight: bold;
}
	</style>
</head>
<body>
    <header>
        <div class="headerleft">
        <a href="index.jsp"><img src="image/donut.png" width="50" height="50"></a>
            <div class="search">
                <form  method="post" action="search.jsp"> 
					<img src="image/search.png" width="15" height="15"> 
					<input class="search_input" placeholder="Search" id="search" name="search"></input>
				</form> 
            </div>
        </div>

        <div class="headerright">
        <a href="allproduct.jsp">ALL PRODUCTS</a>
            <a href="hot.jsp">HOT!!</a> 
            <a href="about.jsp">ABOUT US</a> 
            <a href="profile.jsp">MEMBER</a> 
            <button id="event">EVENTS</button>
        <a href="login.jsp"><img src="image/user.png" width="24" height="24"></a> <!--登入-->
<%
      String car_name = (String)session.getAttribute("name");
      sql = "SELECT SUM(car_sum) FROM car WHERE `car_name`='"+car_name+"'";
      ResultSet cc = con.createStatement().executeQuery(sql);
      cc.next();
   %>
        <button onclick="toggleSidebar()"><img src="image/shopping-cart.png" width="25" height="25"><p class="countcar"><%=cc.getString(1)%></p></button> 
        <div id="sidebar">
            <div class="text-center">
            <div class=car>
                <h2>購物車</h2>
                <button class="close-btn" onclick="toggleSidebar()">X</button>
            </div>
   <!--新-->
            <%
    sql = "SELECT * FROM `car` WHERE `car_name`='" + car_name + "'";
    ResultSet rs2 = con.createStatement().executeQuery(sql);
    while(rs2.next()){
        out.print("<img class='sideimg' src='"+ rs2.getString(6)+" '>");
        out.print("<p>" + rs2.getString(8) + "<br>");
        out.print("數量：" + rs2.getString(5) + "<br>");
        out.print("Total: " + rs2.getString(4) + "</p>");
%>
        <form method="post" action="car_delete.jsp">
            <button class="delete" name="delete" value="<%=rs2.getString(1) %>">刪除此品項</button>
        </form>
<%
 out.print( "<br>");
    }            
%>
            <div class="bottom-links">
            <a href="check.jsp">前往結帳</a>
            </div>
            </div>
        <script>
		//廣告
        let btn=document.querySelector("#event");
        let eve=document.querySelector("#eve");
        let close=document.querySelector("#close");
        btn.addEventListener("click", function(){
        eve.showModal();
        })
        close.addEventListener("click", function(){
        eve.close();
        })
    //廣告
            function toggleSidebar() {
            var sidebar = document.getElementById("sidebar");
            sidebar.classList.toggle("open");
            }
        </script>
        <!--購物側邊欄-->

        <div class="clearfix"></div>
    </header>
    <main>
		
    <section class="section-type">
        <div class="title">
            <a id="part1">搜尋結果</a>
        </div>
        <div class="ponde">
		<%
       String search = request.getParameter("search");
       sql="SELECT * FROM `products` where `products_name` like '%"+search+"%' ";
       ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
       %>
	<%
		while(rs.next()){
    %>  
	
			<form action="productdetail.jsp" method="POST">
				<div class="product">
					<img src="<%=rs.getString(7)%>">
					<h3><%=rs.getString(2)%></h3>
					$<%=rs.getString(4)%><br>
					<input type="button" value="查看商品詳情" name="detail" class="detail" onclick="location.href='productdetail.jsp?productsid=<%=rs.getString(1)%>'">
				</div>
			</form>
	<%
		}
	%>
        </div>
        
        
    </main>

</body>
</html>