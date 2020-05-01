<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Page Content 시작 -->
<div id="content">
	<!-- navbar 시작 -->
	<button type="button" id="sidebarCollapse" class="btn btn-outline-secondary mb-5 mt-2">
		<i class="fas fa-align-left"></i>
		<span>MENU</span>
	</button>
	<button class="btn btn-dark d-inline-block d-lg-none ml-auto"
		type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<i class="fas fa-align-justify"></i>
	</button>

	<!-- 컨텐트 추가 시작 -->
	<article id="updateArticle" class="card-body mx-auto">
		<h2>내 정보 수정</h2>
		<br>
		<!-- 수정 폼태그 시작 -->
		<form action="/users/myPage" method="POST">
			<input type="hidden" name="id" value="${ user.id }"/>
			<!-- 닉네임 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-user"></i>
					</span>
				</div>
				<input value="${ user.name }" name="name" class="form-control" placeholder="닉네임" type="text" required autofocus>
			</div>
			<!-- 이메일 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-envelope"></i>
					</span>
				</div>
				<input value="${ user.loginId }" name="loginId" class="form-control" placeholder="이메일" type="email" readonly>
			</div>

			<!-- 비밀번호 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<input id="userPass" name="password" class="form-control" placeholder="비밀번호" type="password" required>
			</div>

			<!-- 비밀번호 확인 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<input id="rePass" class="form-control" placeholder="비밀번호 확인" type="password" required>
				<div class="input-group-append">
					<input class="btn btn-primary" type="button" id="checkPass" value="중복확인">
				</div>

			</div>

			<!-- 수정 버튼 -->
			<div class="form-group">
				<input id="submit" type="submit" class="btn btn-outline-secondary btn-block" value="수정">
			</div>
		</form>
		<!-- 수정 폼태그 끝 -->

		<!-- 탈퇴 페이지 이동 -->
		<div class="form-group">
			<input onclick="location.href='/users/withdrawal'" type="button" class="btn btn-outline-secondary btn-block" value="탈퇴">
		</div>
	</article>
	<div class="line"></div>
	<!-- 구분선 -->
	<!-- 컨텐트 추가 끝 -->
</div>
<!-- Page Content 끝 -->
<script type="text/javascript" src="/js/myPage.js"></script>
