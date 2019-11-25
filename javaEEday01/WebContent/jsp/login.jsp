<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!
	public static final String DRIVER="com.mysql.jdbc.Driver";
	public static final String URL="jdbc:mysql:///login";
	public static final String USER="root";
	public static final String PASSWORD="root";
	String pass="";
	String  password="" ;
	public String equl(String str1, String str2){
		if(str1.equals(str2)){
			return "登陆成功";
		}else{
			return "登陆失败";
		}
	}
	%>
	<%
	String user_name =request.getParameter("name");//接收参数，所有的参数接收都是String类型
	password =request.getParameter("password");
	Class.forName(DRIVER);
	Connection conn=DriverManager.getConnection(URL,USER,PASSWORD);
	String sql="select password from user where user_name=?";
	PreparedStatement pstate = conn.prepareStatement(sql);
	pstate.setString(1, user_name);
	ResultSet res = pstate.executeQuery();
	if(res.next()){
		pass=res.getString(1);
	}
	%>
		<script >
			alert('<%= equl(pass,password)  %>');
		</script>
</body>
</html>