<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/vssi.jsp" %>
<jsp:useBean id="dto" class="vip.VipDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	String passwd = request.getParameter("passwd");
	if(passwd.equals("1234")) flag = true;
	
%>

<!DOCTYPE html>
<html>
<head>
<title>vip</title>
<meta charset="utf-8">

</head>
<body>
	<jsp:include page="/menu/top.jsp" />

	<div class="container">

		<div class="well well-lg">
			<% 
				if (flag) {
					out.print("성공");
			%>
			
			<%
				} else {
					out.print("잘못된 비번입니다.");
				}
			%>
		</div>
		<%
			if (!flag) {
		%>
		<button class="btn btn-default" onclick="history.back()">다시시도</button>
		<%
			}
		%>
		<button class="btn btn-default" onclick="location.href='list.jsp'">목록</button>

	</div>
</body>
</html>