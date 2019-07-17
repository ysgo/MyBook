<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>홈페이지명</title>
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- navbar left로 이동 기능 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
 
<!-- Our Custom CSS -->
<link rel="stylesheet" href="css/mylibrary.css">

<!-- 페이지 스크롤바 출력 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

<!-- Font Awesome JS -->
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

<!-- navbar left로 이동 기능 시작 -->
<script type="text/javascript">
        $(document).ready(function () {
            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar, #content').toggleClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
        });
 </script>
 <!-- Scrollerbar left로 이동 기능 끝 -->
 
<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      p{
      	text-align: center;
      	/* margin-top: 200px; */
      }
</style>
</head>
<body>
<div class="wrapper">
<!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>책책</h3>
            </div>

            <ul class="list-unstyled components">
                <!-- <p>Dummy Heading</p> -->
                <li>
                    <a href="/book/readBook?action=readBook&id=4">읽은 책</a>
                </li>
                <li>
                    <a href="/book/interestBook?action=interestBook&id=5">관심 책</a>
                </li>  
            </ul>
        </nav>
<!-- Sidebar 끝 -->

<!-- Page Content  -->
        <div id="content">
			<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
			  <button type="button" id="sidebarCollapse" class="btn my-0 mr-md-auto">
                        <i class="fas fa-bars" style="color:#000;"></i>
              </button>
              <a class="my-0 mr-md-auto" href="${pageContext.request.contextPath}/"><img src="images/logo.svg" width="38" height="37"></a>
			  <nav class="my-2 my-md-0 mr-md-3">
				  <a class="p-2 text-dark" href="${pageContext.request.contextPath}/readBook?action=readBook&id=4">내 서재</a>
				  <a class="p-2 text-dark" href="${pageContext.request.contextPath}/myPage">내 정보</a>
			  </nav>
			  <nav class="my-2 my-md-0 mr-md-3">
				<c:if test="${empty status }">
			  		<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/signIn?action=signIn&id=2">로그인</a>
			  		<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/signUp?action=signUp&id=1">회원가입</a>
				</c:if>
				<c:if test="${!empty status }">
			  		<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/signOut">로그아웃</a>
				</c:if>
			  </nav> 
			</div>
			<div id="content_padding" class="row" >
				<img src="images/logo.svg" alt="bookImg" width="100" height="50"/>
				<h2>서평을 추가하고싶으면 클릭하세요.</h2>
	            <div class="line"></div>
            </div>          
</div>
<!-- page content 끝 -->

</div> 
<!-- wrapper 끝 -->
</body>
</html>