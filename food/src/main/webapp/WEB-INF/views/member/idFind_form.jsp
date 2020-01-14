<%@ page contentType="text/html; charset=UTF-8" %> 

<!DOCTYPE html>
<html>
<head>
  <title>아이디 찾기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    
 </head>
<body>

<div class="container">
  <h1 class="col-sm-offset-2 col-sm-10">아이디 찾기</h1>
  <form class="form-horizontal" 
  		action="idFind"
  		method="post">
    <div class="form-group">
    
      <label class="control-label col-sm-2" for="mname">이름</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" required="required">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">이메일</label>
      <div class="col-sm-6">          
        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
      </div>
    </div>
   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-default">찾기</button>
        <button type="reset" class="btn btn-default">취소</button>
      </div>
    </div>
  </form>
</div>
</body>
</html>