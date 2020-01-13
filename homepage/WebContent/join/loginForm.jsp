<%@ page contentType="text/html; charset=UTF-8" %>
<%
	//---------------------쿠키설정 내용시작------------------------
	String c_idpw = "";
	String c_id_val = "";
	String c_pw_val = "";
	
	Cookie[] cookies = request.getCookies();
	Cookie cookie = null;
	
	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			cookie = cookies[i];
			
			if(cookie.getName().equals("c_idpw")){
				c_idpw = cookie.getValue();
			}else if(cookie.getName().equals("c_id_val")){
				c_id_val = cookie.getValue();
			}else if(cookie.getName().equals("c_pw_val")){
				c_pw_val = cookie.getValue();
			}
		}
	}
	//---------------------쿠키설정 내용 끝------------------------

%>

<!DOCTYPE html> 
<html> 
<head>
  <title>로그인 처리</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  function idFind(){
	  var url = "idFind_form.jsp";
	  var wr = window.open(url, "아이디 찾기", "width=500, height=400");
	  wr.moveTo((widow.screen.width-500)/2, (window.screen.width-400)/2);
  }
  function pwFind(){
	  var url = "pwFind_form.jsp";
	  var wr = window.open(url, "비밀번호 찾기", "width=500, height=400");
	  wr.moveTo((widow.screen.width-500)/2, (window.screen.width-400)/2);
  }
  
  </script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>

<div class="container">
  <h1 class="col-sm-offset-2 col-sm-10">로그인</h1>
  <form class="form-horizontal" 
  		action="<%=request.getContextPath()%>/join/loginProc.jsp"
  		name='frm'
  		method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">아이디</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="id" 
        placeholder="Enter id" name="id" required="required" 
        value='<%=c_id_val%>'>
        	
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="passwd">비밀번호</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" id="passwd" 
        placeholder="Enter password" name="passwd" required="required"
        value='<%=c_pw_val%>'>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-6">
      
        <div class="checkbox">
          <label>
          <%
          	if(c_idpw.equals("Y")){
          %>
           <input type="checkbox" name="c_idpw" value="Y" checked="checked"> Remember ID, PW
          <%
          	}else{
          %>
           <input type="checkbox" name="c_idpw" value="Y"> Remember ID, PW
          <%
          	}
          %>
          
          </label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-default">로그인</button>
        <button type="button" class="btn btn-default" 
        onclick="location.href='agreement.jsp'">회원가입</button>
        <button type="button" class="btn btn-default"
        onclick="idFind()">아이디 찾기</button>
        <button type="button" class="btn btn-default"
        onclick="pwFind()">비밀번호 찾기</button>
      </div>
    </div>
   </form>
</div>
</body>
</html>