<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
<%@page import="java.net.URLEncoder"%>
<style>
	#kyoboImg, #interparkImg, #aladinImg,  #yes24Img {
		width : 178px;
		height : 65px;
	}
</style>
</head>
<body>
	<div class="wrapper">
        <!-- left Sidebar 시작 -->
        <nav id="sidebar">
			<div class="sidebar-header p-3">
            	<a href="${pageContext.request.contextPath}/" class="brand-logo" style="font-family: 'Fredoka one'">
					CHACKCHECK
				</a>
            </div>

            <ul class="list-unstyled components">
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
                        <span>메뉴</span>
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
			                                <input id="signColor" type="submit" value="로그아웃" class="nav-link">
			                            </form>
		                            </li>
	                            </c:if>                    
                        </ul>
                    </div>
                </div>
            </nav>
			<!-- navbar 끝 -->
			
			<!-- 선택한 관심책 상세 내용 출력 -->
			<c:if test="${ !empty list }">	
				<c:forEach var="vo" items="${ list }">	
				<div class="row" style="height: auto;">
						<img alt="이미지" src="${vo.image}" width="100" height="150" style="border : 1px solid #000;"/>	
						<div>
							<span style="font-weight: bold; font-size: 25px;">${vo.title}</span><br>	
							<span style="font-weight: bold; font-size: 17px;">저자 : ${vo.author}</span><br>	
							<span style="font-weight: bold; font-size: 17px;">출판사 : ${vo.publisher}</span><br>	
							<p style="font-size: 15px;">${vo.description}</p>
						</div>
				</div>
				<div class="line"></div> <!-- 구분선 --> 	
				<div> 
					<% String encodeStr = (String)request.getAttribute("bookTitle"); %>
					<a href="http://www.kyobobook.co.kr/search/SearchKorbookMain.jsp?vPstrCategory=KOR&vPstrKeyWord=<%= URLEncoder.encode(encodeStr, "euc-kr") %>&vPplace=top" target="_blank"><img id="kyoboImg" src="images/kyobo.png" alt="교보문고" ></a>
					<a href="http://bsearch.interpark.com/dsearch/book.jsp?sch=all&bid1=search_auto&bid2=product&bid3=000&bid4=001&query=<%= URLEncoder.encode(encodeStr, "euc-kr") %>" target="_blank"><img id="interparkImg" src="images/interpark.jpg" alt="인터파크" ></a>
					<a href="https://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=All&SearchWord=<%= URLEncoder.encode(encodeStr, "euc-kr") %>&x=0&y=0" target="_blank"><img id="aladinImg" src="images/aladin.png" alt="알라딘"></a>
					<a href="http://www.yes24.com/searchcorner/Search?keywordAd=&keyword=&domain=ALL&qdomain=%C0%FC%C3%BC&Wcode=001_005&query=<%= URLEncoder.encode(encodeStr, "euc-kr") %>" target="_blank"><img id="yes24Img" src="images/yes24.png" alt="yes24"></a>
				</div>		 
				</c:forEach>		
			</c:if>
			<!-- 선택한 관심책 상세 내용 출력 끝 -->
			
			</div>
        <!-- Page Content 끝 -->
        
    </div>
    
    <script type="text/javascript">
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