	var text;
	var check = true;
	var pwJ = /^[A-Za-z0-9]{4,16}$/;
	
	// 변경 비밀번호 유효성 검사 및 재확인
//	$("#submit").attr("disabled", check);
//	$("#checkPass").on("click", function() {
//		var userPass = document.getElementById("userPass").value;
//		var rePass = document.getElementById("rePass").value;
//	
//		if(rePass != "") { 
//			if(pwJ.test(rePass)) {
//				if(userPass != rePass) {
//					text = "비밀번호가 일치하지 않습니다.";
//					check=true;
//				} else {
//					text = "비밀번호가 일치합니다.";
//					check=false;
//				}
//			} else {
//				text = "숫자 또는 문자로만 4~12자리 입력가능합니다.";
//				check=true;
//			}
//		}
//		alert(text);
//		$("#submit").attr("disabled", check);
//});