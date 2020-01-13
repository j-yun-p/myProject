<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
	String jname = request.getParameter("jname");
	String id = request.getParameter("id");
	
	Map map = new HashMap();
	map.put("jname", jname);
	map.put("id", id);
	
	String pw = dao.findPw(map);

%>
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
	  opener.frm.passwd.value='<%=pw%>';
	  self.close();
  }
  </script>
 </head>
<body>
<div class="container">
	<div class="well well-lg">
	<%
		if(pw!=null){
			out.print("찾으시는 비밀번호는 " + pw+"입니다.<br><br>");
			out.print("<button class='btn btn-default' onclick='use()'>사용</button>");
		}else{
			out.print("비밀번호가 존재하지 않습니다.");
		}
	%> 
	</div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button class="btn btn-default" onclick="location.href='pwFind_form.jsp'">다시시도</button>
        <button class="btn btn-default" onclick="window.close()">닫기</button>
      </div>
    </div>

</div>
</body>
</html>