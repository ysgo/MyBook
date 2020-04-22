<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
		<!-- Page Content 시작 -->
		<div id="content">
			<div class="top-page mb-5 center-block">
				<!-- top page 시작 -->
				<div class="btn-with-fixedInput pr-1 pl-3">
					<!-- 메뉴 버튼 -->
					<button type="button" id="sidebarCollapse" class="btn btn-outline-secondary">
						<i class="fas fa-align-left"></i>
						<span>MENU</span>
					</button>
				</div>

				<div class="fixedInput pl-1">
					<!-- 고정된 인풋 -->
					<form method="GET" action="/books/readBook" target="_self">
						<div class="input-group">
							<input name="readkeyword" type="text" class="form-control" placeholder="내가 등록한 책 제목, 저자, 출판사 검색" aria-describedby="basic-addon2">
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
				<c:choose>
					<c:when test="${ !empty books }">
						<ul id="ulRow">
							<c:forEach var="book" items="${ books }">
								<li class="row pl-3">
									<img alt="이미지" src="${ book.image }" width="100" height="150" style="border: 1px solid lightgray" />
									<div style="width: 70%" class="ml-4">
										<span style="margin-right: 5px; font-size: 17pt;">${book.review.title}</span>
										<span>${book.review.createdAt}</span>
										<br> 별점 :
										<c:forEach var="i" begin="1" end="${book.review.star}">
											<span>★</span>
										</c:forEach>
										<br>
										<span style="font-size: 14pt; word-break: keep-all;">${book.review.description}</span>
									</div>
								</li>
								<div class="caption">
									<c:choose>
										<c:when test='${fn:length(book.title) >= 30}'>
											${fn:substring(book.title,0,29)}...
										</c:when>
										<c:otherwise>
											${book.title}
										</c:otherwise>
									</c:choose>
								</div>
								
								<!-- 수정 및 삭제 시작-->
								<div class="float-right">
									<form action="readBook" method="post">
										<input type="hidden" name="bookNum" value="${book.id}">
										<button type="button"	class="btn btn-outline-primary upDelButton"	data-toggle="modal" data-target="#myModal2"
											onclick="updateButton('${book.review.id}', '${book.review.title}', '${book.review.star}', '${book.review.description}');"
											onmouseover="hover(this);" onmouseleave="leave(this)">
											<img id="pencil" src="/images/pencil.png" style="width: 20px" class="mr-2">수정
										</button>
										<button type="submit" class="btn btn-outline-primary upDelButton"	onmouseover="hover(this);" onmouseleave="leave(this)">
											<img id="trash" src="/images/trash.png" style="width: 20px" class="mr-1">삭제
										</button>
									</form>
								</div>
								<!-- 수정 및 삭제 끝-->
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
					</c:when>
					<c:otherwise>
						<h2>읽은 책과 서평을 추가해주세요
							<img src="/images/smile-emoji.png" style="width: 50px; padding-bottom: 5px">
						</h2>
					</c:otherwise>
				</c:choose>
				<c:if test="${ !empty books }">
				</c:if>
				<a href="readBook" style="text-decoration: none">
					<!-- 전체목록으로 이동 -->
					<button class="btn btn-outline-secondary mx-auto mt-5" type="button" style="display: block;" id="listall">전체 목록</button>
				</a>

				<c:if test="${ empty list }">
					<%
						if (request.getParameter("readkeyword") != null) {
					%>
					<h2 style="padding-top: 30px">
						찾으시는 책이 없어요
						<img src="/images/sad-emoji.png" style="width: 50px; padding-bottom: 5px">
					</h2>
					<%
						} else {
					%>
					<script>
						$('#listall').hide();
					</script>
					<!-- <h2>
						읽은 책과 서평을 추가해주세요
						<img src="/images/smile-emoji.png" style="width: 50px; padding-bottom: 5px">
					</h2> -->
					<%
						}
					%>
					<div class="line"></div>
					<!-- 구분선 -->
				</c:if>
				<!-- 책이미지와 서평 내용 출력 끝 -->
			</div>
			<!-- 컨테이너 끝 -->

			<!-- 모달 영역 시작 -->
			<div id="readMe" class="p-2">
				밑의 버튼을 클릭하여<br>책을 추가해주세요:)
			</div>
			<!-- Button trigger modal -->
			<button id="addButton" type="button" class="btn btn-primary btn-lg"	data-toggle="modal" data-target="#myModal">+</button>

			<!-- 책 추가 모달 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog"	style="max-width: 100%; width: auto; display: table;">
					<div class="modal-content">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>

						<div class="modal-body">
							<div class="container">
								<div class="row inputrow">
									<div class="col-sm-12">
										<div class="input-group">
											<input name="keyword" type="text" class="form-control" placeholder="책 제목, 저자 검색" aria-describedby="basic-addon2" width="20px">
											<div class="input-group-append">
												<button class="btn btn-outline-secondary" id="submitForm">검색</button>
											</div>
										</div>
									</div>
								</div>
								<br>
<!--  결과 로우 -->
<div id="search-result">
	<script id="search-result-item" type="text/x-handlebars-template">
	{{#each books}}
		<div id="row" class="row mr-1 searchResult">
			<div id="imgContainer" class="col-sm-3">
				<img id="image" src="{{image}}" style="width: 200px">
			</div>
			<div class="col-sm-4">
				<span id="title">{{title}}</span>
				<br>
				<br>
				<span	id="author">{{author}}</span>
				<br>
				<span id="publisher">{{publisher}}</span>
			</div>
			<div class="col-sm" id="description">{{description}}</div>
			<div class="w-150"></div>
		</div>
	{{/each}}
	</script>
</div>

							</div>
							<!--  모달 컨텐트 컨테이너 끝 -->
						</div>
					</div>
				</div>
			</div>
			<!-- 책 추가 모달 끝 -->

			<!-- 서평 추가 모달 -->
			<div class="modal fade" id="myModal-review" tabindex="-1" role="dialog"	aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<!-- 컨텐트 시작 -->
					<div class="modal-content form-elegant">
						<!-- 닫기 버튼 -->
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<!--헤더-->
						<div class="modal-header text-center">
							<h3	class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel">
								<strong>글쓰기</strong>
							</h3>
						</div>
						<!--바디-->
						<div class="modal-body mx-4">
							<!-- 제목 -->
							<div class="md-form mb-3">
								<p class="md-form mb-2">제목</p>
								<input type="text" id="m_title" class="form-control validate">
							</div>
							<!-- 별점 -->
							<div class="md-form mb-3">
								<!-- 1:4px 2:8px 3:16px 4:24px 5:48px -->
								<p class="md-form mb-1">별점</p>
								<p class="star_rating">
									<a href="#" target="star" id="1" class="on">★</a>
									<a href="#"	target="star" id="2" class="on">★</a>
									<a href="#"	target="star" id="3" class="on">★</a>
									<a href="#"	target="star" id="4" class="on">★</a>
									<a href="#"	target="star" id="5" class="on">★</a>
								</p>
							</div>
							<!-- 내용작성부분 -->
							<div class="md-form mb-3">
								<p class="md-form mb-2">내용</p>
								<textarea id="m_content" class="form-control" rows="5"></textarea>
							</div>
							<!-- 확인버튼 -->
							<div class="text-center mb-3">
								<button type="button" id="m_submit" class="btn blue-gradient btn-block btn-rounded z-depth-1a">확인</button>
							</div>
						</div>
					</div>
					<!-- 바디 끝 -->
				</div>
			</div>
			<!-- 서평 추가 모달 끝 -->
			<!-- 모달 영역 끝 -->

		</div>
		<!-- Page Content 끝 -->
<script type="text/javascript" src="/js/readBook.js"></script>