<%@ page contentType="text/html; charset=UTF-8" %> 
<%
	session.invalidate(); //다 지움
	//session.removeAttribute("id");
	response.sendRedirect("../index.jsp");

%>