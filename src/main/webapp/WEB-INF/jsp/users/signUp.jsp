<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	<div class="card bg-light">
		<article class="card-body mx-auto mt-3 mb-3" style="max-width: 400px;">
			<div class="row justify-content-center">
				<div class="col-sm-auto logo pl-1 pr-0 mb-4">
					<a href="/">CHACKCHECK</a>
				</div>
			</div>

			<!-- 회원가입 폼태그 시작 -->
			<form action="/users/signUp" method="POST">
				<!-- 닉네임 -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="fa fa-user"></i>
						</span>
					</div>
					<input id="userName" name="name" class="form-control" placeholder="닉네임" type="text" required autofocus />
					<div class="input-group-append">
						<input class="btn btn-primary" type="button" id="name_check" value="중복체크">
					</div>
				</div>

				<!-- 이메일 -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="fa fa-envelope"></i>
						</span>
					</div>
					<input id="userId" name="loginId" class="form-control" placeholder="이메일" type="email" required />
					<div class="input-group-append">
						<input class="btn btn-primary" type="button" id="id_check" value="중복체크">
					</div>
				</div>

				<!-- 비밀번호 -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="fa fa-lock"></i>
						</span>
					</div>
					<input class="form-control" id="userPass" name="password" placeholder="비밀번호" type="password" required>
					<span class="check_font" id="pass_check"></span>
				</div>

				<!-- 비밀번호 확인 -->
				<div class="form-group input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							<i class="fa fa-lock"></i>
						</span>
					</div>
					<input class="form-control" id="rePass" name="rePass"	placeholder="비밀번호 확인" type="password" required />
					<div class="input-group-append">
						<input class="btn btn-primary" type="button" id="repass_check" value="확인">
					</div>
				</div>

				<!-- 등록 버튼 -->
				<div class="form-group">
					<button id="signUp" class="btn btn-outline-secondary btn-block" style="font-weight: 700">등록</button>
				</div>
			</form>
			<!-- 회원가입 폼태그 끝 -->
			<p class="divider-text">
				<span class="bg-light">or</span>
			</p>

			<!-- 네이버 로그인 버튼 -->
			<div class="row justify-content-center mb-3">
				<a href="${ url }" class="btn btn-outline-info">
					<img src="/images/naver.png" width="35px" height="35px">
					<span	style="font-size: 16px"> 네이버 아이디로 로그인</span>
				</a>
			</div>

			<!-- 로그인 링크 -->
			<form class="text-center" action="/users/signIn" method="GET">
				이미 회원가입을 하셨나요? <input id="signColor" type="submit" value="로그인">
			</form>
		</article>
	</div>
