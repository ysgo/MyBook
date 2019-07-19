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
		margin:0px;
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
	
	/*서평 추가 모달*/
	.form-elegant .font-small {
	    font-size: 0.8rem; }
	.form-elegant .z-depth-1a {
	    -webkit-box-shadow: 0 2px 5px 0 rgba(55, 161, 255, 0.26), 0 4px 12px 0 rgba(121, 155, 254, 0.25);
	    box-shadow: 0 2px 5px 0 rgba(55, 161, 255, 0.26), 0 4px 12px 0 rgba(121, 155, 254, 0.25); }
	.form-elegant .z-depth-1-half,
	.form-elegant .btn:hover {
	    -webkit-box-shadow: 0 5px 11px 0 rgba(85, 182, 255, 0.28), 0 4px 15px 0 rgba(36, 133, 255, 0.15);
	    box-shadow: 0 5px 11px 0 rgba(85, 182, 255, 0.28), 0 4px 15px 0 rgba(36, 133, 255, 0.15); }
	.modal-dialog .form-elegant .btn .fab {
	    color: #2196f3 !important; }
	
	.form-elegant .modal-body, .form-elegant .modal-footer {
	    font-weight: 400; }
	    
	/*별점*/    
	.star_rating {font-size:0; letter-spacing:-4px;}
	.star_rating a {
	    font-size:22px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#ccc;
	    text-decoration:none;
	}
	.star_rating a:first-child {
		margin-left:0;
	}
	.star_rating a.on {
		color : #17a2b8;
	}
	
	.modal-open {
    	overflow: scroll; /* 모달 영역을 닫아도 스크롤바가 존재 */
	}
	
	.upDelButton{
		background-color: #17a2b8;
		border:none; 
	}
	
	ul#ulRow{
		margin:0px; 
		padding:0px;
	}
	
	img{
		width : 110px;
		height : 160px; 
		border : 1px solid #000;
		margin-right: 10px;
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
                        </ul>
                    </div>
                </div>
            </nav>
			<!-- navbar 끝 -->

			<!-- 책이미지와 서평 내용 출력 -->
			<c:if test="${ !empty list }">
				<ul id="ulRow">
					<c:forEach var="vo" items="${ list }">
						<li class="row">
							<img alt="이미지" src="${vo.image}"/>
							<div style="margin : 0 10px;">
								<span style="margin-right: 5px; font-size: 20pt;">${vo.m_title}</span>
								<span>${vo.registdate}</span><br>
								별점 : 
								<span>
								<c:choose>
									<c:when test="${vo.m_star == '1'}">
										<a class="on">★</a>
									</c:when>
									<c:when test="${vo.m_star == '2'}">
										<a class="on">★★</a>
									</c:when>
									<c:when test="${vo.m_star == '3'}">	
										<a class="on">★★★</a>
									</c:when>
									<c:when test="${vo.m_star == '4'}">
										<a class="on">★★★★</a>
									</c:when>
									<c:otherwise>
										<a class="on">★★★★★</a>
									</c:otherwise>
								</c:choose></span><br>	
								<span style="font-size: 15pt;">${vo.m_content}</span>
							</div>
						</li>
						<div class="float-right">			
								<button type="button" class="btn btn-primary upDelButton" data-toggle="modal" data-target="#myModal2" 
								onclick="updateButton('${vo.id}', '${vo.m_title}', '${vo.m_star}', '${vo.m_content}'); return false;">수정</button>
								<button type="button" class="btn btn-primary upDelButton" onclick="deleteButton('${vo.id}');">삭제</button>
						</div>
						<div class="line"></div> <!-- 구분선 -->
					</c:forEach>
				</ul>
			</c:if>
			<c:if test="${ empty list }">
				<h2>읽은 책과 서평을 추가해주세요.</h2>
				<div class="line"></div> <!-- 구분선 -->
			</c:if>
			<!-- 책이미지와 서평 내용 출력 끝 -->           
            
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
							<div class="col-sm-12  ">
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
						             <div class="col-6 col-md-7">
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

			<!-- 서평 추가 모달 -->
			<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <!-- 컨텐트 시작 -->
			    <div class="modal-content form-elegant">
			      <!-- 닫기 버튼 -->
			      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			      <!--헤더-->
			      <div class="modal-header text-center">
			        <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel"><strong>글쓰기</strong></h3>
			      </div>
			      <!--바디-->
			      <div class="modal-body mx-4">
			      	<!-- 제목 -->
			        <div class="md-form mb-3">
			          <p class="md-form mb-2">제목</p>
			      	  <input type="text" id="m_title" class="form-control validate">
			        </div>
			        <!-- 별점 -->
			        <div class="md-form mb-3"> <!-- 1:4px 2:8px 3:16px 4:24px 5:48px -->
			          <p class="md-form mb-1">별점</p>
			          <p class="star_rating">
					    <a href="#" target="star" id="1" class="on">★</a>
					    <a href="#" target="star" id="2" class="on">★</a>
					    <a href="#" target="star" id="3" class="on">★</a>
					    <a href="#" target="star" id="4" class="on">★</a>
					    <a href="#" target="star" id="5" class="on">★</a> 
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
        
    </div>
    
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

    <script type="text/javascript">
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
    
    <!-- 책추가, 서평추가 내용 controller 보내서 db저장 & 서평작성모달창 띄우기 -->
    <script>   	
    	var image, title, author, publisher;
    	//책 추가 모달에서 목록을 눌렀을 때
		$('div#row').click(function(){ 
				image = $(this).children('div').children('img#image').attr("src");
			  	title = $(this).children('div').children('span#title').text();
			  	author = $(this).children('div').children('span#author').text();
			  	publisher = $(this).children('div').children('span#publisher').text(); 		

			 	$("#myModal").removeClass("in"); 
			 	$(".modal-backdrop").remove();
		 	 	$("#myModal").hide();
		 	 	$('#myModal2').modal('show');	
		 	 	
		 	 //서평 추가 모달에서 확인버튼 눌렀을 때
		 		$('button#m_submit').click(function(){ 
		 		    var m_title = $('input#m_title').val();
		 		    var m_content = $('textarea#m_content').val();

	 		    $.ajax({
	 		        url: "readBook",
	 		        type: 'POST', 
	 		        data: {
	 		        	title : title,
	 		        	author : author,
	 		        	publisher : publisher,
	 		        	image : image, 
	 		        	m_title : m_title,
	 		        	m_star : m_star,
	 		        	m_content : m_content
	 		        },
	 		        dataType : "text",
	 		        success: function(data){           
	 		        	//alert("insert 보냄");
			 	 		$("#myModal2 .close").click();
			 	 		return false;
	 		        },
	 		        error : function(request, status, error){
	 		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:");
	 		        }
	 		    }); 
	 		}); 
		});	
    </script>
    <!-- 책추가, 서평추가 내용 controller 보내서 db저장 & 서평작성모달창 띄우기 끝 -->

	<script>	
	//서평 모달에서 별점 눌렀을 때 채워지게 함 
	$( ".star_rating a" ).click(function() {
	    $(this).parent().children("a").removeClass("on");
	    $(this).addClass("on").prevAll("a").addClass("on");
	    return false;
	});
	
	//별값 가져오기
	var m_star=5;
	$('a[target]').click(function(){
		   m_star = $(this).attr('id');
	}); 
	</script>
	
	
	<!-- 	수정버튼 -->
	<script>
  	function updateButton(id, m_title, m_star, m_content){
  		document.getElementById('m_title').value=m_title; 
  		document.getElementById('m_content').value=m_content; 
  		$('#'+m_star).parent().children("a").removeClass("on");
  		$('#'+m_star).addClass("on").prevAll("a").addClass("on");

  		var m_star = m_star;
  		$('a[target]').click(function(){
  			m_star = $(this).attr('id');
  		});
  		
  		//서평 추가 모달에서 확인버튼 눌렀을 때
  			$('button#m_submit').click(function(){ 
  			    var m_title = $('input#m_title').val();
  			    var m_content = $('textarea#m_content').val();
  			    
  			    $.ajax({
  			        url: "readBook",
  			        type: 'POST', 
  			        data: {
  			        	bookNum : id,
  			        	m_title : m_title,
  			        	m_star : m_star,
  			        	m_content : m_content
  			        },
  			        dataType : "text",
  			        success: function(data){           
  			        	//alert("보냄");
  			 	 		$("#myModal2 .close").click(); 			 	 		
  			        },
  			        error : function(request, status, error){
  			            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:");
  			        }
  			    }); 
  			}); 
  	}
	</script>
	<!-- 	수정버튼 끝 -->
	
	<!-- 삭제버튼 끝 -->
	<script>
		function deleteButton(id){
		    $.ajax({
		        url: "readBook",
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
	
	    var url = "readBook?keyword=" + keyword;
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
	            url: "readBook",
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