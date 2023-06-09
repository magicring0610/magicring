<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "config.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <link rel="icon" type="image" href="../assets/images/wine-bottle.png">
    <title>品牌介紹</title>
    <link rel="stylesheet" href="assest/about.css">
    <link rel="stylesheet" href="assest/col.css">
    <!-- 英文字體: Garamond -->
    <link href='https://fonts.googleapis.com/css?family=EB Garamond' rel='stylesheet'>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@200&display=swap');
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
            <div class="headerright">
           <a href="allproduct.jsp">ALL PRODUCTS</a>
            <a href="hot.jsp">HOT!!</a> 
            <a href="about.jsp">ABOUT US</a> 
            <a href="profile.jsp">MEMBER</a> 
            <a href="">EVEVNTS</a> 
            <a href="login.jsp"><img src="image/user.png" width="25" height="25"></a> <!--登入-->
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
            function toggleSidebar() {
            var sidebar = document.getElementById("sidebar");
            sidebar.classList.toggle("open");
            }
        </script>

        <!--購物側邊欄-->
        <div class="clearfix"></div>
    </header>
    <!-- 導覽列結束 -->
    <div class="classa">
        <div class="cardcontainer">
            <div class="card">
                <div class="photo">
                    <img src="image/zhen.jpg" alt="">
                </div>
                <h1>莉莉</h1>
                <h2>— 王儷蓁 —</h2>
                <p>這次負責的是後端的部分。後端要做的是學習如何將資料庫及網頁結合，並且能以網頁端修改資料庫。在這次的專案作業中，除了這些技能的學習，我們與人溝通合作的技能也有所提升。</p>
                <br><a href="https://www.instagram.com/wlj_0719/">不要偷看我的哀居！</a>
            </div>
            <div class="card">
                <div class="photo"><img src="image/kelly.jpg" alt=""></div>
                <h1>玲玲</h1>
                <h2>— 劉芝綾 —</h2>
                <p>這次的網頁專題我們需要整合前端的東西，過程中雖然遇到了很多問題，要去找資料思考該如何去寫出正確的程式，也需要前後端的互相合作，透過這次的專題，也對於要怎麼做出一個網頁有更多的了解</p>
                <br><a href="https://www.instagram.com/ling.1126/">看看可愛的我</a>
            </div>
            <div class="card">
                <div class="photo"><img src="image/chi.jpg" alt=""></div>
                <h1>或或</h1>
                <h2>— 李奇彧 —</h2>
                <p>這次的專案是由兩班共同合作而成，這次我們是負責後端，需要負責的是將整個系統完善，利用資料庫和程式結合，但這之中最容易遇到的問題就是版面跑掉，這需要雙方進一步的溝通才能達成共識。</p>
                <br>
                <a href="https://www.instagram.com/cheng12_05/">不好看</a>
            </div>
        </div>
    </div>
    <div class="classa">
        <div class="cardcontainer">
            <div class="card">
                <div class="photo">
                    <img src="image/ting.jpg" alt="">
                </div>
                <h1>RT</h1>
                <h2>— 黃若庭 —</h2>
                <p>在這次的專案作業中，除了這些技能的學習，我們與人溝通合作的技能也有所提升。</p>
                
            </div>
            <div class="card">
                <div class="photo"><img src="image/yy.jpg" alt=""></div>
                <h1>YZT</h1>
                <h2>— 葉蓁廷 —</h2>
                <p>過程中雖然遇到了很多問題，要去找資料思考該如何去寫出正確的程式，也需要前後端的互相合作，透過這次的專題，也對於要怎麼做出一個網頁有更多的了解</p>
                
            </div>
            <div class="card">
                <div class="photo"><img src="image/hana.jpg" alt=""></div>
                <h1>Hana</h1>
                <h2>— 簡子涵 —</h2>
                <p>這次的專案是由兩班共同合作而成，這次我們是負責前端，學到很多。</p>
                
            </div>
        </div>
    </div>
   
</body>

</html>