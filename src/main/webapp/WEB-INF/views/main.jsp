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
			
			<!-- 컨텐트 추가 시작 -->
			<!-- 트렌딩 북 -->
			<h3 style="font-size: 28px; font-weight: 700; color: #58C9B9;">지금 인기있는 책</h3>
            <div class="line"></div>
            <div id="trending" class="mx-auto mt-4 mb-2 p-3">
			<c:set var ="num" value="1" />
            <c:forEach var="vo" items="${ list }" >
            		<div class="slide" style="display:table; margin:0 auto;">
            			<div style="display: table-row; height: 40px; font-weight: 700"># 가장 많이 읽은 책 ${num}위</div>  
	            		<div style="display: table-cell; vertical-align:middle;" class="p-0"><img src="${vo.image}" style="box-shadow: 4px 4px 5px 0px rgba(107,106,107,1);"></div>
	            		<div style="display: table-cell; vertical-align:middle;" class="pl-4">
		            		<span style="font-size: 20px">${vo.title}</span><br><br>
	 	            		${vo.author}<br>
		            		${vo.publisher}<br><br> 
		            		<span style="color:gray">${vo.description}</span><br> 
	            		</div>	
            		</div>
            		<c:set var="num" value="${num+1}" />	
            </c:forEach>		
            </div>
            <div style="height: 60px"></div>
			
			<script>
			var index = 0;
			function slide() {
				var i;
				var x = document.getElementsByClassName("slide");
				for(i = 0 ; i < x.length ; i++) {
					x[i].style.display = "none"; 
				}
				index++;
				if(index > x.length) {
					index = 1;
				}
				x[index-1].style.display= "block";
				setTimeout(slide, 2000);
			}
			</script>
			<!-- 트렌딩 북 끝 -->
			
            <h2 style="font-size: 28px; font-weight: 700; color: #58C9B9;">회원들의 활동 로그</h2>
            	 <div class="line"></div>
	            <c:if test="${ !empty listLog }">
		           		<c:forEach var="vo" items="${listLog}" varStatus="status">
			           		<c:if test="${status.count <6}">
			           			<!-- 읽은 책 -->
			           			<c:if test="${!empty vo.myBookTitle}"> 
			           				<form action="otherReadBook" method="get">
				               			<input type="hidden" name="email" value="${vo.email}">
				           				<input id="userNameCss" type="submit" value="${vo.userName}">
				           				&emsp;<span>${vo.logregistdate}</span>
			           				</form><br> 
			           				<span style="font-weight: bold; word-break: keep-all ;">${vo.myBookTitle}</span>
				           			<c:if test="${empty vo.isupdate}">
				           				<span style="word-break: keep-all ;"> 책 서평을 작성하였습니다.</span>
				           			</c:if>
				           			<c:if test="${!empty vo.isupdate}">
				           				<span style="word-break: keep-all ;"> 책 서평을 변경하였습니다.</span>
				           			</c:if>	
				           			<br>별점 <span>
				           					<c:forEach var="i" begin="1" end="${vo.m_star}">
				           						<span style="color : #58C9B9;">★</span>
											</c:forEach></span><br>
									<div style="word-break: keep-all ;">${vo.m_content}</div>		
			           			</c:if> 
			           			
			           			<!-- 관심 책 -->
			           			<c:if test="${empty vo.myBookTitle}"> 
			           				<form action="otherInterestBook" method="get">
				               				<input type="hidden" name="email" value="${vo.email}">
				           					<input id="userNameCss" type="submit" value="${vo.userName}">
				           					&emsp;<span>${vo.logregistdate}</span>
			           				</form><br> 

		           					<span style="font-weight: bold; word-break: keep-all ;">${vo.interestBookTitle}</span>
			           				<c:if test="${empty vo.isupdate}">
			           				<span style="word-break: keep-all ;"> 책을 관심 책으로 추가하였습니다.</span>
			           				</c:if>	           			
			           				
			           			</c:if>			
								<div class="line"></div>
							</c:if>
						 </c:forEach>
					 <form style="text-align: right;" action="allLog" method="get"> 
				     	<button type="submit" class="btn btn-outline-secondary">모든 활동기록 보기 ></button>
				     </form>
				 </c:if>
				 <c:if test="${ empty listLog }">
				 	<div>활동기록이 없습니다.</div>
				 	<div class="line"></div>
				 </c:if>
            <!-- 컨텐트 추가 끝 -->

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
	<!-- jQuery Custom Scroller CDN -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js">
	</script>
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
            
            $('#tooltip').hover(function(){
            	//$( '#tooltiptext' ).removeClass( 'invisible' );
            	$( '#tooltiptext' ).animate({opacity: "1"}, 1000);
      
            });
            $('#tooltip').mouseleave(function(){
            	$( '#tooltiptext' ).animate({opacity: "0"}, 500);
            	//$( '#tooltiptext' ).fadeTo("fast", 0);
            	//$( '#tooltiptext' ).addClass( 'invisible' );
             });
            
            slide();
        });
    </script>
</body>
</html>