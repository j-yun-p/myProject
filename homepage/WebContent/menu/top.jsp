<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String root = request.getContextPath();
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
	
	String str = "";
	if(id!=null && grade.equals("A")){
		str = "관리자 페이지입니다.";
	}else if(id!=null && !grade.equals("A")){
		str = "안녕하세요 " + id + "님!";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<title>home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style type="text/css">
#grade{
	color : fuchsia;
	}
</style>

</head>
<body>
	
	<div class="container">

		<div class="jumbotron text-center">
			<h1>Bootstrap Page</h1>
			<%
				if(id!=null){
			%>
			<p id="grade"><%=str %></p>
			<%
				}
			%>
		</div>

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#"> WebSite </a>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<%
						if(id==null){
					%>
					<li><a href="<%=root%>/join/agreement.jsp"><span class="glyphicon glyphicon-user"></span>
							Sign Up</a></li>
					<li><a href="<%=root%>/join/loginForm.jsp"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
					<%
						}else{
					%>
					
					
					<li><a href="<%=root%>/join/read.jsp"><span class="glyphicon glyphicon-user"></span>
							My page</a></li>					
					<li><a href="<%=root%>/join/updateForm.jsp"><span class="glyphicon glyphicon-user"></span>
							update</a></li>
					<li><a href="<%=root%>/join/logout.jsp"><span class="glyphicon glyphicon-log-out"></span>
							Logout</a></li>
					
					<%
						}
					%>
					
					
					
				</ul>


				<ul class="nav navbar-nav">
					<li class="active"><a href="<%=root%>/index.jsp">Home</a></li>
<!-- 					<li class="dropdown"><a class="dropdown-toggle" -->
<!-- 						data-toggle="dropdown" href="#"> Test <span class="caret"></span></a> -->
<!-- 						<ul class="dropdown-menu"> -->
<!-- 							<li><a data-toggle="pill" href="">test1</a></li> -->
<!-- 							<li><a data-toggle="pill" href="">test2</a></li> -->
<!-- 						</ul> -->
<!-- 					</li> -->

					<li class="dropdown"><a href="<%=root%>/vip/vipForm.jsp">VIP</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">게시판<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<%=root%>/guest/list.jsp">게시판 목록</a></li>
							<li><a href="<%=root%>/guest/createForm.jsp">게시판 생성</a></li>
						</ul>
					</li>
					
					<li><a href="<%=root%>/notice/list.jsp">공지사항</a></li>
					<%
						if(id!=null && grade.equals("A")){
					%>
						<li><a href="<%=root%>/admin/list.jsp">회원목록</a></li>
					<%
						}
					%>		
				</ul>
			</div>
		</nav>

	</div>
</body>
</html>