<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Page Content 시작 -->
<div id="content">
	<!-- navbar 시작 -->
	<button type="button" id="sidebarCollapse" class="btn btn-outline-secondary">
		<i class="fas fa-align-left"></i>
		<span>MENU</span>
	</button>
	<button class="btn btn-dark d-inline-block d-lg-none ml-auto"
		type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<i class="fas fa-align-justify"></i>
	</button>
	<!-- navbar 끝 -->

	<!-- 컨텐트 추가 시작 -->
	<article id="updateArticle" class="card-body mx-auto">
		<h2>회원 탈퇴</h2>
		<br>
		<!-- 수정 폼태그 시작 -->
		<form action="/users/withdrawal" method="POST">
			<!-- 비밀번호 확인 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">
						<i class="fa fa-lock"></i>
					</span>
				</div>
				<input name="checkPass" class="form-control" placeholder="비밀번호 확인" type="password" required>
			</div>
			<!-- 탈퇴 버튼 -->
			<div class="form-group">
				<input type="submit" class="btn btn-outline-secondary btn-block" value="탈퇴">
			</div>
		</form>
		<!-- 취소 -->
		<div class="form-group">
			<input onclick="location.href='/users/myPage'" type="button" class="btn btn-outline-secondary btn-block" value="취소">
		</div>
	</article>
	<div class="line"></div>
	<!-- 구분선 -->
	<!-- 컨텐트 추가 끝 -->
</div>
<!-- Page Content 끝 -->
