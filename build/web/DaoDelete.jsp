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

	//Delete student information
	if((String)session.getAttribute("user")==null){
		out.print("<script language='JavaScript'>alert('Please log in first！');window.location.href='index.html'</script>");
	}

	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String sql = "DELETE FROM `stumanagementbyweb`.`studentinfo` WHERE (`id` = ?)";
	Connection con = null;
	PreparedStatement ps = null;
	try{
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stumanagementbyweb","solaz","solaz");
		ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.executeUpdate();
		out.print("<script type='text/javascript'>alert('Successfully deleted student information!');window.location.href='Contain.jsp?pages=1';</script>");
		ps.close();
		con.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>