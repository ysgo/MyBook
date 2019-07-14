<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지명</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
	.bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
} 
</style>
<!-- Custom styles for this template -->
<link rel="stylesheet" type="text/css" href="css/signin.css">
</head>
<body class="text-center">
<form class="form-signin" action="/mybooktest/signin" method="POST" >
  <!-- <img class="mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> --><!-- 로고 이미지 추가하고 싶으면 사용 -->
  <h1 class="h3 mb-3 font-weight-normal">로고</h1>
  <div id="login_container">
  <label for="inputEmail" class="sr-only"></label>
  <input type="email" id="userId" name="userId"  class="form-control" placeholder="example@exam.com" required autofocus>
  <span class="check_font" id="id_check"></span>
  <label for="inputPassword" class="sr-only"></label>
  <input type="password" id="userPass" name="userPass" class="form-control" placeholder="***********" required>
  <span class="check_font" id="pass_check"></span>
  <div class="checkbox mb-3 text-left" >
    <label>
      <input type="checkbox" value="remember-me"> 아이디 저장
    </label>
  </div>
  <button id="signin" class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
  
  </div>
</form>
<br> 
  <!-- 아이디, 비밀번호 찾기 -->
  <button id="searchId" class="btn btn-lg btn-primary btn-block" onclick="search(userId)">아이디 찾기</button>
  <button id="searchId" class="btn btn-lg btn-primary btn-block"  data-toggle="modal" data-target="#myModal">아이디 찾기 모달</button>
  <button id="searchPass" class="btn btn-lg btn-primary btn-block" onclick="search(userPass)">비밀번호 찾기</button>
  
  <!-- 책 추가 모달 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
    <div class="modal-content">
	<!-- 닫기 버튼 -->
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
	 
	 <div class="modal-body">
	 	
	 	<!--  모달 컨텐트 컨테이너 -->     	
	 	<div class="container">
	 		<!--  인풋 로우 -->   
			<div class="row inputrow">
				<div class="col-sm-12  ">
					<form class="input-group" action="/mybooktest/searchId" method="GET">					
			        	<input name="keyword" type="text" class="form-control" 
				        	placeholder="닉네임 검색" aria-describedby="basic-addon2" width="20px">
			        	 <div class="input-group-append">
			    			<button class="btn btn-outline-secondary" id="submitForm">검색</button>
			 			 </div>
				     </form>
	       <!--  결과 로우 bookList는 List 타입-->   
<%-- 	        <c:forEach items="${searchId}" var ="b">
	        
	        		<div class="row">x
		            <div class="col-2 col-sm-3">
		            	${b.userId}
		            </div>
		            <div class="w-150"></div>
	        	</div>
	 
	        </c:forEach> --%>
				</div>
			</div>

	       <br>
			
			</div>
        	<!--  모달 컨텐트 컨테이너 끝 -->
	 	
	 </div>	
    </div>
  </div>
</div>
<!-- 책 추가 모달 끝 -->
  <p class="mt-5 mb-3 text-muted">아직 회원가입을 안하셨나요? <a href="/mybooktest/signup?action=signup&id=2">회원가입</a></p>

<script>
 function search(cv) {
	if(cv == userId) {	// 아이디 찾기
		window.open("/mybooktest/searchId", "아이디 찾기", "width=400, height=300, left=100, top=50");
	} else {	// 비밀번호 찾기
		window.open("/mybooktest/searchPass", "비밀번호 찾기", "width=400, height=300, left=100, top=50");
	}
} 

//이메일아이디 검사 정규식 : -_특수문자 가능하며 중앙에 @ 필수 그리고 . 뒤에 2~3글자 필요
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
/* String regexp = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$"; //이메일 정규 표현식 */
//비밀번호 정규식 : A~Z, a~z,,0~9로 시작하는 4~12자리 비밀번호 가능
var pwJ = /^[A-Za-z0-9]{4,16}$/;
var text;
var check;
//이메일아이디 정규식
$("#userId").blur(function() {
	if(mailJ.test($("#userId").val())) {
		text="";
		check=false;
	} else {
		text="유효하지 않은 양식입니다.";
		check=true;
	}
		$("#id_check").text(text);
		$("#id_check").css("color", "red");
		$("#signin").attr("disabled", check);
});

//비밀번호 유효성 검사(숫자, 문자로만 4~12자리)
$("#userPass").blur(function() {
	if(pwJ.test($("#userPass").val())) {
		text="";
		check=false;
	} else {
		text="숫자 or 문자로만 4~12자리 입력가능합니다.";
		check=true;
	}
		$("#pass_check").text(text);
		$("#pass_check").css("color", "red");
		$("#signin").attr("disabled", check);
});

function searchFunc(e) {  
	var keyword = $('input[name=keyword]').val();

    var url = "bookList.do?keyword=" + keyword;
    if(e.type == "keydown" && e.keyCode != 13) { return; } 
    
    $.ajax({
        url: url,
        type: 'GET', 
        success: function(data){
        	$('body').html(data);
            $('#myModal').modal('show'); 
        }
    });
}

$(function(){
    $('#submitForm').on('click', searchFunc);   
    $('input[name=keyword]').on('keydown', searchFunc);   
    $('.close').on('click', function() {
    	$.ajax({
            url: "bookList.do",
            type: 'GET', 
            success: function(data){
            	$('body').html(data);
            }
        });
    });   
});

function searchFunc(e) {  
	var keyword = $('input[name=keyword]').val();

    var url = "bookList.do?keyword=" + keyword;
    if(e.type == "keydown" && e.keyCode != 13) { return; } 
    
    $.ajax({
        url: url,
        type: 'GET', 
        success: function(data){
        	$('body').html(data);
            $('#myModal').modal('show'); 
        }
    });
}

$(function(){
    $('#submitForm').on('click', searchFunc);   
    $('input[name=keyword]').on('keydown', searchFunc);   
    $('.close').on('click', function() {
    	$.ajax({
            url: "bookList.do",
            type: 'GET', 
            success: function(data){
            	$('body').html(data);
            }
        });
    });   
});

</script>
</body>
</html>