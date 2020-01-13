<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/jssi.jsp"%>
<%
	String id = request.getParameter("id");
	if(id==null){
		id = (String)session.getAttribute("id");
	}
	JoinDTO dto = dao.read(id);
	String grade = (String)session.getAttribute("grade");
%>
<!DOCTYPE html>
<html>
<head>
<title>회원</title>
<meta charset="utf-8">

<script type="text/javascript">
  
  function updateM(){
	  var url = "updateForm.jsp";
	  url += "?id=<%=dto.getId()%>";
	  location.href=url;	  
  }
  
  function updatePw(){
	var url = "updatePwForm.jsp";
	url += "?id=<%=dto.getId()%>";
	location.href=url;
  }
  
  function deleteM(){
	var url = "deleteForm.jsp";
	url += "?id=<%=dto.getId()%>";
	url += "&oldfile=<%=dto.getFname()%>";
	location.href=url;
  }  

  function updateFile(){
	  var url = "updateFileForm.jsp";
	  url += "?id=<%=dto.getId()%>";
	  url += "&oldfile=<%=dto.getFname()%>";
	  location.href = url;	  
  }
  </script>

</head>
<body>
	<jsp:include page="/menu/top.jsp" />

	<div class="container">
		<h2 style="text-align: center"><%=dto.getJname()%>의 회원정보</h2>

		<table class="table table-bordered">
			<tr>
				<td colspan="2" style="text-align: center"><img
					src="<%=root%>/join/storage/<%=dto.getFname()%>" width="250px"
					height="250px" class="img-rounded"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><%=dto.getId()%></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><%=dto.getJname()%></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><%=dto.getTel()%></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><%=dto.getZipcode()%></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%=dto.getAddress1()%><%=dto.getAddress2()%></td>
			</tr>
			<tr>
				<th>직업</th>
				<td>직업 코드 : <%=dto.getJob()%>(<%=Utility.getCodeValue(dto.getJob())%>)
				</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td><%=dto.getJdate()%></td>
			</tr>

		</table>
		<div style="text-align: center">
			
			<%
				if(id!=null && !grade.equals("A")){
			%>
			<button class="btn btn-default" onclick="updateM()">정보수정</button>
			<button class="btn btn-default" onclick="updateFile()">사진수정</button>
			<button class="btn btn-default" onclick="updatePw()">비번변경</button>
  			<button class="btn btn-default" onclick="location.href='<%=request.getContextPath() %>/download?dir=/join/storage&filename=<%=dto.getFname()%>'">다운로드</button>
			<%	
				} 
			%>
			<%
				if(id!=null && grade.equals("A")){
			%>
			<button class="btn btn-default" onclick="location.href='list.jsp'">회원목록</button>
			<button class="btn btn-default" onclick="deleteM()">회원탈퇴</button>
			<%	
				} 
			%>
		</div>

	</div>
</body>
</html>