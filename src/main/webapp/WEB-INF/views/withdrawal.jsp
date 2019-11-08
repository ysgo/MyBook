<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
    <div class="wrapper">
        <!-- left Sidebar 시작 -->
        <nav id="sidebar">
            <div class="sidebar-header p-3">
            	<a href="${pageContext.request.contextPath}/" class="brand-logo" style="font-family: 'Fredoka one'">
					CHACKCHECK
				</a>
            </div>

            <ul class="list-unstyled components">
                <!-- <p>Dummy Heading</p> -->
                <li>
                	<form id="leftSideBar" action="${pageContext.request.contextPath}/" method="get">
	                	<input id="leftSideBarColor" type="submit" value="메인">
	                </form>
                </li>
                <li class="active">
                	<form id="leftSideBar" action="readBook" method="get">
	                	<a href="#bookSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
	                		<input id="leftSideBarColor" type="submit" value="내 서재">
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

			<!-- navbar 시작 -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-outline-secondary">
                        <i class="fas fa-align-left"></i>
                        <span>MENU</span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <c:if test="${empty status}">
	                            <li class="nav-item active">
	                            	<form action="signIn" method="get">
		                                <input id="signColor" type="submit" value="로그인" class="nav-link">
		                            </form>
	                            </li>
	                            <li class="nav-item active">
		                            <form action="signUp" method="get">
		                                <input id="signColor" type="submit" value="회원가입" class="nav-link">
		                            </form>
	                            </li>
                            </c:if>
                            <c:if test="${!empty status}">
                            	<li class="nav-item active">
	                            	<form action="signOut" method="post">
		                                <input id="signColor" type="submit" value="로그아웃" class="nav-link" style="color:#58C9B9; font-weight: 700">
		                            </form>
	                            </li>
                            </c:if>                    
                        </ul>
                    </div>
                </div>
            </nav>
			<!-- navbar 끝 -->
			
			<!-- 컨텐트 추가 시작 -->    
			<article id="updateArticle" class="card-body mx-auto">
				<h2>회원 탈퇴</h2><br>
				
				<!-- 수정 폼태그 시작 -->
				<form action="${pageContext.request.contextPath}/withdrawal" method="POST">

					<!-- 비밀번호 확인 -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
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
					<input onclick="location.href='/book/myPage'"type="button" class="btn btn-outline-secondary btn-block" value="취소">
				</div>
				
			</article>
            <div class="line"></div> <!-- 구분선 -->
            <!-- 컨텐트 추가 끝 -->

        </div>
        <!-- Page Content 끝 -->
        
    </div>
    
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

    <script type="text/javascript">
    // 뒤로가기시 회원탈퇴 페이지 안되게 하기
    window.history.forward();
    function noBack() { window.history.forward(); }
    
        $(document).ready(function () {
	    	// hide sidebar when refresh the page
	        $('#sidebar').toggleClass('active');
	        $("#sidebar").mCustomScrollbar({
	            theme: "minimal"
	        });
	        
	        $('#sidebarCollapse').on('click', function () {
	        	// open sidebar when clicked
	            $('#sidebar, #content').toggleClass('active');
	            $('.collapse.in').toggleClass('in');
	            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
	        });
        });
    </script>
</body>

</html>