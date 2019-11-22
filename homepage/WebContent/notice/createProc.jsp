<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/nssi.jsp" %>
<jsp:useBean id="dto" class="notice.NoticeDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	flag = dao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
  <title>notice</title>
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
<button class="btn btn-default" onclick="location.href='./createForm.jsp'">다시등록</button>
<button class="btn btn-default" onclick="location.href='./list.jsp'">목록</button>

</div>
</body>
</html>