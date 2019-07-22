<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>CHACKCHECK</title>

	<!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
            <button type="button" id="sidebarCollapse" class="btn btn-outline-secondary mb-5 mt-2">
               <i class="fas fa-align-left"></i>
               <span>MENU</span>
            </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <%-- <div class="collapse navbar-collapse" id="navbarSupportedContent">
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
                    </div> --%>
            <!-- </nav> -->
			<!-- navbar 끝 -->

			<!-- 컨텐트 추가 시작 -->
			<article id="updateArticle" class="card-body mx-auto">
				<h2>내 정보 수정</h2>

				<!-- 수정 폼태그 시작 -->
				<form action="${pageContext.request.contextPath}/myPage" method="POST" location.reload();>
					<!-- 닉네임 -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-user"></i>
							</span>
						</div>
						<input value="${ status.userName }" name="userName"
							class="form-control" placeholder="닉네임" type="text" required
							autofocus>
					</div>
					<!-- 이메일 -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-envelope"></i>
							</span>
						</div>
						<input value="${ status.userId }" name="userId"
							class="form-control" placeholder="이메일" type="email" readonly>
					</div>

					<!-- 비밀번호 -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input id="userPass" name="userPass" class="form-control" placeholder="비밀번호" type="password" required>
					</div>

					<!-- 비밀번호 확인 -->
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input id="rePass" class="form-control" placeholder="비밀번호 확인" type="password" required>
						<input type="button" id="checkPass" value="중복확인">
					</div>

					<!-- 수정 버튼 -->
					<div class="form-group">
						<input id="submit" type="submit" class="btn btn-primary btn-block" value="수정">
					</div>
				</form>
				<!-- 수정 폼태그 끝 -->
				
				<!-- 탈퇴 페이지 이동 -->
				<div class="form-group">
					<input onclick="location.href='/book/withdrawal'"type="button" class="btn btn-primary btn-block" value="탈퇴">
				</div>
				
			</article>
			<div class="line"></div>
			<!-- 구분선 -->
			<!-- 컨텐트 추가 끝 -->

		</div>
		<!-- Page Content 끝 -->

		<!-- 회원가입 및 로그인 -->
	   <div class="sign">
			<c:if test="${ empty status }">
	       		<form action="signIn" method="get" style ='float: left;'>
	              		<input id="signColor" type="submit" class="nav-link p-2" value="로그인">
	          	</form>
	       		<form action="signUp" method="get" style ='float: left;'>
	              		<input id="signColor" type="submit" class="nav-link p-2" value="회원가입">
	          	</form>
	        </c:if>
	        <c:if test="${ !empty status }">
	       		<form action="signOut" method="post" style ='float: left;'>
	              		<input id="signColor" type="submit" class="nav-link p-2" value="로그아웃">
	          	</form>
        	</c:if>
        </div> 
        <!-- Page Content 끝 -->
        
    </div>
    
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	
	<script>
	var text;
	var check = true;
	var pwJ = /^[A-Za-z0-9]{4,16}$/;
	
	// 변경 비밀번호 유효성 검사 및 재확인
	$("#submit").attr("disabled", check);
	$("#checkPass").on("click", function() {
		var userPass = document.getElementById("userPass").value;
		var rePass = document.getElementById("rePass").value;
	
		if(rePass != "") { 
			if(pwJ.test(rePass)) {
				if(userPass != rePass) {
					text = "비밀번호가 일치하지 않습니다.";
					check=true;
				} else {
					text = "비밀번호가 일치합니다.";
					check=false;
				}
			} else {
				text = "숫자 또는 문자로만 4~12자리 입력가능합니다.";
				check=true;
			}
		}
		alert(text);
		$("#submit").attr("disabled", check);
});
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
        });
    </script>
</body>
</html>