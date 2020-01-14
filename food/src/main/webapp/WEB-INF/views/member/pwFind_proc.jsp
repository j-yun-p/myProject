<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>비밀번호 찾기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
  function use(){
	  opener.frm.passwd.value='${passwd}';
	  self.close();
  }
  
  </script>
  
 </head>
<body>

<div class="container">
  <h1 class="col-sm-offset-2 col-sm-10">비밀번호 찾기</h1>
  <div class="well well-lg col-sm-offset-1 col-sm-4">
  <c:choose>
  	<c:when test="${not empty passwd}">
  		찾으시는 비밀번호는 ${passwd} 입니다.<br><br>
  		<button class='btn btn-default' onclick='use()'>사용</button>
  	</c:when>
  	<c:otherwise>
  		잘못 입력하셨습니다.
  	</c:otherwise>
  </c:choose>

  </div>

    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button class="btn btn-default" onclick="location.href='pwFind'">다시시도</button>
        <button class="btn btn-default" onclick="window.close()">닫기</button>
        
      </div>
    </div>
    
</div>
</body>
</html>