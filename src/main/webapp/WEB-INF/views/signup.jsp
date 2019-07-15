<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>홈페이지명</title>
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="css/signup.css">
<!-- JS -->
</head>
<body>
	<div class="main">
        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form action="/book/signup" method="POST" class="register-form" id="register-form" autocomplete="off">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input required type="text" name="userName" id="userName" placeholder="Your Name"/>
                            	<span class="check_font" id="name_check"></span>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input required type="email" name="userId" id="userId" placeholder="Your Email"/>
                                <span class="check_font" id="id_check"></span>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input required type="password" name="userPass" id="userPass" placeholder="Password"/>
                            	<span class="check_font" id="pass_check"></span>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input required type="password" name="rePass" id="rePass" placeholder="Repeat your password"/>
                            	<span class="check_font" id="repass_check"></span>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                                <p id="checkPass"></p>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="images/books.jpg" alt="sing up image"></figure>
                        <p class="mt-5 mb-3 text-muted signup-image-link">이미 회원가입을 하셨나요? <a href="/book/signin?action=signin&id=2">로그인</a></p>
                        <input class="form-submit" value="네이버로 로그인"/>
                    </div>
                </div>
            </div>
        </section>
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
			$("#signup").attr("disabled", check);
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
				$("#signup").attr("disabled", check);
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
		$("#signup").attr("disabled", check);
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
		$("#signup").attr("disabled", check);
	}
});

</script>
</body>
</html>