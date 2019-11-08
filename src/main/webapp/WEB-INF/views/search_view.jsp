<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
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
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='/book/search';
		})
	}) 
</script>
</body>
</html>