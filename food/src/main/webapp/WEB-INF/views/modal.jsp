<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#popbutton").click(function(){
			$("div.modal").modal({remote:"loayer.html"});
		})
	})

</script>
</head>
<body>
<div class="container"> 
	<button class="btn btn-default" data-target="#layerpop"
		data-toggle="modal">Modal</button>
	<button class="btn btn-default" id="popbutton">Modal2</button>
	<br/>
	<br/>
	
	<div class="modal fade" id="layerpop">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">Header</h4>
				</div>
				<div class="modal-body">Body</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<div>
		<span><strong>Comments</strong></span> <span id="cnt"></span>
	</div>
	<div>
	<div>
		<table class="table">
			<tr>
				<td>
					<textarea style="width: 1100px" rows="3" cols="30" id="comment" name="comment"></textarea>
					<br>
					<div>
						 <a href='#' onClick="fcomment('${result.code }')" class="btn pull-right btn-success">등록</a>
					</div>
				</td>
			 </tr>
		</table>
	</div>
	</div>
	<div>
		<form id="commentList" name="commentList" method = "post">
			<div id="commentList"></div>
		</form>
	</div>
</div>

<script type="text/javascript">
	function fcomment(code){
		
		
		
		
	}

</script>


</body>
</html>