<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html>
<html>
<head>
  <title>회원탈퇴</title>
  <meta charset="utf-8">
 </head>
<body>

<div class="w3-main w3-content w3-padding"
		style="max-width: 1500px; margin-top: 150px"  align="center">
  <h1 class="col-sm-offset-2 col-sm-10">회원탈퇴</h1>
  <form class="form-horizontal" 
  		action="delete"
  		method="post">
  	
  	<input type="hidden" name="id" value="${param.id}">
  		
    <div class="form-group">
      <label class="col-sm-offset-2 col-sm-8">Email:
      	탈퇴를 하시면 더 이상 컨텐츠를 제공받을 수 없습니다. <br>
      	그래도 탈퇴를 원하시면 아래 탈퇴버튼을 클릭하세요.
      </label>
    </div>
   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-default">탈퇴</button>
        <button type="button" class="btn btn-default" onclick="history.back()">취소</button>
      </div>
    </div>
  </form>
</div>
</body>
</html>