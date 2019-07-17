<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	<title>ㅊㅊ</title>
	
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

<style>
</style>
</head>
<body>

	<div class="card bg-light">
		<article class="card-body mx-auto mt-3 mb-3" style="max-width: 400px;">
			<div class="row justify-content-center">
				<div class="col-sm-auto logo pl-1 pr-0 mb-4"><a href="${pageContext.request.contextPath}/">CHACKCHECK</a></div>
<!-- 				<div class="col-sm-auto"><h4 class="card-title mt-2 text-center">회원가입</h4></div> -->
			</div>
	
			<!-- 네이버 로그인 버튼 -->
			<a href="#" class="btn btn-block" ><img src="images/naverbutton.PNG" width="210px" height="40px"></a>
			<p class="divider-text">
				<span class="bg-light">OR</span>
			</p>
			
			<!-- 회원가입 폼태그 시작 -->
			<form>
				<!-- 닉네임 -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-user"></i>
						</span>
					</div>
					<input name="" class="form-control" placeholder="닉네임" type="text" required autofocus>
				</div>
				
				<!-- 이메일 -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-envelope"></i>
						</span>
					</div>
					<input name="" class="form-control" placeholder="이메일" type="email" required>
				</div>

				<!-- 비밀번호 -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input class="form-control" placeholder="비밀번호" type="password" required>
				</div>
				
				<!-- 비밀번호 확인 -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input class="form-control" placeholder="비밀번호 확인" type="password" required>
				</div>
				
				<!-- 등록 버튼 -->
				<div class="form-group">
					<input type="submit" class="btn btn-primary btn-block" value="등록">
				</div>
				
			</form>
			<!-- 회원가입 폼태그 끝 -->
			
			<!-- 로그인 링크 -->
			<form class="text-center" action="signIn" method="get">
	                       이미 회원가입을 하셨나요? <input id="signColor" type="submit" value="로그인">
	        </form>	
						
		</article>
	</div>

</body>
</html>