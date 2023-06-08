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
if((String)session.getAttribute("user")==null){
	out.print("<script language='JavaScript'>alert('Please log in first！');window.location.href='index.html'</script>");
}
%>
<%
	//When the user logs out, remove the session
	session.removeAttribute("user");
	session.removeAttribute("id");
	out.print("<script type='text/javascript'>alert('User logged out successfully.!');window.location.href='index.html';</script>");
%>
</body>
</html>