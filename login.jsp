<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "config.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="image/doughnut.png">
    <title>登入</title>
    <link rel="stylesheet" href="assest/login.css">
    <link rel="stylesheet" href="assest/col.css">
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
            <a href="">ABOUT US</a> 
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
            <button id="close">X</button></p>
            </dialog>
            <!--events / 廣告-->
            <a href="login.jsp"><img src="image/user.png" width="24" height="24"></a> <!--登入-->
        

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
            </script>



        <div class="clearfix"></div>
    </header>

    <div class="array">
        <main>
            <h2>會員登入</h2> 
            <hr size="1.8" color="black">
            <div class="login">
                <form method="post" action="log.jsp">
                    <div class="login1">
                        <p>&emsp;帳號</p>  
                        <input type="text" name="username" placeholder="&emsp;請輸入帳號"><br>
                        <p>&emsp;密碼</p> 
                        <input type="password" name="password" placeholder="&emsp;請輸入密碼"><br>
                    </div>
                    <div class="btn">
                        <input type="submit" value="登入"> &emsp;&emsp;
                        <input type="reset" value="重新填寫">
                    </div>   
                </form>
            </div>
            <hr size="1.8" color="black">    
            <h5>還沒成為我們的會員!? 
                <a href="register.jsp"> ->進入註冊</a></h5>       
        </main>
    </div>
</body>
</html>
