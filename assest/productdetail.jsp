<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "config.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品資訊</title>
    <link rel="stylesheet" href="assest/productdetail.css">
    <link rel="stylesheet" href="assest/col.css">
		<style>
	.page{
		
		height: 50px;
		background-color:#FEC89A;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.square{
		background-color:white;
		border: 1px solid #FEAD67;
		padding: 5px;
		text-decoration: none;
		margin-right: 3px;
		color: #453E3E;
	}
	.page_select{
		height: 33.2px;
		border: 1px solid #FEAD67;
		color: #453E3E;
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
    <%
        String productsid=request.getParameter("productsid");
        sql = "SELECT * FROM `products` WHERE `products_id` = "+ productsid ;
		ResultSet rs=con.createStatement().executeQuery(sql);
        rs.next();
	
    %>
    <div class="image-container">
        <img class="img1" src="image/FFB5A7.png" alt="Image 1">
        <img class="img2" src="<%=rs.getString(7)%>" alt="Image 2">
    </div>
    <nav class="card1">      
        <div>
            <h2><%=rs.getString(2)%></h2>          
            <h5><%=rs.getString(5)%><br>
                <%=rs.getString(6)%>
            </h5>  
            <h5>熱量:<%=rs.getString(3)%>kal/售價:$<%=rs.getString(4)%></h5>         
        </div>
		<form action="car_add.jsp" method="POST">
        <div class="amount"><!--加減鈕-->
            <tr>
			<h6>庫存數量：<%=rs.getString(8)%></h6>
                <td class="big_btn_cart">
                    <div class="btn_cart">
							<input type="button" id="down" value="-" class="minus">
							<input type="text" id="num" value="1" name="num" class="num">
							<input type="button" id="up" value="+" class="add">
							<input type="hidden" id="name" name="name" value="session.getAttribute('name')">
							
							<input type="hidden" id="products_id" name="products_id" value="<%=rs.getString(1)%>">
							<input type="hidden" id="products_price" name="products_price" value="<%=rs.getString(4)%>">
							<input type="hidden" id="products_stock" name="products_stock" value="<%=rs.getString(8)%>">
							<input type="hidden" id="products_name" name="products_name" value="<%=rs.getString(2)%>">
							<input type="hidden" id="products_png" name="products_png" value="<%=rs.getString(7)%>">
						</div>
                        <div class="btn_buy">
                            <input type="submit" value="加入購物車 " onclick="confirmalert()">
                        </div>
                </td>
            </tr>
        </div>
		</form>
    </nav>
    <div class="evaluate"><h2>商品評價</h2></div>
    <section>      
        <div class="card2">
            <div class="zi_box_1"> 
                <form action="board.jsp" method="POST"> <!--評價區--> 
					<input type="hidden" name="productsid" value="<%=rs.getString(1)%>">
					<input type="text" name="name" placeholder="<%=session.getAttribute("name")%>" style="width:15%;height: 30px; margin-left:5%;">
					
					
					<textarea rows="5" name="content" placeholder="輸入您的評論" style="width:80%; height: 170px; margin-left:5%;"></textarea>
					<input type="submit"  value="送出" style="margin-right:0%;"><br>
                </form>
            </div>
        </div>  
    </section>
    <div class="comment"><h2>其他評論</h2></div>
    <%
		sql="SELECT * FROM `board` WHERE `product_id` ='"+productsid+"' ";
		rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		rs.last();
		int total_content = rs.getRow();
		int page_num=(int)Math.ceil((double)total_content/5.0);
		
		rs.first();
		String page_string = request.getParameter("page");
		if (page_string == null){
			page_string = "0"; 
		}         
		int current_page=Integer.valueOf(page_string);
		if(current_page==0){
			current_page=1;
		}	
		int start_record=(current_page-1)*5;	
		sql="SELECT * FROM `board` WHERE `product_id` ='"+productsid+"'ORDER BY `board_id` DESC LIMIT "+start_record+",5";
		rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql); 
	
	%>
<section> 	
        <div class="card3">
    <%
		sql="SELECT * FROM `board` WHERE `product_id` ='"+productsid+"'ORDER BY `board_id` DESC LIMIT "+start_record+",5";
		rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql); 
		while(rs.next()){
			out.print("<img class='img3' src='image/picture.jpg'>");
            out.print("<h3>"+rs.getString(2)+"</h3>");
			out.print("<h6>"+rs.getString(5)+"</h6>");
			out.print("<p>"+rs.getString(3)+"</p><hr>");    
		}
		
	%>   
			<div class="page">
				<p>共<p style="color:#7E0000"><%=page_num%></p>頁</p>&nbsp;
	<%
		if(current_page>1){
			out.print("<a class='square' href='productdetail.jsp?productsid="+request.getParameter("productsid")+"&page="+(current_page-1)+"'>"+"上一頁"+"</a>&nbsp;");
		}
		for(int i=1;i<=page_num;i++){
			out.print("<a class='square' href='productdetail.jsp?productsid="+request.getParameter("productsid")+"&page="+i+"'>"+i+"</a>&nbsp;");
		}
		if(current_page<page_num){
			out.print("<a class='square' href='productdetail.jsp?productsid="+request.getParameter("productsid")+"&page="+(current_page+1)+"'>"+"下一頁"+"</a>&nbsp;");
		}
	%>	

				&nbsp;跳到
				<select class="page_select"  onchange="location.href=this.options[this.selectedIndex].value">
	<%
					for(int i=1;i<=page_num;i++)
						out.print("<option class='square' value='productdetail.jsp?productsid="+request.getParameter("productsid")+"&?page="+i+"'>"+i+"</a>&nbsp;");
	%>	
				</select>
				頁
			</div>
		</div>
	
    </section>
</body>
<script>

    var Add = document.getElementById("up")
    var Reduce = document.getElementById("down")
    var num = document.getElementById("num")
  
    Add.onclick = function(){
      num.value = parseInt(num.value)+1;
    }
  
    Reduce.onclick = function(){
      if(num.value <= 0){
          num.value = 0;
      }else{
          num.value = parseInt(num.value)-1;
      }
    }
  
    var add = document.getElementById("Up")
    var reduce = document.getElementById("Down")
    var Num = document.getElementById("Num")
  
    add.onclick = function(){
      Num.value = parseInt(Num.value)+1;
    }
  
    reduce.onclick = function(){
      if(Num.value <= 0){
          Num.value = 0;
      }else{
          Num.value = parseInt(Num.value)-1;
      }
    }
  
  
      
  </script>
</html>

