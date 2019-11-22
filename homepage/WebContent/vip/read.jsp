<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/vssi.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));

	dao.upViewcnt(no);
	VipDTO dto = dao.read(no);
	
	String content = dto.getContent().replaceAll("\r\n", "<br>");
	
%>

<!DOCTYPE html>
<html>
<head>
  <title>vip</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  function updateb(no){
	  var url="updateForm.jsp";
	  url += "?no="+no;
	  url += "&col=<%=request.getParameter("col")%>";
	  url += "&word=<%=request.getParameter("word")%>";
	  url += "&nowPage=<%=request.getParameter("nowPage")%>"
	  location.href=url;
  }
  function delb(no){
	  var url="deleteForm.jsp";
	  url += "?no="+no;
	  url += "&col=<%=request.getParameter("col")%>";
	  url += "&word=<%=request.getParameter("word")%>";
	  url += "&nowPage=<%=request.getParameter("nowPage")%>"
	  location.href=url;
  }
  function replyb(no){
	  var url="replyForm.jsp";
	  url += "?no="+no;
	  url += "&col=<%=request.getParameter("col")%>";
	  url += "&word=<%=request.getParameter("word")%>";
	  url += "&nowPage=<%=request.getParameter("nowPage")%>"
	  location.href=url;
  }
  function listb(){
		var url = "list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>"
		location.href=url;
	}
  
  </script>
 </head>
<body>
<jsp:include page="/menu/top.jsp"/>

<div class="container">

	<h2>조회</h2>
	<div class="panel panel-default">
		<div class="panel-heading">작성자</div>
		<div class="panel-body"><%=dto.getWname() %></div>
		<div class="panel-heading">제목</div>
		<div class="panel-body"><%=dto.getTitle() %></div>
		<div class="panel-heading">내용</div>
		<div class="panel-body" style="height: 200px"><%=content%></div>
		<div class="panel-heading">조회수</div>
		<div class="panel-body"><%=dto.getViewcnt() %></div>
		<div class="panel-heading">등록일</div>
		<div class="panel-body"><%=dto.getWdate() %></div>
	</div>
	
	<button onclick="location.href='./createForm.jsp'" class="btn btn-default">등록</button>
	<button onclick="updateb('<%=no%>')" class="btn btn-default">수정</button>
	<button onclick="delb('<%=no%>')" class="btn btn-default">삭제</button>
	<button onclick="replyb('<%=no%>')" class="btn btn-default">답변</button>
	<button onclick="listb()" class="btn btn-default">목록</button>


</div>
</body>
</html>