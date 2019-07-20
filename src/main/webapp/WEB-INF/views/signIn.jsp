<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	<title>CHACKCHECK</title>
	
	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<!-- Bootstrap CSS CDN -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<!-- Font Awesome JS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
	 <!-- Our Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/form-style.css">
</head>
<body>
	<div class="card bg-light">
		<article class="card-body mx-auto mt-3 mb-3" style="max-width: 400px;">
			<div class="row justify-content-center">
				<div class="col-sm-auto logo pl-1 pr-0 mb-4"><a href="${pageContext.request.contextPath}/">CHACKCHECK</a></div>
			</div>
	
			<!-- 네이버 로그인 버튼 -->
			<a href="${ url }"
			 class="btn btn-block" ><img src="images/naverbutton.PNG" width="210px" height="40px"></a>
			<p class="divider-text">
				<span class="bg-light">OR</span>
			</p>
			
			<!-- 로그인 폼태그 시작 -->
			<form action="${pageContext.request.contextPath}/signIn" method="POST">
				<!-- 이메일 아이디 -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-envelope"></i>
						</span>
					</div>
					<input id="userId" name="userId" class="form-control" placeholder="이메일을 입력해주세요." type="email" required autofocus>
				</div>
				
				<!-- 비밀번호 -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input id="userPass" name="userPass" class="form-control" placeholder="비밀번호를 입력해주세요." type="password">
				</div>
				
				<!-- 로그인 버튼 -->
				<div class="form-group">
					<input id="signIn" type="submit" class="btn btn-primary btn-block" value="로그인">
				</div>
			</form>
			<!-- 로그인 폼태그 끝 -->
			
			<!-- 회원가입 링크 -->
				<form class="text-center" action="signUp" method="get">
					아직 회원가입을 안하셨나요? <input id="signColor" type="submit" value="회원가입">
				</form>
				
				<!-- 아이디, 비밀번호 찾기 링크 -->
				<p class="text-center">
					<button id="searchId" onclick="searchMember()">아이디/비밀번호 찾기</button>
				</p>
				
		</article>
	</div>
<script>
 function searchMember() {
	window.open("/book/search", "아이디/비밀번호 찾기", "width=500, height=620, left=100, top=50");
} 

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