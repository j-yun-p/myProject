<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/vssi.jsp" %>
<jsp:useBean id="dto" class="vip.VipDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	flag = dao.create(dto);
%>
<!DOCTYPE html>
<html>
<head>
  <title>vip</title>
  <meta charset="utf-8">
 </head>
<body>
<jsp:include page="/menu/top.jsp"/>

<div class="container">

<div class="well well-lg">
<%
	if(flag){
		out.print("글 등록 성공입니다.");
	}else{
		out.print("글 등록 실패입니다.");
	}
%>
</div>
<button onclick="location.href='./createForm.jsp'" class="bnt bnt-default">다시등록</button>
<button onclick="location.href='./list.jsp'" class="bnt bnt-default">목록</button>

</div>
</body>
</html>