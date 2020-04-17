<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Page Content 시작 -->
<div id="content">
	<!-- navbar 시작 -->
	<button type="button" id="sidebarCollapse"
		class="btn btn-outline-secondary mb-5 mt-2">
		<i class="fas fa-align-left"></i> <span>MENU</span>
	</button>

	<!-- 컨텐트 추가 시작 -->
	<!-- 트렌딩 북 -->
	<h3 style="font-size: 28px; font-weight: 700; color: #58C9B9;">지금
		인기있는 책</h3>
	<div class="line"></div>
	<div id="trending" class="mx-auto mt-4 mb-2 p-3">
		<c:set var="num" value="1" />
		<c:forEach var="vo" items="${ list }">
			<div class="slide" style="display: table; margin: 0 auto;">
				<div style="display: table-row; height: 40px; font-weight: 700">#
					가장 많이 읽은 책 ${num}위</div>
				<div style="display: table-cell; vertical-align: middle;"
					class="p-0">
					<img src="${vo.image}"
						style="box-shadow: 4px 4px 5px 0px rgba(107, 106, 107, 1);">
				</div>
				<div style="display: table-cell; vertical-align: middle;"
					class="pl-4">
					<span style="font-size: 20px">${vo.title}</span><br>
					<br> ${vo.author}<br> ${vo.publisher}<br> <br>
					<span style="color: gray">${vo.description}</span><br>
				</div>
			</div>
			<c:set var="num" value="${num+1}" />
		</c:forEach>
	</div>
	<div style="height: 60px"></div>

	<h2 style="font-size: 28px; font-weight: 700; color: #58C9B9;">회원들의
		활동 로그</h2>
	<div class="line"></div>
	<c:if test="${ !empty listLog }">
		<c:forEach var="vo" items="${listLog}" varStatus="status">
			<c:if test="${status.count <6}">
				<!-- 읽은 책 -->
				<c:if test="${!empty vo.myBookTitle}">
					<form action="otherReadBook" method="get">
						<input type="hidden" name="email" value="${vo.email}"> <input
							id="userNameCss" type="submit" value="${vo.userName}">
						&emsp;<span>${vo.logregistdate}</span>
					</form>
					<br>
					<span style="font-weight: bold; word-break: keep-all;">${vo.myBookTitle}</span>
					<c:if test="${empty vo.isupdate}">
						<span style="word-break: keep-all;"> 책 서평을 작성하였습니다.</span>
					</c:if>
					<c:if test="${!empty vo.isupdate}">
						<span style="word-break: keep-all;"> 책 서평을 변경하였습니다.</span>
					</c:if>
					<br>별점 <span> <c:forEach var="i" begin="1"
							end="${vo.m_star}">
							<span style="color: #58C9B9;">★</span>
						</c:forEach></span>
					<br>
					<div style="word-break: keep-all;">${vo.m_content}</div>
				</c:if>

				<!-- 관심 책 -->
				<c:if test="${empty vo.myBookTitle}">
					<form action="otherInterestBook" method="get">
						<input type="hidden" name="email" value="${vo.email}"> <input
							id="userNameCss" type="submit" value="${vo.userName}">
						&emsp;<span>${vo.logregistdate}</span>
					</form>
					<br>

					<span style="font-weight: bold; word-break: keep-all;">${vo.interestBookTitle}</span>
					<c:if test="${empty vo.isupdate}">
						<span style="word-break: keep-all;"> 책을 관심 책으로 추가하였습니다.</span>
					</c:if>

				</c:if>
				<div class="line"></div>
			</c:if>
		</c:forEach>
		<form style="text-align: right;" action="allLog" method="get">
			<button type="submit" class="btn btn-outline-secondary">모든
				활동기록 보기 ></button>
		</form>
	</c:if>
	<c:if test="${ empty listLog }">
		<div>활동기록이 없습니다.</div>
		<div class="line"></div>
	</c:if>
	<!-- 컨텐트 추가 끝 -->
</div>
