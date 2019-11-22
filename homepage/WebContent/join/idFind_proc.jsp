<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
	String jname = request.getParameter("jname");
	String tel = request.getParameter("tel");
	
	Map map = new HashMap();
	map.put("jname", jname);
	map.put("tel", tel);
	
	String id = dao.findId(map);

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
  
  <script type="text/javascript">
  function use(){
	  opener.frm.id.value='<%=id%>';
	  self.close();
  }
  </script>
 </head>
<body>
<div class="container">
	<div class="well well-lg">
	<%
		if(id!=null){
			out.print("찾으시는 아이디는 " + id+"입니다.<br><br>");
			out.print("<button class='btn btn-default' onclick='use()'>사용</button>");
		}else{
			out.print("아이디가 존재하지 않습니다.");
		}
	%> 
	</div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button class="btn btn-default" onclick="location.href='idFind_form.jsp'">다시시도</button>
        <button class="btn btn-default" onclick="window.close()">닫기</button>
      </div>
    </div>

</div>
</body>
</html>