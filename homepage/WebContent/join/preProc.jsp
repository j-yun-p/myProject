<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%

	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	String id = upload.getParameter("id");
	String str = "";
	
	if(dao.duplicateId(id)){
		str = "중복된 아이디입니다. 아이디 중복을 확인하세요.";
	}else{
		//보낸 파일 및 파마메터 받아서 dto저장하고 dao통해서 db에 저장
		
		request.setAttribute("upload", upload); 		
%>		
		<jsp:forward page="/join/createProc.jsp"/>
			
<%		
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
  <title>회원</title>
  <meta charset="utf-8">
 </head>
<body>
<jsp:include page="/menu/top.jsp"/>

<div class="container">
<div class="well well-lg">

	<br>
	<%=str %>
	<br>

</div>

<button onclick="history.back()" class="btn btn-default">다시시도</button>
   
</div>
</body>
</html>