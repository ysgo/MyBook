<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
</head>
<body>
    <div class="wrapper">
         <div style="z-index:500">
	        <a href="${pageContext.request.contextPath}/" class="brand-logo-main" >
				<div class="container">
					<div class="row" id="tooltip" style="width: 200px;">
						<div class="col-sm-auto pr-0 mt-2">		
							CHACK<br>CHECK
						</div>
						<div class="col-sm-auto pl-1">
							<img src="images/book.jpg" style="width: 55px">
						</div>
					</div>	
					<div class="p-3" id="tooltiptext">안녕하세요! 책첵은 처음인가요?<br>회원가입 후 첫 서평을 작성해보세요:)</div>
				</div>
			</a>		
         </div>
    
  		<!-- left Sidebar 시작 -->
        <nav id="sidebar">

            <div class="sidebar-header p-3">
            	<a href="${pageContext.request.contextPath}/" class="brand-logo">
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
                <c:choose>
                	<c:when test="${ !empty status }">
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
		                
		                <!-- admin jsp 페이지 추가 -->
		                <c:if test="${ empty admin }">
							<li>
								<form id="leftSideBar" action="admin" method="get">
									<input id="leftSideBarColor" type="submit" value="관리자">
								</form>
							</li>
						</c:if>
		                 
		                </c:when>
		                <c:otherwise>
			                <li class="active">
			                	<form id="leftSideBar" action="signIn" method="get">
				                	<a href="#bookSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				                		<input id="leftSideBarColor" type="submit" value="내 서재">
				                	</a>
				               	</form>
			                    <ul class="collapse list-unstyled" id="bookSubmenu">
			                        <li>
			                        	<form id="leftSideBar" action="signIn" method="get">
				                			<input id="leftSideBarColor" type="submit" value="읽은 책">
				                		</form>
			                        </li>
			                        <li>
			                        	<form id="leftSideBar" action="signIn" method="get">
				                			<input id="leftSideBarColor" type="submit" value="관심 책">
				                		</form>
			                        </li>
			                    </ul>
			                </li>
			                <li>
			                	<form id="leftSideBar" action="signIn" method="get">
				                	<input id="leftSideBarColor" type="submit" value="내 정보">
				                </form>
			                </li> 
		                </c:otherwise>
		     	</c:choose>
            </ul>
        </nav>
		<!-- left Sidebar 끝 -->
	
        <!-- Page Content 시작 -->
        <div id="content">

			<!-- navbar 시작 -->
			<button type="button" id="sidebarCollapse" class="btn btn-outline-secondary mb-5 mt-2">
               <i class="fas fa-align-left"></i>
               <span>MENU</span>
            </button>

        </div>
        <!-- Page Content 끝 -->
        
        <!-- 회원가입 및 로그인 -->
        <c:if test="${ !empty status}">
	        <div class="sign">
	       		<form action="signOut" method="post" style ='float: left;'>
	              		<input id="signColor" type="submit" class="nav-link p-2" value="로그아웃">
	          	</form>
	        </div>
        </c:if>
        <c:if test="${ empty status}">
	        <div class="sign">
	       		<form action="signIn" method="get" style ='float: left;'>
	              		<input id="signColor" type="submit" class="nav-link p-2" value="로그인">
	          	</form>
	       		<form action="signUp" method="get" style ='float: left;'>
	              		<input id="signColor" type="submit" class="nav-link p-2" value="회원가입">
	          	</form>
	        </div>
        </c:if>
        <!-- 회원가입 및 로그인 끝 -->
        
    </div>
<script type="text/javascript">
	$(document).ready(function() {
		// hide sidebar when refresh the page
		$('#sidebar').toggleClass('active');
		$("#sidebar").mCustomScrollbar({
			theme : "minimal"
		});
		$('#sidebarCollapse').on('click', function() {
			// open sidebar when clicked
			$('#sidebar, #content').toggleClass('active');
			$('.collapse.in').toggleClass('in');
			$('a[aria-expanded=true]').attr('aria-expanded', 'false');
		});
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
	});
</script>
</body>
</html>