<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>홈페이지명</title>
<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<!-- Bootstrap CSS CDN -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!-- Font Awesome JS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<style>
.divider-text {
	position: relative;
	text-align: center;
	margin-top: 15px;
	margin-bottom: 15px;
}

.divider-text span {
	padding: 7px;
	font-size: 12px;
	position: relative;
	z-index: 2;
}

.divider-text span {
	padding: 7px;
	font-size: 12px;
	position: relative;
	z-index: 2;
}

.divider-text:after {
	content: "";
	position: absolute;
	width: 100%;
	border-bottom: 1px solid #ddd;
	top: 55%;
	left: 0;
	z-index: 1;
}

.row{
	margin: 0 auto;
}

.logo{
	margin : 16px 0px 12px 60px;
}
#signColor{
	border:none; 
	background-color:transparent;
	color : #007bff;
}
</style>
</head>
<body>
	<div class="card bg-light">
		<article class="card-body mx-auto" style="max-width: 400px;">
		<div class="row">
			<a href="${pageContext.request.contextPath}/"><img class="logo" src="images/logo.svg" width="38" height="37"></a>
			<h4 class="card-title mt-3 text-center">회원가입</h4>
		</div>
			
		<!-- 네이버 로그인 버튼 -->
		<a href="#" class="btn btn-block" ><img src="images/naverbutton.PNG" width="210px" height="40px"></a>
		<p class="divider-text">
			<span class="bg-light">OR</span>
		</p>
		
		<!-- 회원가입 폼태그 시작 -->
		<form action="${pageContext.request.contextPath}/signUp" method="POST">
			<!-- 닉네임 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-user"></i>
					</span>
				</div>
				<input id="userName" name="userName" class="form-control" placeholder="닉네임" type="text" required autofocus>
				<span class="check_font" id="name_check"></span>
			</div>
			
			<!-- 이메일 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-envelope"></i>
					</span>
				</div>
				<input id="userId" name="userId" class="form-control" placeholder="이메일" type="email" required>
				<span class="check_font" id="id_check"></span>
			</div>
			
			<!-- 비밀번호 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<input class="form-control" id="userPass" name="userPass" placeholder="비밀번호" type="password" required>
				<span class="check_font" id="pass_check"></span>
			</div>
			
			<!-- 비밀번호 확인 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<input class="form-control" id="rePass" name="rePass" placeholder="비밀번호 확인" type="password" required>
				<span class="check_font" id="repass_check"></span>
			</div>
			
			<!-- 등록 버튼 -->
			<div class="form-group">
				<input type="submit" id="signUp" name="signUp" class="btn btn-primary btn-block" value="등록">
			</div>
			
		</form>
		<!-- 회원가입 폼태그 끝 -->
			
		<!-- 로그인 링크 -->
		<form class="text-center" action="${pageContext.request.contextPath}/signIn" method="get">
	                 이미 회원가입을 하셨나요? <input id="signColor" type="submit" value="로그인">
	    </form>	
		
	</article>
</div>
	
	
	
	
<script>
// 이름 정규식 : 가~힣, 한글로 이루어진 문자만으로 2~6자리 이름을 적어야한다
var nameJ = /^[가-힣a-zA-z]{2,6}$/;
// 이메일 검사 정규식 : -_특수문자 가능하며 중앙에 @ 필수 그리고 . 뒤에 2~3글자 필요
/* var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; */
var mailJ = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
// 비밀번호 정규식 : A~Z, a~z,,0~9로 시작하는 4~12자리 비밀번호 가능
var pwJ = /^[A-Za-z0-9]{4,16}$/;

var text;
var check;
// 이름 정규식(한글로만 2~6자리 또는 특수문자 안됨)
$("#userName").keyup(function() {
	var userName = $("#userName").val();
	if(userName != "") {
		$.ajax({
			url : '/book/nameCheck?userName='+ userName,
			type : 'get',
			success : function(data) {			
				if (data == 1) {	// 1 : 아이디가 중복되는 문구
					text = "이미 등록된 이름입니다.";
					check=true;
				} else {		// 0 : 아이디 길이 / 문자열 검사					
					if(nameJ.test(userName)){
						text = "사용 가능합니다.";
						check=false;			
					} else {			
						text = "한글과 영어로만 2~6자리 입력가능합니다.";
						check=true;
					}	
				}
			$("#name_check").text(text);
			$("#name_check").css("color", "red");
			$("#signUp").attr("disabled", check);
			}
		});
	}
});

//아이디 유효성 검사(1 = 중복 / 0 != 중복)
$("#userId").keyup(function() {						
	// id = "id_reg" / name = "userId"
	var user_id = $('#userId').val();
	if(user_id != "") {
		$.ajax({
			url : '/book/idCheck?userId='+ user_id,
			type : 'get',
			success : function(data) {			
				if (data == 1) {	// 1 : 아이디가 중복되는 문구
					text = "이미 가입된 이메일입니다.";
					check=true;
				} else {		// 0 : 아이디 길이 / 문자열 검사					
					if(mailJ.test(user_id)){
						text = "사용 가능합니다.";
						check=false;			
					} else {			
						text = "유효하지 않은 양식입니다.";
						check=true;
					}	
				}
				$("#id_check").text(text);
				$("#id_check").css("color", "red");
				$("#signUp").attr("disabled", check);
			}, error : function() {
					console.log("실패");
			}
		});
	}
});

// 비밀번호 유효성 검사(숫자, 문자로만 4~12자리)
$("#userPass").keyup(function() {
	var val = $("#userPass").val();
	if(val != "") {
		if(pwJ.test(val)) {
			text = "사용가능합니다";
			check=false;
		} else {
			text = "숫자 또는 문자로만 4~12자리 입력가능합니다.";
			check=true;
		}
		$("#pass_check").text(text);
		$("#pass_check").css("color", "red");
		$("#signUp").attr("disabled", check);
	}
});

// 비밀번호 재확인
$("#rePass").keyup(function() {
	var userPass = document.getElementById("userPass").value;
	var rePass = document.getElementById("rePass").value;
	if(rePass != "") {
		if(userPass != rePass) {
			text = "비밀번호가 일치하지 않습니다.";
			check=true;
		} else {
			text = "비밀번호가 일치합니다.";
			check=false;
		}
		$("#repass_check").text(text);
		$("#repass_check").css("color", "red");
		$("#signUp").attr("disabled", check);
	}
});

</script>
</body>
</html>