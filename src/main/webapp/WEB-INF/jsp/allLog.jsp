<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mc.mybook.model.MyBookList, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="common/head.jsp"%>
<style>
#userNameCss {
	font-weight: bold;
	border: none;
	background-color: #58C9B9;
	color: #fff;
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@ include file="fragments/logo.jsp"%>
		<%@ include file="fragments/sidebar.jsp"%>

		<!-- Page Content 시작 -->
		<div id="content">
			<!-- navbar 시작 -->
			<button type="button" id="sidebarCollapse"
				class="btn btn-outline-secondary mb-5">
				<i class="fas fa-align-left"></i> <span>MENU</span>
			</button>

			<h2 style="font-size: 28px; font-weight: 700; color: #58C9B9;">전체
				활동로그</h2>
			<br>
			<c:if test="${ !empty listLog }">
				<ul>
					<c:forEach var="vo" items="${listLog}" varStatus="status">
						<div id="row">
							<c:if test="${!empty vo.myBookTitle}">
								<form action="otherReadBook" method="get">
									<input type="hidden" name="email" value="${vo.email}">
									<input id="userNameCss" type="submit" value="${vo.userName}">
									&emsp;<span> ${vo.logregistdate}</span>
								</form>
								<br>
								<span style="font-weight: bold; word-break: keep-all;">${vo.myBookTitle}</span>
								<c:if test="${empty vo.isupdate}">
									<span style="word-break: keep-all;"> 책 서평을 작성하였습니다.</span>
								</c:if>
								<c:if test="${!empty vo.isupdate}">
									<span style="word-break: keep-all;"> 책 서평을 변경하였습니다.</span>
								</c:if>
								<br>별점 <span><c:forEach var="i" begin="1"
										end="${vo.m_star}">
										<span style="color: #58C9B9;">★</span>
									</c:forEach></span>
								<br>
								<div style="word-break: keep-all;">${vo.m_content}</div>
							</c:if>
							<c:if test="${empty vo.myBookTitle}">
								<form action="otherInterestBook" method="get">
									<input type="hidden" name="email" value="${vo.email}">
									<input id="userNameCss" type="submit" value="${vo.userName}">
									&emsp;<span> ${vo.logregistdate}</span>
								</form>
								<br>
								<span style="font-weight: bold; word-break: keep-all;">${vo.interestBookTitle}</span>
								<span style="word-break: keep-all;"> 책을 관심책에 담았습니다.</span>
								<br>
							</c:if>
							<div class="line"></div>
					</c:forEach>

					<!-- 페이징 버튼 위치 시작 -->
					<c:if test="${!empty listCnt }">
						<div>
							<c:if test="${pagination.curPage ne 1 }">
								<a href="#" onClick="fn_paging(1)">[처음]</a>
							</c:if>
							<c:if test="${pagination.curPage ne 1}">
								<a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a>
							</c:if>
							<c:forEach var="pageNum" begin="${pagination.startPage }"
								end="${pagination.endPage }">
								<c:choose>
									<c:when test="${pageNum eq  pagination.curPage}">
										<span style="font-weight: bold;"><a href="#"
											onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
									</c:when>
									<c:otherwise>
										<a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if
								test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
								<a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a>
							</c:if>
							<c:if test="${pagination.curPage ne pagination.pageCnt }">
								<a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a>
							</c:if>
						</div>
					</c:if>
					<!-- 페이징 버튼 위치 종료 -->

				</ul>
			</c:if>
			<c:if test="${ empty listLog }">
				<div>활동기록이 없습니다.</div>
				<div class="line"></div>
			</c:if>

		</div>
		<!-- Page Content 끝 -->

		<%@ include file="fragments/member.jsp"%>
	</div>
	<%@ include file="common/scripts.jsp"%>
	<script type="text/javascript">
		$('#tooltip').hover(function() {
			//$( '#tooltiptext' ).removeClass( 'invisible' );
			$('#tooltiptext').animate({
				opacity : "1"
			}, 1000);

		});
		$('#tooltip').mouseleave(function() {
			$('#tooltiptext').animate({
				opacity : "0"
			}, 500);
			//$( '#tooltiptext' ).fadeTo("fast", 0);
			//$( '#tooltiptext' ).addClass( 'invisible' );
		});

		slide();
		
		function fn_paging(curPage) {
			location.href = "/book/allLog?curPage=" + curPage;
		}
	</script>
</body>
</html>