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
    <title>結帳</title>
    <link rel="stylesheet" href="assest/check.css">
    <link rel="stylesheet" href="assest/col.css">
	<style>
	* {
    box-sizing: border-box;
}

body {
    margin: 0px;
    background-color: #F9E5D8;
    font-family: "微軟正黑體";
}

h2 {
    margin: 30px;
}

.check-center {
    width: 100%;
    height: fit-content;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 40px 0;
}

.menu {
    background-color: #F8EDEB;
    text-align: center;
    width: 55.5%;
    height: fit-content;
    border-radius: 30px;
}

.table-center {
    display: flex;
    justify-content: center;
}

table {
    background-color: white;
    width: 83%;
    height: 550px;
    text-align: center;
    border-collapse: collapse;
}

.first-none {
    border-bottom: 1px black solid;
    width: 35%;
}

.first-name {
    border-bottom: 1px black solid;
    height: 55px;
    width: 25%;
}

.first-count {
    border-bottom: 1px black solid;
    height: 55px;
    width: 17.5%;
}

.first-total {
    border-bottom: 1px black solid;
    height: 55px;
    width: 17.5%;
}

.first-delete {
    border-bottom: 1px black solid;
    height: 55px;
    width: 4.5%;
}

td img {
    width: 200px;
    height: 154px;
}

.items {
    font-weight: bold;
    font-size: 18px;
}

.del  input{
    margin: 20px;
    padding: 5px 10px;
    border: 1px solid black;
    border-radius: 8px;
    background-color: white;
    font-size: 13px;
}

.del  input:hover{
    background-color: #eee;
    cursor: wait;
}

.total {
    
    font-weight: bold;
    font-size: 22px;
    height: 70px;
    font-size: 20px; 
    font-weight: bold; 
    text-align: right;
    padding-right: 40px;
}

.voucher {
    background-color: #F8EDEB;
    border-radius: 20px;
    border: none;
    height: 40px;
    font-size: 16px;
    width: 170px;
    text-align: center;
}


/*radio設定*/
.rbtn-height {
    height: 80px;
}


#radio-btn input[type="radio"] {
    display: none;
}

#radio-btn1 input[type="radio"] {
    display: none;
}

#radio-btn input:checked + .button {
    background-color:#FEC89A;
    color: black;
    cursor: grabbing;
}
#radio-btn1 input:checked + .button {
    background-color:#FEC89A;
    color: black;
    cursor: grabbing;
}

#radio-btn .button {
    background-color: #F9DCC4;
    color: black;
    font-size: 16px;
    padding: 10px 40px;
}
#radio-btn1 .button {
    background-color: #F9DCC4;
    color: black;
    font-size: 16px;
    padding: 10px 40px;
}

#radio-btn .button:hover {
    border: dashed 2px #F9DCC4;
    background-color: white;
    color: black;
    cursor: grab;
}
#radio-btn1 .button:hover {
    border: dashed 2px #F9DCC4;
    background-color: white;
    color: black;
    cursor: grab;
}

#radio-btn .round {
    border-radius: 30px;
}
#radio-btn1 .round {
    border-radius: 30px;
}
/*radio設定*/

.btn-center {
    display: flex;
    justify-content: space-around;
    height: 100px;
}

.goshopping input {
    width: 200px;
    height: 45px;
    border: 0;
    border-radius: 15px;
    background-color: #FEC89A;
    font-size: 17px;
    box-shadow: 0 5px 2px gray;
    display: inline-block;
} 

.checkout input {
    width: 250px;
    height: 45px;
    border: 0;
    border-radius: 15px;
    background-color: #FCD5CE;
    font-size: 18px;
    box-shadow: 0 5px 3px gray;
    display: inline-block;
} 

.goshopping input:hover {
    width: 220px;
    height: 48px;
    font-size: 21px;
}

.checkout input:hover {
    width: 270px;
    height: 48px;
    font-size: 22px;
} 

#num,
#up,
#down,
#Num,
#Up,
#Down {
  text-align: center;
  width: 20px;
  background-color: transparent;
  color: #000000;
  border: none;
}
.bin{
    height: 1%;
    width: 30px;
}
	</style>
</head>
<body>
    <!--header-->
    <header>
        <div class="headerleft">
        <a href="index.jsp"><img src="image/donut.png" width="50" height="50"></a>
            <form  method="post" action="search.jsp"> 
					<img src="image/search.png" width="15" height="15"> 
					<input class="search_input" placeholder="Search" id="search" name="search"></input>
				</form> 
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
            <button id="close">X</button></p>
            </dialog>
            <!--events / 廣告-->
            <a href="login.jsp"><img src="image/user.png" width="24" height="24"></a> <!--登入-->

        <div class="clearfix"></div>
    </header>
    <!--header-->

    <!--結帳畫面-->
    <div class="check-center">
    <div class="menu">
        <h2>結帳</h2>
        <div class="table-center">
        <table>
            <tr>
                <td class="first-none"></td>
                <td class="first-name">商品名稱</td>
                <td class="first-count">數量</td>
                <td class="first-total">小計</td>
                <td class="first-delete">&emsp;&emsp;</td>
            </tr>
             <% 
			String car_name = (String)session.getAttribute("name");
			sql = "SELECT * FROM `car` WHERE `car_name`='" + car_name + "'";
			ResultSet rs2 = con.createStatement().executeQuery(sql);
			int total_price= 0;
			int feetotal_price = 0;
			while(rs2.next()){
			sql = "SELECT *FROM `products` WHERE `products_id`='"+rs2.getString(7)+"'" ;
			ResultSet rs =  con.createStatement().executeQuery(sql);
			if(rs.next()){ 
				int num=rs2.getInt(5);
				int price=rs.getInt(4);
				int to_price=(num*price);
				total_price += to_price;
				feetotal_price = total_price + 60;
%>
            <tr>
                
                <td><img src="<%=rs2.getString(6)%>"></td>
                <td class="items"><%=rs.getString(2)%></td>
                <td class="items">
				數量：<%=rs2.getString(5)%>
                    
                </td>
                <td class="items"><%=to_price%></td>
				
                <td class="del">
<form method="post" action="check_delete.jsp">
						<button class="delete" name="delete" value="<%=rs2.getString(1) %>"><img  class="bin" src="image/bin.png" ></button>
						<input type="hidden" id="products_id" name="products_id" value="<%=rs.getString(1)%>">
					</form>				
					
				</td>
			
				<script>
    function setHiddenValue(value) {
        document.getElementById('hiddenValue').value = value;
    }
</script>

				
				
            </tr>
<%}
				 }%>
            

        <!--付款方式-->
		<form action="buy.jsp" method="POST">    
            <tr>
                <td colspan="3" id="radio-btn1" class="rbtn-height" style="border-top: 1px black solid;">
                    <font style="font-size: 17px;">取貨方式&emsp;</font>
                    <label><input type="radio" name="shipway" value="onlinepay" >
                        <span class="round button">宅配</span> 
                    </label>
                    <label><input type="radio" name="shipway" value="cash">
                        <span class="round button">超商自取</span>
                    </label>
                </td>
                <td colspan="2" class="total" style="border-top: 1px black solid;">運費：$ 60</td>
            </tr>
           
            <tr>
                <td colspan="2" class="rbtn-height">
                    <font  style="font-size: 17px;">優惠券&emsp;&emsp;</font>
                    <input type="text" class="voucher" placeholder="請輸入折價代碼"></input>
                </td>
                <td></td>
                <td colspan="2" class="total" style="font-size: 22px; font-style: italic;">TOTAL：$ <%=feetotal_price%></td>
            </tr>
            <tr>
                <td colspan="5" id="radio-btn" class="rbtn-height">
                    <font style="font-size: 17px">付費方式&emsp;&emsp;</font>
                    <label><input type="radio" name="payment" value="onlinepay" checked="checked">
                        <span class="round button">線上支付</span> 
                    </label>
                    <label><input type="radio" name="payment" value="cash">
                        <span class="round button">貨到付款</span>
                    </label>
                    <label><input type="radio" name="payment" value="ATM">
                        <span class="round button">ATM轉帳</span> 
                    </label>
                </td>
            </tr>
            
        </table>
        </div>
        <br><br>
        <!--結帳按鈕-->
        <div class="btn-center">
            <div class="goshopping">
                <input type="button" name="goshopping" value="繼續購物" onclick="location.href='allproduct.jsp'">
            </div>
            <div class="checkout">
                <input type="submit" name="checkout" value="結&emsp;&emsp;帳" onclick="checkout()">
            </div>
        </div>
		</form>
    </div>
    </div> 
    <!--結帳畫面-->
   
    <script>
    //購物完成彈跳視窗
        function checkout() {
        alert("購買完成囉😽\n期待您的下次光臨～");
        window.location.href="index.jsp";
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
    <script>
        var add1 = document.getElementsByClassName("add");
        for (var i = 0; i < add1.length; i++) {
            add1[i].index = i;
            add1[i].onclick = function () {
                var quota = this.index;
                var quantity = document.getElementsByClassName("num")[quota];
                var newvalue = parseInt(quantity.value) + 1;
                quantity.setAttribute("value", newvalue);
                changeSum(quota, newvalue);
            }
        }
        var minus1 = document.getElementsByClassName("minus");
        for (var j = 0; j < minus1.length; j++) {
            minus1[j].index = j;
            minus1[j].onclick = function () {
                var quota = this.index;
                var quantity = document.getElementsByClassName("num")[quota];
                if (parseInt(quantity.value) == 1) {
                    quantity.setAttribute("value", quantity.value);
                }
                 else {
                    var newvalue = parseInt(quantity.value) - 1;
                    quantity.setAttribute("value", newvalue);
                }
            }
        }
        // Enable hiddle nav bar
        var prevScrollpos = window.pageYOffset;
        window.onscroll = function() {
            var currentScrollPos = window.pageYOffset;
            if (prevScrollpos > currentScrollPos) {
                document.getElementById("nav").style.top = "0";
            } else {
                document.getElementById("nav").style.top = "-130px";
            }
        prevScrollpos = currentScrollPos;
        }
        // if(window.scrollTo(0,0)){
        //   document.getElementById("nav").style.opacity = "0";
        // })
    </script>   
</body>
</html>