<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>vip</title>
<meta charset="utf-8">
<style type="text/css">
#red {
	color: red;
}
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />

	<div class="container">
	
		<form class="form-horizontal" action="vipProc.jsp" method="post" name="frm">
			<p id="red" class="col-sm-offset-2 col-sm-10">비밀번호를 입력하세요.</p>

			<div class="form-group">
				<label class="control-label col-sm-2" for="passwd">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="passwd"
						placeholder="Enter password" name="passwd" required="requeird">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn btn-default">확인</button>
					<button type="reset" class="btn btn-default">취소</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>