<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">

	.t_title{
		font-size: 15px;
		text-decoration: underline;
	}
	.t_content{
		font-size: 10px;
	}
	.pic{
		width : 350px;
		height: 420px;
	}
	.modal_pic{
		width : 60%;
		height: 70%;
	}
	.upload_photo{
		margin: 100px;
	}
	.filebox label{
		float : right;
		display: inline-block;
		color: #999;
		font-size: inherit;
		line-height: normal;
		vertical-align: middle;
		background-color: #333333;
		border: 1px solid #333333;
		cursor: pointer;
		color : white;
		width: 10%;
		height: 20%;
		text-align: center;
		margin: 5px;
	}
	.filebox input[type="file"] { /* 파일 필드 숨기기 */
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		border: 0;
		display: inline-block;
	}
	#food_star{
		width: 90%;
		height: 40px;
		margin-top: 8px;
		border: 1px solid #e2e2e2;
		padding: 5px 10px 10px 10px;
		display: inline-block;
		font-size: 14px;
	}
	#createbtn{
		width: 9%;
		height: 40px;
		margin-top: 8px;
		border: 1px solid #e2e2e2;
		background-color : white;
		font-weight: bold;
		display: inline-block;
	}
	#createbtn:hover{
		font-weight: bold;
		background-color : #ff92bc;
		border: 1px solid #ff92bc;
		color: white;
	}
	.pic_delete{
		position: absolute; 
		top:5px; 
		right: 15px; 
		color: white; 
		font-size: 30px;
		display: none;
	}

	.pic_update{
		position: absolute; 
		bottom:5px; 
		right: 20px; 
		color: white;
		display: none;
	}
	#deletebtn{
		background-color: #ffffff;
        background-color: rgba( 255, 255, 255, 0 );
        border-color: rgba( 255, 255, 255, 0 );
        color: white; 
	}

</style>
<body>
	<!-- !PAGE CONTENT! -->
	<div class="w3-main w3-content w3-padding"
		style="max-width: 1700px; margin-top: 100px">

		<hr>
		<!-- First Photo Grid-->	
		<div class="w3-row-padding w3-padding-16 w3-center" id="food">
		
					<c:forEach var="dto" items="${list}">
					<div style="display: inline;">					
					<table style="width: 350px; float: left; margin: 25px;">
						<tr>
							<td class="t_pic">
								<div style="position: relative;">
									<div class="pic_delete" id="pic_delete${dto.food_id}" onclick="pic_delete('${dto.food_id}', '${dto.food_img}')"><button id="deletebtn">&times;</button></div>
									<!-- <div class="pic_update" id="pic_update">수정하기</div> -->
									<div class="pic_star" style="position: absolute; bottom: 5px; left:20px; color: white;">
										<c:forEach begin="1" end="${dto.food_star}">★</c:forEach>
									</div>								
									<img class="pic" onclick="clickpic('${dto.food_id}')" id="pic${dto.food_id}" src="${pageContext.request.contextPath}/food_storage/${dto.food_img}">
								</div>
							</td>
						</tr>
						<tr>
							<td	class="t_title"><h3>${dto.food_title}</h3></td>
							
						</tr>
						<tr>
							<td class="t_content"><p>${dto.food_content}</p></td>
						</tr>
					</table>
					</div>
						<div id="fmodal" class="w3-modal">
							<div class="w3-modal-content">
							<span class="w3-button w3-hover-red w3-xlarge w3-display-topright" id="modal_close">&times;</span>
							<img class="modal_pic" src="${pageContext.request.contextPath}/food_storage/${dto.food_img}">
							<div><h3>${dto.food_title}</h3></div>
							<div><p>${dto.food_content}</p></div>
							
							</div>
						</div>
					</c:forEach>
		</div>
		
		

		<div class="upload_photo" id="upload">
		
			<form   name = "frm"
				action = "create"
				method = "post"
				enctype = "multipart/form-data"
				onsubmit = "return checkid(this)"
				accept-charset="UTF-8">
		

				<input class="w3-input" placeholder="Title : " name="food_title" id = "food_title">
				<div class="filebox"><label for="food_img">upload photo</label><input type="file" id="food_img" name="food_imgMF" accept=".jpg,.gif,.png" multiple="multiple"></div>

			 	<textarea class="w3-input w3-border" rows="7" cols="100%" name="food_content" id="food_content"  onclick="this.value='';"></textarea>
				<div class="food_select">
					<!-- <div class="review_star">★★★★ 아주 좋아요</div> -->
					<div class="form-group" >
						<select class="form-control" id="food_star" name="food_star">
							<option value="5">★★★★★  아주 좋아요</option>
							<option value="4">★★★★☆  맘에 들어요</option>
							<option value="3">★★★☆☆  보통 이에요</option>
							<option value="2">★★☆☆☆  그냥 그래요</option>
							<option value="1">★☆☆☆☆  별로 ㅠㅠㅠ</option>
						</select>
					<button class="btn btn-default" id="createbtn" style="float: right;" type="submit">register</button>					
					</div>
				</div>
			</form>
		</div>
	
		<hr>
	</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

	function pic_delete(id, oldfile){
	
		url = "delete";
		url += "?food_id=" + id;
		url += "&oldfile=" + oldfile;		
		
		var result = confirm('삭제하시겠습니까?');
		if(result){
			location.href = url;			
		}
	}
	function clickpic(food_id){
		document.getElementById('pic_delete'+food_id).style.display='block';
	}

	$(function (){
		
 	/* 	$('#pic').click(function (e){
			e.preventDefault();
			document.getElementById('pic_delete').style.display='block';
		}) */
		

/* 		$('#modal_close').click(function (e){
			e.preventDefault();
			document.getElementById('fmodal').style.display='none';
		}) */
	});

</script>
</html>