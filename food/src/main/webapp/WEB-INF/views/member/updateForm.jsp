<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>회원정보수정</title>
<meta charset="utf-8">
<style type="text/css">
#need {
	color: red;
}
</style>
<script type="text/javascript">

	function emailCheck(){
	
			var url="email_form";
						
			var wr = window.open(url, "Email 중복확인", "width=500, height=400");
			wr.moveTo((widow.screen.width-500)/2,(window.screen.height-400)/2);
		
	}

</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script> 
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script type="text/javascript">
function inCheck(f){

	if(f.tel.value.length==0){
		alert("전화번호를 입력하세요");
		f.tel.focus();
		return false;
	}
	if(f.email.value.length==0){
		alert("이메일을 입력하세요");
		f.email.focus();
		return false;
	}

}

function emailMsg(){
	alert("이메일 변경을 원하시면 Email변경 버튼을 클릭하세요");
	
}
function noupdate(){
	alert("수정할 수 없습니다.");
}

</script>
<style type="text/css">
 input[type=text], input[type=password], input[type=email] {
		  width: 50%;
		  padding: 12px 20px;
		  margin: 8px 0;
		  display: inline-block;
		  border: 1px solid #ccc;
		  box-sizing: border-box;
	}
	button {
		  background-color: #4CAF50;
		  color: white;
		  padding: 14px 20px;
		  margin: 10px;
		  border: none;
		  cursor: pointer;
		  width: 10%;
	}

	button:hover {
		  opacity: 0.8;
	}
</style>
</head>
<body>
	
	<div class="w3-main w3-content w3-padding"
		style="max-width: 1300px; margin-top: 200px; margin-left: 800px; " >
		<label class="col-sm-offset-2 col-sm-10" style="margin: 10px;">(<span id="need">*</span>
			필수입력사항)
		</label>
		<form class="form-horizontal" 
			action="update" 
			method="post"
			name='frm' 
			onsubmit="return inCheck(this)">
			
			<input type="hidden" name="id" value="${dto.id}">

			<div class="form-group">
				<label class="control-label col-sm-2" for="id">아이디</label>
				<div class="col-sm-4">
				<input type="text" class="form-control" id="tel"
						value="${dto.id}" name="tel">
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="name"><span
					id="need">*</span>이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="tel"
						value="${dto.name}" name="tel">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="tel">전화번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="tel"
						value="${dto.tel}" name="tel">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email"><span
					id="need">*</span>이메일</label>
				<div class="col-sm-3">
					<input type="email" class="form-control" id="email"
						value="${dto.email}" readonly name="email" onclick="emailMsg()">
				<button type="button" class="btn btn-default col-sm-2"
					onclick="emailCheck()">Email 변경</button>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_postcode">우편번호</label>
				<div class="col-sm-1">
					<input type="text" class="form-control" id="sample6_postcode"
						value="${dto.zipcode}" name="zipcode">
				<button type="button" class="btn btn-default col-sm-2"
					onclick="sample6_execDaumPostcode()">주소검색</button>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_address">주소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="sample6_address"
						value="${dto.address1}" name="address1"> <input type="text"
						class="form-control" id="sample6_detailAddress" value="${dto.address2}"
						name="address2">
				</div>
			</div>

		
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5" style="margin-left:20%; ">
					<button type="submit" class="btn btn-default">수정</button>
					<button type="reset" class="btn btn-default" onclick="history.back()">취소</button>
				</div>
			</div>

		</form>
	</div>
</body>
</html>