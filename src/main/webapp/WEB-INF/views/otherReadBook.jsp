<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>CHACKCHECK</title>

	<!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- jQuery Custom Scroller CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js">
	</script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS CDN -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="css/style.css?a">
    <link rel="stylesheet" href="css/booklist-style.css?a">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
</head>

<body>
	<div class="wrapper">
		<div style="z-index: 500">
			<a href="${pageContext.request.contextPath}/" class="brand-logo-main">
				<div class="container">
					<div class="row">
						<div class="col-sm-auto pr-0 mt-2">
							CHACK<br>CHECK
						</div>
						<div class="col-sm-auto pl-1">
							<img src="images/book.jpg" style="width: 55px">
						</div>
					</div>
				</div>
			</a>
		</div>
		<!-- left Sidebar 시작 -->
		<nav id="sidebar">
			<div class="sidebar-header p-3">
				<a href="${pageContext.request.contextPath}/" class="brand-logo"
					style="font-family: 'Fredoka one'"> CHACKCHECK </a>
			</div>

			<ul class="list-unstyled components">
				<li>
					<form id="leftSideBar" action="${pageContext.request.contextPath}/"
						method="get">
						<input id="leftSideBarColor" type="submit" value="메인">
					</form>
				</li>
				<li class="active">
					<form id="leftSideBar" action="readBook" method="get">
						<a href="#bookSubmenu" data-toggle="collapse"
							aria-expanded="false" class="dropdown-toggle"> <input
							id="leftSideBarColor" type="submit" value="내 서재">
						</a>
					</form>
					<ul class="collapse list-unstyled" id="bookSubmenu">
						<li>
							<form id="leftSideBar" action="readBook" method="get">
								<input id="leftSideBarColor" type="submit" value="읽은 책">
							</form>
						</li>
						<li>
							<form id="leftSideBar" action="interestBook" method="get">
								<input id="leftSideBarColor" type="submit" value="관심 책">
							</form>
						</li>
					</ul>
				</li>
				<li>
					<form id="leftSideBar" action="myPage" method="get">
						<input id="leftSideBarColor" type="submit" value="내 정보">
					</form>
				</li>
			</ul>
		</nav>
		<!-- left Sidebar 끝 -->

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

				<!-- <div class="fixedInput pl-1">
					고정된 인풋

					<form method="get" action="otherReadBook" target="_self">
						<div class="input-group">
							<input name="readkeyword" type="text" class="form-control"
								placeholder="내가 등록한 책 제목, 저자, 출판사 검색"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit">검색</button>
							</div>
						</div>
					</form>

				</div>
				고정된 인풋 끝 -->

			</div>
			<!-- top page 끝 -->


			<!-- 책이미지와 서평 내용 출력 -->
			<div class="container">
			
			<c:if test="${ !empty list }">
				<ul id="ulRow">
					<c:forEach var="vo" items="${ list }">
						<li class="row pl-3">
							<img alt="이미지" src="${vo.image}" width="100" height="150" style="border : 1px solid lightgray"/>
							<div style="width: 70%" class="ml-4">
								<span style="margin-right: 5px; font-size: 17pt;">${vo.m_title}</span>
								<span>${vo.registdate}</span><br>
								별점 : 
								<c:forEach var="i" begin="1" end="${vo.m_star}">
									<span>★</span>
								</c:forEach><br>	
								<span style="font-size: 14pt; word-break: keep-all ;">${vo.m_content}</span> <!-- style="word-break: keep-all ;" -->
							</div>
						</li>
						<div class="caption">
						<c:choose>
							<c:when test = '${fn:length(vo.title) >= 19}'>
							${fn:substring(vo.title,0,18)}...
							</c:when>
							<c:otherwise>
							${vo.title}
							</c:otherwise>
						</c:choose>
						</div>
						<div class="line"></div> <!-- 구분선 -->
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
			<a href="otherReadBook" style="text-decoration: none"><!-- 전체목록으로 이동 -->
				<button class="btn btn-outline-secondary mx-auto mt-5" type="button" style="display: block;" id="listall">전체 목록</button>
			</a>
			
			<c:if test="${ empty list }">
				<h2>읽은 책이 없습니다.  <img src="images/smile-emoji.png" style="width: 50px; padding-bottom: 5px"></h2>

			<div class="line"></div> <!-- 구분선 -->
			</c:if>
			<!-- 책이미지와 서평 내용 출력 끝 -->           
            </div><!-- 컨테이너 끝 -->

		</div>
		<!-- Page Content 끝 -->

		<div class="sign"><!-- 회원가입 및 로그인 -->
			<c:if test="${empty status }">
				<form action="signIn" method="get" style='float: left;'>
					<input id="signColor" type="submit" class="nav-link p-2"
						value="로그인">
				</form>
				<form action="signUp" method="get" style='float: left;'>
					<input id="signColor" type="submit" class="nav-link p-2"
						value="회원가입">
				</form>
			</c:if>
			<c:if test="${!empty status }">
				<form action="signIn" method="post" style='float: left;'>
					<input id="signColor" type="submit" class="nav-link p-2"
						value="로그아웃">
				</form>
			</c:if>
		</div><!-- 회원가입 및 로그인 끝 -->

	</div>


	<script type="text/javascript">
    function fn_paging(curPage) {
    	location.href = "/book/readBook?curPage=" + curPage;
    }
    
	    $(document).ready(function () {
	    	// hide sidebar
	        $('#sidebar').toggleClass('active');
	        $("#sidebar").mCustomScrollbar({
	            theme: "minimal"
	        });
	        
	        $('#sidebarCollapse').on('click', function () {
	        	// open sidebar
	            $('#sidebar, #content').toggleClass('active');
	            $('.collapse.in').toggleClass('in');
	            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
	        });
	    });
    </script>

	<script>
		function hover(e) {
			var image = e.childNodes[1];
			image.id === 'pencil' ? image.src = 'images/white-pencil.png' : image.src = 'images/white-trash.png';
		}
		function leave(e) {
			var image = e.childNodes[1];
			image.id === 'pencil' ? image.src = 'images/pencil.png' : image.src = 'images/trash.png';
		}
	</script>
</body>
</html>