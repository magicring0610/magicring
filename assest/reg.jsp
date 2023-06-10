<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	
	try {   
            String url="jdbc:mysql://localhost/?serverTimezone=UTC";
            Connection con=DriverManager.getConnection(url,"root","1234");
            
			String sql = "USE `Magic`";
            con.createStatement().execute(sql);
				
			String username=request.getParameter("username");
			String name=request.getParameter("name");
			String password=request.getParameter("password");
			String mail=request.getParameter("mail");
			String phonenumber=request.getParameter("phonenumber");
			String sex=request.getParameter("sex");
			String birth=request.getParameter("birth");
			String address=request.getParameter("address");
			
			sql = "SELECT COUNT(*) FROM `member` WHERE member_username = '"+username+"';";
			ResultSet rs=con.createStatement().executeQuery(sql);
			int count = 0;
			while(rs.next()){
				count = rs.getInt(1);
			}
			if(count==0){
				if(username.equals("") || name.equals("") || password.equals("") || mail.equals("")){
					out.print("<script>alert('註冊失敗，必填項(帳號、真實姓名、密碼、電子郵件)有空值，返回註冊');window.location='register.jsp'</script>");
				}
				else{
					sql="INSERT `member` (member_username, member_name, member_password, member_mail, member_phonenumber, member_sex, member_birth, member_address)";
					sql+="VALUE ('" + username + "', ";
					sql+="'"+  name +"', ";
					sql+="'"+password+"', "; 
					sql+="'" + mail + "', ";
					sql+="'"+phonenumber+"', ";
					sql+="'"+sex+"', "; 
					sql+="'"+birth+"', "; 
					sql+="'"+address+"')";      
					con.createStatement().execute(sql);
					out.print("<script>alert('會員註冊成功，請登入');window.location='login.jsp'</script>");
				}
			}else{
				out.print("<script>alert('註冊失敗，此帳號已被註冊，返回註冊');window.location='register.jsp'</script>");
			}		
		}	
		catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
    out.println("class錯誤"+err.toString());
}
%>





