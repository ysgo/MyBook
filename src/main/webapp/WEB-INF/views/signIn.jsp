<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>홈페이지명</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	margin : 16px 0px 12px 80px;
}
</style>
</head>
<body>
	<div class="card bg-light">
		<article class="card-body mx-auto" style="max-width: 400px;">
		<div class="row">
			<a href="${pageContext.request.contextPath}/main"><img class="logo" src="images/logo.svg" width="38" height="37"></a>
			<h4 class="card-title mt-3 text-center">로그인</h4>
		</div>
				<!-- 네이버 로그인 버튼 -->
				<a href="${url}" class="btn btn-block " ><img src="images/naverbutton.PNG" width="210px" height="40px"></a>
			<p class="divider-text">
				<span class="bg-light">OR</span>
			</p>
			
			<!-- 로그인 폼태그 시작 -->
			<form>
				<!-- 이메일 아이디 -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-envelope"></i>
						</span>
					</div>
					<input name="" class="form-control" placeholder="이메일을 입력해주세요." type="email" required autofocus>
				</div>
				
				<!-- 비밀번호 -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input class="form-control" placeholder="비밀번호를 입력해주세요." type="password">
				</div>
				
				<!-- 로그인 버튼 -->
				<div class="form-group">
					<input type="submit" class="btn btn-primary btn-block" value="로그인">
				</div>
				
				<!-- 회원가입 링크 -->
				<p class="text-center">
					아직 회원가입을 안하셨나요?<a href="${pageContext.request.contextPath}/signUp?action=signUp&id=2"> 회원가입</a>
				</p>
				
				<!-- 아이디, 비밀번호 찾기 링크 -->
				<p class="text-center">
					<a href="#"> 아이디 찾기 / </a>
					<a href="#"> 비밀번호 찾기</a>
				</p>
			</form>
			<!-- 로그인 폼태그 끝 -->
			
		</article>
	</div>

</body>
</html>