<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <title>회원</title>
  <meta charset="utf-8">
  
  <script type="text/javascript">
  
  function updateM(){
	  var url = "update";
	  url += "?id=${dto.id}";
	  location.href=url;	   
  }
  
  function updatePw(){
	var url = "updatePw";
	
	location.href=url;
  }
  function deleteM(){
	  var url = "delete";
	  url += "?id=${dto.id}";
	  url += "&oldfile=${dto.name}";
	  location.href = url;	  
  }

  
  </script>
  <style type="text/css">
  	button {
		  background-color: #4CAF50;
		  color: white;
		  padding: 14px 20px;
		  margin: 8px 0;
		  border: none;
		  cursor: pointer;
		  width: 20;
	}

	button:hover {
		  opacity: 0.8;
	}
  </style>
 </head>
<body>

<div class="w3-main w3-content w3-padding"
		style="max-width: 1500px; margin-top: 250px"  align="center">
  
  <table class="table table-bordered">

  	<tr>
  		<th>아이디</th>
  		<td>${dto.id}</td>
  	</tr>
  	<tr>
  		<th>성명</th>
  		<td>${dto.name}</td>
  	</tr>
  	<tr>
  		<th>전화번호</th>
  		<td>${dto.tel}</td>
  	</tr>
  	<tr>
  		<th>이메일</th>
  		<td>${dto.email}</td>
  	</tr>
  	<tr>
  		<th>우편번호</th>
  		<td>${dto.zipcode}</td>
  	</tr>
  	<tr>
  		<th>주소</th>
  		<td>${dto.address1}${dto.address2} </td>
  	</tr>
  	<tr>
  		<th>날짜</th>
  		<td>${dto.fdate}</td>
  	</tr> 	
  </table>
  
  <div style="text-align: center; margin: 30px;" >
	  <c:if test="${not empty sessionScope.id && sessionScope.grade != 'A'}">
	  	 <button class="btn btn-default" onclick="updateM()">정보수정</button>
	  	 <button class="btn btn-default" onclick="updatePw()">비번변경</button>
	   </c:if>
	  <button class="btn btn-default" onclick="deleteM()">회원탈퇴</button>
	  
	  <c:if test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
		  <button class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/admin/list'">회원목록</button>
	  </c:if>
  
  </div>
  
</div>
</body>
</html>