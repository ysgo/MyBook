<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${ empty user }">
		<div class="sign">
			<form action="/users/signIn" method="GET" style='float: left;'>
				<input id="signColor" type="submit" class="nav-link p-2" value="로그인">
			</form>
			<form action="/users/signUp" method="GET" style='float: left;'>
				<input id="signColor" type="submit" class="nav-link p-2" value="회원가입">
			</form>
		</div>
	</c:when>
	
	<c:otherwise>
		<div class="sign">
			<form action="/users/signOut" method="POST" style='float: left;'>
				<input type="hidden" id="user-id" value="${ user.id }"/>
				<input id="signColor" type="submit" class="nav-link p-2" value="로그아웃">
			</form>
		</div>
	</c:otherwise>
</c:choose>
