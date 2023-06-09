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
    <title>Magic Ring</title>
    <link rel="stylesheet" href="assest/profile.css">
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
            <dialog id="eve">
            <p class="dragon">    
            慶祝端午節&emsp;買5送2<br>
            抹茶甜甜圈&emsp;特賣$30<br><br>
            <a href="allproduct.jsp">
            <img style="border-radius: 50%;" src="image/matcha.png" width="246.75" height="181.875">
            </a>
            <br><br>
            <button id="close">X</button></p>
            </dialog>
            <!--events / 廣告-->
        <a href="login.jsp"><img src="image/user.png" width="25" height="25"></a> <!--登入-->

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
                <script>
                    function toggleSidebar() {
                    var sidebar = document.getElementById("sidebar");
                    sidebar.classList.toggle("open");
                    }
                </script>
        
                <!--購物側邊欄-->

        <div class="clearfix"></div>
    </header>
    <main>
        <div class="right">
            <div class="title">購買紀錄</div>
        <%
			
			sql="SELECT * FROM `orders` WHERE `order_name` ='"+session.getAttribute("name")+"' ";
			ResultSet rs=con.createStatement().executeQuery(sql);
			while(rs.next()){
				sql="SELECT * FROM `products` WHERE `products_id`="+rs.getInt(3);
				ResultSet pd=con.createStatement().executeQuery(sql);
				while(pd.next()){
					out.print("<div class='record'>");
					out.print("<img src='"+pd.getString(7)+"'>");
					out.print("<h2>"+pd.getString(2)+"</h2>");
					out.print("<p>數量："+rs.getString(4)+"</p>");
					out.print("<p>TOTAL：$120</p>");
					out.print("</div>");
				}
			}
		%>
			
			
        </div>
        <div class="left">
            <div class="title">會員資料</div>
            <div class="list">
                會員名稱<div class="data"><%=session.getAttribute("name")%></div><br>
                帳號<div class="data"><%=session.getAttribute("username")%></div><br>
                E-mail<div class="data"><%=session.getAttribute("mail")%></div><br>
                手機<div class="data"><%=session.getAttribute("phonenumber")%></div>
            </div>
        </div>
        <div class="left">
            <div class="title">修改密碼</div>
			<form action="update_password.jsp">	
				<div class="list">
					輸入舊密碼<input type="text" name="old" class="input" size="20"><br>
					新密碼<input type="text" name="new" class="input" size="20"><br>
					確認新密碼<input type="text" name="checknew" class="input" size="20"><br>
					<div class="btn">
						<input type="submit"  class="changepw" value="確認修改">
					</div>
				</div>
			</form>
        </div>
    </main>
</body>
</html>


