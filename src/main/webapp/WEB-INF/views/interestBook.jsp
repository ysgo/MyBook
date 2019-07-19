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
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS CDN -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/booklist-style.css">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	body {
		font-family:  ''Noto Sans KR";
	}
	#imgContainer {
		text-align:center;
	}
	.row {
		padding: 5px;
	}
	.row:hover {
		background-color: #dcebf7;
		cursor: pointer;
	}
	.inputrow:hover {
		background-color: white;
	}
	.inputrow {
		margin: 0 auto;
	    float: none;
	    text-align: center;
	}
	.input-group{
		vertical-align: middle; 
	}

	.modal-open {
    	overflow: scroll; /* 모달 영역을 닫아도 스크롤바가 존재 */
	}
	
	.upDelButton{
		background-color: #17a2b8;
		border:none; 
	}
	
	/* 이미지 위에 마우스를 올려놓으면 opacity가 1이 되는 영역 */
	.img-wrap {
	    position: relative;
	    display: inline-block;
	    font-size: 0;
	}
	
	/* 이미지 위에 deleteButton */
 	.img-wrap .close{
	    position: absolute;
	    top: 4px;
	    right: 18px;
	    z-index: 100;
 	    background-color: #58C9B9;
	    padding: 5px 2px 2px;
	    color: #fff;
	    font-weight: bold; 
	    cursor: pointer;
	    opacity: 0.2;
	} 
	.img-wrap:hover .btn-circle {
	    opacity: 1;
	}
 	.btn-circle {
	  	width: 25px;
	  	height: 25px;
	  	text-align: center;
	  	padding: 6px 0;
	  	font-size: 18px;
	  	border-radius: 15px;
	  	position: absolute;
	    top: 4px;
	    right: 18px;
	    z-index: 100;
	    color : #fff;
	} 
	
	/* 구분선 진하게 */
	div.line{
		border : 2px solid #000;
	}
	
	input[type=image]{
		width : 110px;
		height : 160px; 
		border : 1px solid #000;
		margin : 0 15px;
	}
</style>
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

			<!-- navbar 시작 -->
            <button type="button" id="sidebarCollapse" class="btn btn-outline-secondary mb-5">
               <i class="fas fa-align-left"></i>
               <span>MENU</span>
            </button>
			<!-- navbar 끝 -->
			
			<!-- 책이미지 출력 -->
			<c:if test="${ !empty list }">
					<c:forEach var="vo" items="${ list }" varStatus="status">		
						<div class="img-wrap">
    						<button type="button" class="btn btn-circle close" onclick="deleteButton('${vo.id}');"><i class="fas fa-times"></i></button>
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
			<c:if test="${ empty list }">
				<h2>관심 책을 추가해주세요.</h2>
				<div class="line"></div> <!-- 구분선 -->
			</c:if>
			<!-- 책이미지 출력 끝 -->           
            
            <c:if test="${!empty msg}">
				<script> alert("${msg}"); </script> 
			</c:if>

			<!-- 모달 영역 시작 -->          
            <!-- Button trigger modal -->
			<button id="addButton" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
			  +
			</button>
			 
			<!-- 책 추가 모달 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
			    <div class="modal-content">
				  <!-- 닫기 버튼 -->
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				 
				 <div class="modal-body">
				 	
				 	<!--  모달 컨텐트 컨테이너 -->     	
				 	<div class="container">
				 		<!--  인풋 로우 -->   
						<div class="row inputrow">
							<div class="col-sm-12">
								<div class="input-group">
						        	<input name="keyword" 
							        	type="text" class="form-control" 
							        	placeholder="책 제목, 저자 검색"
						        	 	aria-describedby="basic-addon2"
						        	 	width="20px">
						        	 <div class="input-group-append">
						    			<button class="btn btn-outline-secondary" type="" id="submitForm">검색</button>
						 			 </div>
							     </div>
							</div>
						</div>
			
				       <br>
				       <!--  결과 로우 -->   
				        <c:forEach items="${bookList}" var ="b" >
					        	<div id="row" class="row">
					        		<div id="imgContainer" class="col-2 col-sm-2">
					                	<img id="image" src="${b.image}">
						            </div>
						            <div class="col-2 col-sm-3">
						            	<span id="title">${b.title}</span><br>
						                <span id="author">${b.author}</span><br>
						                <span id="publisher">${b.publisher}</span>
						            </div>
						             <div id="description" class="col-6 col-md-7">
						                ${b.description}
						            </div>
						            <div class="w-150"></div>
					        	</div>
				        </c:forEach>
						
						</div>
			        	<!--  모달 컨텐트 컨테이너 끝 -->
				 </div>	
			    </div>
			  </div>
			</div>
			<!-- 책 추가 모달 끝 -->

        </div>
        <!-- Page Content 끝 -->
        
        <!-- 회원가입 및 로그인 -->
        <div class="sign">
       		<form action="signIn" method="get" style ='float: left;'>
              		<input id="signColor" type="submit" class="nav-link p-2" value="로그인">
          	</form>
       		<form action="signUp" method="get" style ='float: left;'>
              		<input id="signColor" type="submit" class="nav-link p-2" value="회원가입">
          	</form>
        </div>
        <!-- 회원가입 및 로그인 끝 -->
        
    </div>

	<!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

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
        
    <!-- 책추가 controller 보내서 db저장 -->
    <script>   	
    	//책 추가 모달에서 목록을 눌렀을 때
		$('div#row').click(function(){ 
		    var	image = $(this).children('div').children('img#image').attr("src");
		    var	title = $(this).children('div').children('span#title').text();
		    var	author = $(this).children('div').children('span#author').text();
		    var	publisher = $(this).children('div').children('span#publisher').text(); 		
		    var	description = $(this).children('div#description').text(); 	
		    
		    $.ajax({
 		        url: "interestBook",
 		        type: 'POST', 
 		        data: {
 		        	title : title,
 		        	author : author,
 		        	publisher : publisher,
 		        	description : description,
 		        	image : image
 		        },
 		        dataType : "text",
 		        success: function(data){           
 		        	//alert("insert 보냄");
 		        	$("#myModal .close").click();
 		        },
 		        error : function(request, status, error){
 		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:");
 		        }
 		    }); 
		});	
    </script>
    <!-- 책추가 controller 보내서 db저장 끝 -->
    
    <!-- 삭제버튼 끝 -->
	<script>
		function deleteButton(id){
		    $.ajax({
		        url: "interestBook",
		        type: 'POST', 
		        data: {
		        	bookNum : id
		        },
		        dataType : "text",
		        success: function(data){           
		        	//alert("delete 보냄");	 	
		        	$('body').html(data);
		        },
		        error : function(request, status, error){
		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:");
		        }
		    }); 
		}
	</script> 
	<!-- 삭제버튼 끝 -->
    
    <!-- 도서 검색 -->
	<script>
	function searchFunc(e) {  
		var keyword = $('input[name=keyword]').val();
	
	    var url = "interestBook?keyword=" + keyword;
	    if(e.type == "keydown" && e.keyCode != 13) { return; } 
	    
	    $.ajax({
	        url: url,
	        type: 'GET', 
	        success: function(data){
	        	$('body').html(data);
	            $('#myModal').modal('show'); 
	        }
	    });
	}
	
	$(function(){
	    $('#submitForm').on('click', searchFunc);   
	    $('input[name=keyword]').on('keydown', searchFunc);   
	    $('.close').on('click', function() {
	    	$.ajax({
	            url: "interestBook",
	            type: 'GET', 
	            success: function(data){
	            	$('body').html(data);
	            }
	        });
	    });   
	});
	</script>
	<!-- 도서 검색 끝-->
</body>

</html>