<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html> 
<html> 
<head>
  <title></title>
 <meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
.w3-bar-block .w3-bar-item {padding:20px}

.close_side{
	color: #aaa;
	margin-top: 7px;
	margin-right: 15px;
	float: right;
	font-size: 50px;
}
.close_side:hover{
	color: black;
	text-decoration: none;
	cursor: pointer;
}
#grade{
	margin-left: 20px;
	margin-top : 30px;
	color: #7d6d7d;
	font-size: 20px;
}
</style>
<body>

  	<c:choose>
		<c:when test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
			<c:set var="str">관리자 페이지입니다.</c:set>
		</c:when>
		<c:when test="${not empty sessionScope.id && sessionScope.grade != 'A'}">
			<c:set var="str"> ${sessionScope.id}님 페이지입니다.</c:set>
		</c:when>
		<c:otherwise>
			<c:set var="str">로그인 후 이용해 주세요.</c:set>
		</c:otherwise>
	</c:choose>
	
<!-- Sidebar (hidden by default) -->
<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:20%;min-width:200px" id="mySidebar">
  <a class="close_side" onclick="w3_close()" >&times;</a>
  <p id="grade">${str} </p>
  
  <c:choose>
    	<c:when test="${empty sessionScope.id }">
		    <a href="#food" onclick="w3_close()" class="w3-bar-item w3-button">Food</a>
    	</c:when>
    	<c:otherwise>
			<a onclick="mypage()" class="w3-bar-item w3-button">MYPAGE</a>
		  	<a href="#food" onclick="w3_close()" class="w3-bar-item w3-button">Food</a>
			<a href="#upload" onclick="w3_close()" class="w3-bar-item w3-button">Upload</a>    
		</c:otherwise>
    </c:choose>

</nav>

<!-- Top menu -->
<div class="w3-top">
  <div class="w3-white w3-xlarge" style="max-width:1700px;margin:auto">
    <div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">☰</div>
    
    <c:choose>
    	<c:when test="${empty sessionScope.id }">
		    <div class="w3-right w3-padding-16" onclick="create()" style="cursor:pointer; margin-top: 20px;">join &nbsp;</div>
		    <div class="w3-right w3-padding-16" onclick="login()" style="cursor:pointer; margin-top: 20px;">login &nbsp;</div>
    	</c:when>
    	<c:otherwise>
		    <div class="w3-right w3-padding-16" onclick="logout()" style="cursor:pointer">logout &nbsp;</div>    	
    	</c:otherwise>
    </c:choose>
    
    <div class="w3-center w3-padding-16" onclick="home()" style="font-size: 40px;">My Food</div>	
  </div>
</div>
  

  

<script>
// Script to open and close sidebar

function home(){
	var url = "/food";
	location.href=url;
}
function create(){
	var url = "${root}/member/agree";
	location.href = url;
}
function login(){
	var url = "${root}/member/login";
	location.href = url;
}
function logout(){
	var url = "${root}/member/logout";
	location.href = url;
}
function mypage(){
	var url = "${root}/member/mypage";
	location.href = url;
}
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}
</script>

</body>
</html>