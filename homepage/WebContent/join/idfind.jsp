<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/jssi.jsp" %>
<%
String jname = request.getParameter("jname");
String tel = request.getParameter("tel");	

Map map = new HashMap();
map.put("jname", jname);
map.put("tel", tel);

String id = dao.findId(map);
String str = "";


%>

<!DOCTYPE html>
<html>
<head>
  <title>아이디 찾기</title>
  <meta charset="utf-8">
 
  <script type="text/javascript">
  function use(){
	  opener.frm.id.value='<%=id%>';
	  self.close();
  }
  </script>
 </head>
 <body>
 
<%
	if(id!=null){
%>	
	{str : "찾으시는 아이디는 <%=id%> 입니다."}
	<button class='btn btn-default' onclick='use()'>사용</button>
<%
	}else{

%>		
	{str : "아이디가 존재하지 않습니다."}
<%
	}
%>
 
 </body>