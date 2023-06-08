<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//Modify the administrator's password
	String user = session.getAttribute("user").toString();
	String id = session.getAttribute("id").toString();
	String passowrd = request.getParameter("pwd");
	String sql = "UPDATE `stumanagementbyweb`.`login` SET `password` = ? WHERE (`id` = ?)";
	Connection con = null;
	PreparedStatement ps = null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stumanagementbyweb","solaz","solaz");
		ps = con.prepareStatement(sql);
		ps.setString(1, passowrd);
		ps.setString(2, id);
		ps.executeUpdate();
		ps.close();
		con.close();
		session.removeAttribute("user");//Remove user session
		session.removeAttribute("id");
		out.print("<script type='text/javascript'>alert('Password changed successfully! Please log in again!');window.parent.frames.location.href='index.html';</script>");
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>