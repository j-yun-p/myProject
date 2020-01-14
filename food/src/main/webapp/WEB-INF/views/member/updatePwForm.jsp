<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html>
<html>
<head>
  <title>비밀번호 변경</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  	function inCheck(f){
  		if(f.passwd.value.length==0){
  			alert("비밀번호를 입력하세요");
  			f.passwd.focus();
  			return false;
  		}
  		if(f.repasswd.value.length==0){
  			alert("비번확인을 입력하세요");
  			f.repasswd.focus();
  			return false;
  		}
  		if(f.passwd.value != f.repasswd.value){
  			alert("비밀번호가 일치하지 않습니다.");
  			f.passwd.value="";
  			f.repasswd.value="";
  			f.passwd.focus();
  			return false;
  		}
  		
  	}
  </script>
  
 </head>
<body>

<div class="w3-main w3-content w3-padding"
		style="max-width: 1300px; margin-top: 200px; text-align: center;">
 
  <form class="form-horizontal" 
  		action="updatePw"
  		method="post"
  		onsubmit="return inCheck(this)">
  	  	
    <div class="form-group">
      	<label class="control-label col-sm-2" for="passwd">비밀번호</label>
      <div class="col-sm-6" style="margin: 7px;">
        <input type="password" class="form-control" id="passwd" placeholder="Enter passwd" name="passwd">
      </div>
    </div>
    <div class="form-group" style="margin-top: 15px;" >
      	<label class="control-label col-sm-2" for="repasswd" >비밀번호 확인</label>
      <div class="col-sm-6" style="margin: 7px;">          
        <input type="password" class="form-control" id="repasswd" placeholder="Enter repasswd" name="repasswd">
      </div>
    </div>
   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8" style="margin-top: 20px;">
        <button type="submit" class="btn btn-default" >변경</button>
        <button type="button" class="btn btn-default" onclick="history.back()">취소</button>
      </div>
    </div>
  </form>
</div>
</body>
</html>