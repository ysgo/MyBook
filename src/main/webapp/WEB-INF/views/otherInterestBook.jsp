<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/booklist-style.css">
    <link rel="stylesheet" href="css/interestbook-style.css">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

</head>

<body>

    <div class="wrapper">
       	<div style="z-index:500">
	        <a href="${pageContext.request.contextPath}/" class="brand-logo-main" >
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

			<div class="top-page mb-5"><!-- top page 시작 -->
	 		
	 			<div class="btn-with-fixedInput pr-1 pl-3"><!-- 메뉴 버튼 -->
	
					<button type="button" id="sidebarCollapse" class="btn btn-outline-secondary">
		               <i class="fas fa-align-left"></i>
		               <span>MENU</span>
		            </button>
		            
				</div>
					
				<!-- <div class="fixedInput pl-1">고정된 인풋
				
					<form method="get" action="interestBook" target="_self">
					<div class="input-group">
						<input name="interestkeyword" 
				        	type="text" class="form-control" 
				        	placeholder="내가 추가한 책 제목, 저자, 출판사 검색"
			        	 	aria-describedby="basic-addon2"
			        	 	>
			        	 <div class="input-group-append">
			    			<button class="btn btn-outline-secondary" type="submit">검색</button>
			 			 </div>
					</div>
					</form>

			     </div>고정된 인풋 끝 -->
	 			
	 		</div><!-- top page 끝 -->
			
			<!-- 책이미지 출력 -->
			<c:if test="${ !empty list }">
				<c:forEach var="vo" items="${ list }" varStatus="status">		
				
					<div class="img-wrap pl-2">
   						<button type="button" class="btn btn-circle close" onclick="deleteButton('${vo.id}', '${vo.registdate}');">
   							<i class="fas fa-times" style="color: white;"></i>
   						</button>
  							<form action="detailInterestBook" method="post">
  								<input type="hidden" name="bookNum" value="${vo.id}">
  								<input type="hidden" name="bookTitle" value="${vo.title}">
							<input type="image" alt="이미지" src="${vo.image}"> 
						</form>
					</div>	
					<c:if test="${status.count % 4 == 0}">		
						<br>
						<div class="line"></div> <!-- 구분선 -->
					</c:if>    			 
				</c:forEach>
			</c:if>
			<a href="interestBook" style="text-decoration: none"><!-- 전체목록으로 이동 -->
				<button class="btn btn-outline-secondary mx-auto mt-5" type="button" style="display: block;">전체 목록</button>
			</a>
			<c:if test="${ empty list }">
				<h2>관심 책이 없습니다.</h2>
				<div class="line"></div> <!-- 구분선 -->
			</c:if>
			<!-- 책이미지 출력 끝 -->           

        </div>
        <!-- Page Content 끝 -->
        
        <!-- 회원가입 및 로그인 -->
        <c:if test="${ empty status }">
	        <div class="sign">
	       		<form action="signIn" method="get" style ='float: left;'>
	              		<input id="signColor" type="submit" class="nav-link p-2" value="로그인">
	          	</form>
	       		<form action="signUp" method="get" style ='float: left;'>
	              		<input id="signColor" type="submit" class="nav-link p-2" value="회원가입">
	          	</form>
	        </div>
        </c:if>
        <c:if test="${ !empty status }">
	        <div class="sign">
	       		<form action="signOut" method="get" style ='float: left;'>
	              		<input id="signColor" type="submit" class="nav-link p-2" value="로그아웃">
	          	</form>
	        </div>
        </c:if>
        <!-- 회원가입 및 로그인 끝 -->
        
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