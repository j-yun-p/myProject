<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인 처리</title>
<meta charset="utf-8">
  <script type="text/javascript">
  function idFind(){
	  var url = "idFind"
	  var wr = window.open(url, "Find ID", "width=500, height=400");
	  wr.moveTo((window.screen.width-500)/2, (window.screen.height-400)/2);
  }
  function pwFind(){
	  var url = "pwFind"
	  var wr = window.open(url, "Find passwd", "width=500, height=400");
	  wr.moveTo((window.screen.width-500)/2, (window.screen.height-400)/2);
  }
  </script>
  <style type="text/css">
  input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

  </style>

</head>
<body>

	<div class="w3-main w3-content w3-padding"
		style="max-width: 1000px; margin-top: 10%; " >
		<form class="form-horizontal"
			action="${pageContext.request.contextPath}/member/login" name='frm'
			method="post">
			
		
			
			
			
			<div class="form-group">
				<div class="col-sm-4">
				<label class="control-label col-sm-2" for="id">아이디</label>
					<input type="text" class="form-control" id="id"
						placeholder="Enter id" name="id" required="required"
						value='${c_id_val}'>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-4">
				<label class="control-label col-sm-2" for="passwd">비밀번호</label>
					<input type="password" class="form-control" id="passwd"
						placeholder="Enter password" name="passwd" required="required">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-6">

					<div class="checkbox">
						<label> 
						
						<c:choose>
							<c:when test="${c_id == 'Y'}">
								<input type="checkbox" name="c_id" value="Y" checked="checked"> Remember ID
          					</c:when>
							<c:otherwise>
								<input type="checkbox" name="c_id" value="Y"> Remember ID
          					</c:otherwise>
						</c:choose>

						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8" style="margin-top: 30px;">
					<button type="submit" class="btn btn-default">로그인</button>
					<button type="button" class="btn btn-default"
						onclick="location.href='agree'">회원가입</button>
					<button type="button" class="btn btn-default" onclick="idFind()">아이디
						찾기</button>
					<button type="button" class="btn btn-default" onclick="pwFind()">비밀번호
						찾기</button>
				</div>
			</div>
			
		</form>
	</div>
</body>
</html>