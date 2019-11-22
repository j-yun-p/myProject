<%@ page contentType="text/html; charset=UTF-8" %> 
<%
	String root = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
  <title>아이디 찾기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=root%>/js/ajaxError.js"></script>
  
  <script type="text/javascript">
  	function infind(jname, tel){
  		if(jname==0){
  			alert("이름을 입력하세요");
  			document.frm.jname.focus();
  			return false;
  		}
  		if(tel==0){
  			alert("전화번호를 입력하세요");
  			document.frm.tel.focus();
  			return false;
  		}
  		
  		var url = "idfind.jsp";
  		var param = "janme="+jname + "&tel="+tel;
  		
  		$.get(url, param, function(data, textStatus){
  			var result = eval("("+data+")"); //json
  			$("#idfind").text(result.str);
  		})	
  	}
  
  </script>
  
  
  
 </head>
<body>

<div class="container">
  <h1 class="col-sm-offset-2 col-sm-10">아이디찾기</h1>
  <form class="form-horizontal" 
  		action="idFind_proc.jsp"
  		method="post">
 
    <div class="form-group">
      <label class="control-label col-sm-2" for="jname">이름</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="jname" placeholder="Enter name" name="jname">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="tel">전화번호</label>
      <div class="col-sm-6">          
        <input type="text" class="form-control" id="tel" placeholder="Enter tel" name="tel">
      </div>
    </div>
    <div class="form-group">        
    	<div class="col-sm-offset-2 col-sm-8">
    	  <button type="button" class="btn btn-default"
    	  	onclick="idfind(document.frm.jname.value, document.frm.tel.value)">찾기</button>
    	  <button type="reset" class="btn btn-default">취소</button>
    	  <div id="idfind"></div>
    	</div>
    </div>
  </form>
</div>
</body>
</html>