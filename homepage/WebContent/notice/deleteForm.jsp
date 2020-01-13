<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/nssi.jsp" %>
<%
		int no = Integer.parseInt(request.getParameter("no"));

%>

<!DOCTYPE html>
<html>
<head>
  <title>notice</title>
  <meta charset="utf-8">
  <style type="text/css">
  #red{
  		color :red;
  }
  </style>
  <script type="text/javascript">
  function input(){
	  var f = document.frm
	  if(f.passwd.value.length==0){
		  alert("비밀번호를 입력하세요");
		  f.passwd.focus();
		  return
	  }
	  f.submit();
  }
  
  </script>
  
 </head>
<body>
<jsp:include page="/menu/top.jsp"/>

<div class="container">
  <h1 class="col-sm-offset-2 col-sm-10">삭제</h1>
  
  <form class="form-horizontal" 
  		action="deleteProc.jsp"
  		method="post"
  		name="frm">
  		
 	 <input type="hidden" name="no" value="<%=no%>">
 	 <input type="hidden" name="col" value="<%=request.getParameter("col") %>">
  	 <input type="hidden" name="word" value="<%=request.getParameter("word") %>">
  	 <input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
  	

    <div class="form-group">
      <label class="control-label col-sm-2" for="passwd">비밀번호</label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="passwd" placeholder="Enter password" name="passwd">
      </div>
    </div>
 
 	<p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다.</p>
 
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="button" class="btn btn-default" onclick="input()">삭제</button>
        <button type="reset" class="btn btn-default">취소</button>
      </div>
    </div>
  </form>


</div>
</body>
</html>