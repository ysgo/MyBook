<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="card bg-light">
	<article class="card-body mx-auto mt-3 mb-3" style="max-width: 400px;">
		<div class="row justify-content-center">
			<div class="col-sm-auto logo pl-1 pr-0 mb-4">
				<a href="${pageContext.request.contextPath}/">CHACKCHECK</a>
			</div>
		</div>

		<!-- 로그인 폼태그 시작 -->
		<form action="/users/signIn" method="POST">
			<!-- 이메일 아이디 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-envelope"></i>
					</span>
				</div>
				<input id="userId" name="loginId" class="form-control" placeholder="이메일을 입력해주세요." type="email" required autofocus />
			</div>

			<!-- 비밀번호 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-lock"></i>
					</span>
				</div>
				<input id="userPass" name="password" class="form-control" placeholder="비밀번호를 입력해주세요." type="password">
			</div>

			<!-- 로그인 버튼 -->
			<div class="form-group">
				<input id="signIn" type="submit" class="btn btn-primary btn-block" value="로그인">
			</div>
		</form>
		<!-- 로그인 폼태그 끝 -->

		<p class="divider-text">
			<span class="bg-light">or</span>
		</p>

		<!-- 네이버 로그인 버튼 -->
		<div class="row justify-content-center">
			<a href="${ url }" class="btn btn-outline-info">
				<img src="/images/naver.png" width="35px" height="35px">
				<span	style="font-size: 16px"> 네이버 아이디로 로그인</span>
			</a>
		</div>

		<br>
		<!-- 회원가입 링크 -->
		<div class="row justify-content-center">
			<form class="form-inline" action="/users/signUp" method="GET">
				아직 회원가입을 안하셨나요? <input id="signColor" type="submit" value="회원가입">
			</form>
		</div>
		<!-- 아이디, 비밀번호 찾기 링크 -->
		<div class="row justify-content-center">
			<span class="text-center" id="searchId" onclick="searchMember()" style="color: #58C9B9; cursor: pointer">아이디/비밀번호 찾기</span>
		</div>
	</article>
</div>
<script type="text/javascript" src="/js/signIn.js"></script>