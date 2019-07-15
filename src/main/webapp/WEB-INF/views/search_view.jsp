<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='/book/search';
		})
	}) 
</script>
</head>
<body>

	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<c:if test="${ !empty searchId }">
			<div class="w3-center w3-large w3-margin-top">
				<h3>아이디 찾기 검색결과</h3>
			</div>
			<div>
				<h5>
					검색된 결과 : ${ searchId }
				</h5>
				<p class="w3-center"><!-- onclick="history.go(-1)"  -->
					<button type="button" id=loginBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">재검색</button>
					<button type="button" onclick="window.close()" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
				</p>
			</div>
			</c:if>
			<c:if test="${ !empty searchPass }">
				<div class="w3-center w3-large w3-margin-top">
					<h3>비밀번호 찾기 검색결과</h3>
				</div>
				<div>
					<h5>
						검색된 결과 : ${ searchPass }
					</h5>
					<p class="w3-center">
						<button type="button" id=loginBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">재검색</button>
						<button type="button" onclick="window.close()" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>