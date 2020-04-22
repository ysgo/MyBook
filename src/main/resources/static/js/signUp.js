// 이름 정규식 : 가~힣, 한글로 이루어진 문자만으로 2~6자리 이름을 적어야한다
//var nameJ = /^[가-힣a-zA-z0-9]{2,6}$/;
//// 이메일 검사 정규식 : -_특수문자 가능하며 중앙에 @ 필수 그리고 . 뒤에 2~3글자 필요
///* var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; */
//var mailJ = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
//// 비밀번호 정규식 : A~Z, a~z,,0~9로 시작하는 4~12자리 비밀번호 가능
//var pwJ = /^[A-Za-z0-9]{4,16}$/;
//
//var text;
//var check = new Array(true, true, true);
//
//// btn disabled
//$("#signUp").click(function(e) {
//	if (loginBtn() !== "success") {
//		e.preventDefault();
//		$("#signUp").prop("disabled", true);
//	}
})

//이름 유효성 및 중복 검사(한글로만 2~6자리 또는 특수문자 안됨)
//$("#name_check").on(
//		"click",
//		function() {
//			var userName = $('#userName').val();
//			if (userName != "") {
//				$.ajax({
//					url : '/nameCheck?userName=' + userName,
//					type : 'get',
//					success : function(data) {
//						if (data == 1) { // 1 : 닉네임이 중복되는 경우
//							text = "이미 등록된 이름입니다.";
//							check[0] = true;
//						} else { // 0 : 닉네임 길이 / 문자열 검사					
//							if (nameJ.test(userName)) {
//								text = "사용 가능합니다.";
//								check[0] = false;
//							} else {
//								text = "한글 또는 영어로만 2~6자리 입력가능합니다.";
//								check[0] = true;
//							}
//						}
//						alert(text);
//						loginBtn();
//					},
//					error : function(request, status, error) {
//						console.log("code:" + request.status + "\n"
//								+ "message:" + request.responseText
//								+ "\n" + "error:");
//					}
//				});
//			}
//		});
////아이디 유효성 검사(1 = 중복 / 0 != 사용가능)
//$("#id_check").on("click", function() {
//	var userId = $('#userId').val();
//	if (userId != "") {
//		$.ajax({
//			url : '/idCheck?userId=' + userId,
//			type : 'get',
//			success : function(data) {
//				if (data == 1) { // 1 : 아이디가 중복되는 문구
//					text = "이미 가입된 이메일입니다.";
//					check[1] = true;
//				} else { // 0 : 아이디 길이 / 문자열 검사					
//					if (mailJ.test(userId)) {
//						text = "사용 가능합니다.";
//						check[1] = false;
//					} else {
//						text = "유효하지 않은 양식입니다.";
//						check[1] = true;
//					}
//				}
//				alert(text);
//				loginBtn();
//			},
//			error : function() {
//				console.log("실패");
//			}
//		});
//	}
//});
//
//// 비밀번호 유효성 검사 및 비밀번호 재확인
//$("#repass_check").on("click", function() {
//	var userPass = document.getElementById("userPass").value;
//	var rePass = document.getElementById("rePass").value;
//
//	if (rePass != "") {
//		if (pwJ.test(rePass)) {
//			if (userPass != rePass) {
//				text = "비밀번호가 일치하지 않습니다.";
//				check[2] = true;
//			} else {
//				text = "비밀번호가 일치합니다.";
//				check[2] = false;
//			}
//		} else {
//			text = "숫자 또는 문자로만 4~12자리 입력가능합니다.";
//			check[2] = true;
//		}
//		alert(text);
//		loginBtn();
//	}
//});
//
//$('#signUp').on("click", function() {
//	signUpBtn();
//});
//
//function signUpBtn(count) {
//	console.log(count);
//	if (count == 3)
//		document.getElementById("#signUp").submit();
//	else
//		alert("중복체크를 확인해주세요.");
//}
//
//function loginBtn() {
//	var count = 0;
//	var btn = true;
//	for ( var i in check) {
//		if (check[i] == false)
//			count++;
//	}
//	console.log(count);
//	if (count == 3) {
//		$("#signUp").prop("disabled", false);
//		return "success";
//	} else if (count == 0) {
//		alert('중복체크 버튼을 눌러 확인해주세요!')
//	} else {
//		btn = true;
//		signUpBtn(count);
//	}
//	$("#signUp").attr("disabled", btn);
//}