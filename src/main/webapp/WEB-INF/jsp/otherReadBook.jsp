<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="common/head.jsp"%>
<link rel="stylesheet" href="css/booklist-style.css?a">
</head>

<body>
	<div class="wrapper">
		<%@ include file="fragments/logo.jsp"%>
		<%@ include file="fragments/sidebar.jsp"%>
		<!-- Page Content 시작 -->
		<div id="content">

			<div class="top-page mb-5 center-block">
				<!-- top page 시작 -->

				<div class="btn-with-fixedInput pr-1 pl-3">
					<!-- 메뉴 버튼 -->
					<button type="button" id="sidebarCollapse"
						class="btn btn-outline-secondary">
						<i class="fas fa-align-left"></i> <span>MENU</span>
					</button>
				</div>

				<div class="fixedInput pl-1">
					<!-- 고정된 인풋 -->
					<%
						
					%>
					<form method="get" action="otherReadBook" target="_self">
						<div class="input-group">
							<input name="readkeyword" type="text" class="form-control"
								placeholder="내가 등록한 책 제목, 저자, 출판사 검색"
								aria-describedby="basic-addon2"> <input type="hidden"
								name="email" value="<%=request.getParameter("email")%>">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit">검색</button>
							</div>
						</div>
					</form>

				</div>
				<!-- 고정된 인풋 끝 -->

			</div>
			<!-- top page 끝 -->


			<!-- 책이미지와 서평 내용 출력 -->
			<div class="container">

				<c:if test="${ !empty list }">
					<ul id="ulRow">
						<c:forEach var="vo" items="${ list }">
							<li class="row pl-3"><img alt="이미지" src="${vo.image}"
								width="100" height="150" style="border: 1px solid lightgray" />
								<div style="width: 70%" class="ml-4">
									<span style="margin-right: 5px; font-size: 17pt;">${vo.m_title}</span>
									<span>${vo.registdate}</span><br> 별점 :
									<c:forEach var="i" begin="1" end="${vo.m_star}">
										<span>★</span>
									</c:forEach>
									<br> <span style="font-size: 14pt; word-break: keep-all;">${vo.m_content}</span>
									<!-- style="word-break: keep-all ;" -->
								</div></li>
							<div class="caption">
								<c:choose>
									<c:when test='${fn:length(vo.title) >= 19}'>
							${fn:substring(vo.title,0,18)}...
							</c:when>
									<c:otherwise>
							${vo.title}
							</c:otherwise>
								</c:choose>
							</div>
							<div class="line"></div>
							<!-- 구분선 -->
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
				<a href="otherReadBook?email=<%=request.getParameter("email")%>"
					style="text-decoration: none"> <!-- 전체목록으로 이동 -->
					<button class="btn btn-outline-secondary mx-auto mt-5"
						type="button" style="display: block;" id="listall">전체 목록</button>
				</a>

				<c:if test="${ empty list }">
					<%
						if (request.getParameter("readkeyword") != null) {
					%>
					<h2 style="padding-top: 30px">
						찾으시는 책이 없어요 <img src="images/sad-emoji.png"
							style="width: 50px; padding-bottom: 5px">
					</h2>
					<%
						}
					%>
					<div class="line"></div>
					<!-- 구분선 -->
				</c:if>
				<!-- 책이미지와 서평 내용 출력 끝 -->
			</div>
			<!-- 컨테이너 끝 -->

		</div>
		<!-- Page Content 끝 -->

		<%@ include file="fragments/member.jsp"%>
	</div>
	<%@ include file="common/scripts.jsp"%>
	<script type="text/javascript">
		function fn_paging(curPage) {
			location.href = "/book/readBook?curPage=" + curPage;
		}

		function hover(e) {
			var image = e.childNodes[1];
			image.id === 'pencil' ? image.src = 'images/white-pencil.png'
					: image.src = 'images/white-trash.png';
		}

		function leave(e) {
			var image = e.childNodes[1];
			image.id === 'pencil' ? image.src = 'images/pencil.png'
					: image.src = 'images/trash.png';
		}
	</script>
</body>
</html>
