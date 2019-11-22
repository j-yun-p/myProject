<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/nssi.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	dao.upViewcnt(no);
	NoticeDTO dto = dao.read(no);
	
	String content = dto.getContent().replace("\r\n", "<br>");
	String grade = (String)session.getAttribute("grade");
%>

<!DOCTYPE html>
<html>
<head>
  <title>notice</title>
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
		<div class="panel-body"><%=dto.getId() %></div>
		<div class="panel-heading">제목</div>
		<div class="panel-body"><%=dto.getTitle() %></div>
		<div class="panel-heading">내용</div>
		<div class="panel-body"><%=dto.getContent() %></div>
		<div class="panel-heading">조회수</div>
		<div class="panel-body"><%=dto.getViewcnt()%></div>
		<div class="panel-heading">등록일</div>
		<div class="panel-body"><%=dto.getWdate() %></div>
	</div>
	
	<button onclick="listb()" class="btn btn-default">목록</button>
	<%if(grade.equals("A")){ %>
	<button onclick="location.href='./createForm.jsp'" class="btn btn-default">등록</button>
	<button onclick="updateb('<%=no%>')" class="btn btn-default">수정</button>
	<button onclick="delb('<%=no%>')" class="btn btn-default">삭제</button>
	<%} %>
	
	
</div>
</body>
</html>