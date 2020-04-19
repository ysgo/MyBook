<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 회원가입 및 로그인 -->
<c:if test="${ !empty status }">
	<div class="sign">
		<form action="/users/signOut" method="POST" style='float: left;'>
			<input id="signColor" type="submit" class="nav-link p-2" value="로그아웃">
		</form>
	</div>
</c:if>
<c:if test="${ empty status }">
	<div class="sign">
		<form action="/users/signIn" method="GET" style='float: left;'>
			<input id="signColor" type="submit" class="nav-link p-2" value="로그인">
		</form>
		<form action="/users/signUp" method="GET" style='float: left;'>
			<input id="signColor" type="submit" class="nav-link p-2" value="회원가입">
		</form>
	</div>
</c:if>
<!-- 회원가입 및 로그인 끝 -->