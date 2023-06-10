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
    <link rel="icon" href="image/doughnut.png">
    <title>熱賣商品</title>
    <link rel="stylesheet" href="assest/hot.css">
    <link rel="stylesheet" href="assest/col.css">
<style>
body {
    margin: 0 auto;
    background-color: #F9E5D8;
    font-family: 微軟正黑體;
}

main {
    margin: 20px 40px 40px 40px;
}

li {
    display: inline-block;
}

.title1 {
    background-color: #FCD5CE;
    width: 100%;
    height: 60px;
    font-size: 20px;
    font-weight: bolder;
    text-align: center;
    border-radius: 40px;
}

li a {
    line-height: 60px;
    padding: 0 100px;
    text-decoration: none;
    color: black;
}

li a:hover {
    color: white;
    background-color: #FFB5A7;
    padding: 15px 100px;
}

.title {
    background-color: #F9DCC4;
    width: 100%;
    font-size: 40px;
    font-weight: bolder;
    line-height: 80px;
    text-align: center;
    border-radius: 40px;
}

.detail {
    background-color: #FFB5A7;
    color: #fff;
    border-radius: 15px;
    border: 2px white solid;
    font-size: 15px;
    padding: 5px;
    font-weight: bolder;

}

.detail:hover {
    color: #FFB5A7;
    background-color: #fff;
    border: 2px #FFB5A7 solid;
}

.section-type {
    margin: 30px 0 0 0;
}

section {
    margin: 100px 0 0 0;
}

.ponde {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    align-items: center;
}

.product {
    background-color: #FCD5CE;
    padding: 20px;
    border-radius: 20px;
    margin: 40px 40px 0 40px;
    text-align: center;
    line-height: 30px;
	display: block;
}

.product img {
    height: 200px;
    border-radius: 20px;	
}

/* 購物側邊欄 */
/* 移除按鈕的預設樣式 */
button {
    background: none;
    border: none;
    padding: 0;
    cursor: pointer;
}

#sidebar {
    position: fixed;
    top: 0;
    left: -300px;
    width: 300px;
    height: 100%;
    background-color: #F8EDEB;
    transition: left 0.3s ease-in-out;
    overflow-y: scroll;
}

#sidebar.open {
    left: 0;
}

.close-btn {
    position: absolute;
    top: 10px;
    right: 10px;
    border: none;
    background-color: transparent;
    font-size: 16px;
    cursor: pointer;
}

.text-center {
    text-align: center;
}

.car {
    position: sticky;
    top: 0;
    left: 0;
    width: 100%;
    padding: 10px;
    background-color: #F8EDEB;
    z-index: 9999;
}

.sideimg {
    width: 150px;
}

.bottom-links {

    bottom: 10px;
    width: 100%;
    text-align: center;
}

.bottom-links a {
    display: block;
    margin-bottom: 5px;
}

/* 購物側邊欄 */

/* 頂端按鈕 */
#btn-top {
    display: none;
    position: fixed;
    bottom: 20px;
    right: 20px;
    cursor: pointer;
}
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
                <form class="s22" method="post" action="search.jsp"> 
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
        <!--events / 廣告-->
        <button id="event">EVENTS</button>
        <dialog id="eve">
            <p class="dragon">
                慶祝端午節&emsp;買5送2<br>
                抹茶甜甜圈&emsp;特賣$30<br><br>
                <a href="allproduct.jsp">
                    <img style="border-radius: 50%;" src="image/matcha.png" width="246.75" height="181.875">
                </a>
                <br><br>
                <button id="close">X</button>
            </p>
        </dialog>
    <!--events / 廣告-->
        <a href="login.jsp"><img src="image/user.png" width="24" height="24"></a> <!--登入-->

               <!--購物側邊欄-->
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
                    <a href="check.jsp"><b>前往結帳</b></a>
                   </div>
                   </div>
               <script>
                   function toggleSidebar() {
                   var sidebar = document.getElementById("sidebar");
                   sidebar.classList.toggle("open");
                   }

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
               </script>
       
               <!--購物側邊欄-->


        <div class="clearfix"></div>
    </header>
    <main>
        <section>
        <div class="title">
            熱銷五圈圈
        </div>
		<div class="ponde">
    <%
		sql="SELECT product_id, SUM(product_num) FROM `orders` GROUP BY `product_id` ORDER BY SUM(product_num) DESC LIMIT 5;";
		ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		while(rs.next()){
			sql="SELECT * FROM `products` WHERE `products_id` = '"+rs.getInt(1)+"';";
			ResultSet hot = con.createStatement().executeQuery(sql);
			while(hot.next()){
				out.print("<div class='product'>");
				out.print("<img src='"+hot.getString(7)+"'>");
				out.print("<h3>"+hot.getString(2)+"</h3>");
				out.print("$"+hot.getString(4)+"<br>");
				out.print("<a href='productdetail.jsp?productsid="+hot.getString(1)+"'><input type='button' value='查看商品詳情' name='detail' class='detail'></a>");
				out.print("</div>");
			}
		}
		
	%>
            
        </div>    
        </section>
    </main>

</body>
</html>
