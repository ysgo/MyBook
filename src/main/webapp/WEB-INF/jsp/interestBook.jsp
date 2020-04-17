<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

				<div class="fixedInput pl-1">
					<!-- 고정된 인풋 -->

					<form method="get" action="interestBook" target="_self">
						<div class="input-group">
							<input name="interestkeyword" type="text" class="form-control"
								placeholder="내가 추가한 책 제목, 저자, 출판사 검색"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit">검색</button>
							</div>
						</div>
					</form>

				</div>
				<!-- 고정된 인풋 끝 -->

			</div>
			<!-- top page 끝 -->

			<!-- 책이미지 출력 -->
			<!-- 중앙 정렬 -->
			<script>
				function makeDiv() {
					var total = '${total}';
					console.log('토탈', total);
					if(total%4 > 0) {
						var rows = parseInt(total/4)+1;	
					} else {
						var rows = parseInt(total/4);
					}
					
					for(var i = 1; i <= rows ; i++) {
						$('#displayInterestBook').append("<div class='row justify-content-md-center mb-0' id=row"+ i +"></div><div class='line'></div>");	
						for(var j = 1 ; j <=4 ; j++) {
							$('#row'+i).append("<div class='col'><div class='center-block' id='col"+(((i-1)*4)+j)+"'></div></div>");
						}
					}	
				};			
			</script>

			<c:if test="${ !empty list }">

				<div class="container" id="displayInterestBook"></div>

				<script>
		    function insertImg() {
		      var count = 1;
		
		      <c:forEach var="vo" items="${ list }" varStatus="status">		
		      
		      var vo_id = '${vo.id}';
		      var vo_title = '${vo.title}';
		      var vo_img = '${vo.image}';
		      var image = $('<img />', { 
		        id:'image' + count,
		        src: vo_img,	
		      });
		      
		      image.css('width', '120px');
		      image.css('height', '180px');
		      image.css('border', '1px solid lightgray');
		
		      image.hover(function() {
		        $(this).stop().animate({
		          zoom: '1.1'
		        }, 150);
		      }, function() {
		        $(this).stop().animate({
		          zoom: '1'
		        }, 200);
		      }) 
		
		      image.click({bookNum: vo_id, bookTitle: vo_title, image: vo_img}, interestForm);
		
		      function interestForm(e, bookNum, bookTitle, image) {
		        $.ajax({
		          url: "detailInterestBook",
		          type: 'POST', 
		          data: {
		            bookNum : e.data.bookNum,
		            bookTitle : e.data.bookTitle,
		            image : e.data.image
		          },
		          dataType : "text",
		          success: function(data){           
		            $('body').html(data);
		          },
		          error : function(request, status, error){
		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:");
		          }
		        }); 
		      }
		
		      $('#col' + count).append(image);
		      $('#col' + count).append("<div style='position: relative;' id='iconbox'><div style='position: absolute; right: 3px; bottom: 153px'><a href='interestBook?bookNum=${vo.id}'><img class='svg deletelink' src='images/times-solid.svg' style='z-index: 999;'></a></div></div>");
		
		      count++;
		
		    </c:forEach>		
		
		    }		
			</script>
			</c:if>
			<!-- 중앙 정렬 끝 -->

			<a href="interestBook" style="text-decoration: none">
				<!-- 전체목록으로 이동 -->
				<button class="btn btn-outline-secondary mx-auto mt-5" type="button"
					style="display: block;" id="listall">전체 목록</button>
			</a>
			<c:if test="${ empty list }">
				<% 
				if(request.getParameter("interestkeyword") != null) { 
			%>
				<h2 style="padding-top: 30px">
					찾으시는 책이 없어요 <img src="images/sad-emoji.png"
						style="width: 50px; padding-bottom: 5px">
				</h2>
				<%
				} else {
			%>
				<script>
					$('#listall').hide();
				</script>
				<h2>
					관심 책을 추가해주세요 <img src="images/smile-emoji.png"
						style="width: 50px; padding-bottom: 5px">
				</h2>
				<%
				}
			%>
				<div class="line"></div>
				<!-- 구분선 -->
			</c:if>
			<!-- 책이미지 출력 끝 -->

			<c:if test="${!empty msg}">
				<script> alert("${msg}"); </script>
			</c:if>

			<!-- 모달 영역 시작 -->
			<!-- Button trigger modal -->
			<button id="addButton" type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myModal">+</button>

			<!-- 책 추가 모달 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog"
					style="max-width: 100%; width: auto; display: table;">
					<div class="modal-content">
						<!-- 닫기 버튼 -->
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>

						<div class="modal-body">

							<!--  모달 컨텐트 컨테이너 -->
							<div class="container">
								<!--  인풋 로우 -->
								<div class="row inputrow">
									<div class="col-sm-12">
										<div class="input-group">
											<input name="keyword" type="text" class="form-control"
												placeholder="책 제목, 저자 검색" aria-describedby="basic-addon2"
												width="20px">
											<div class="input-group-append">
												<button class="btn btn-outline-secondary" id="submitForm">검색</button>
											</div>
										</div>
									</div>
								</div>

								<br>
								<!--  결과 로우 -->
								<c:forEach items="${bookList}" var="b">
									<div id="row" class="row mr-1 searchResult">
										<div id="imgContainer" class="col-sm-3">
											<img id="image" src="${b.image}" style="width: 200px">
										</div>
										<div class="col-sm-4">
											<span id="title">${b.title}</span><br>
											<br> <span id="author">${b.author}</span><br> <span
												id="publisher">${b.publisher}</span>
										</div>
										<div class="col-sm" id="description">${b.description}</div>
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
		<c:if test="${ empty status }">
			<div class="sign">
				<form action="signIn" method="get" style='float: left;'>
					<input id="signColor" type="submit" class="nav-link p-2"
						value="로그인">
				</form>
				<form action="signUp" method="get" style='float: left;'>
					<input id="signColor" type="submit" class="nav-link p-2"
						value="회원가입">
				</form>
			</div>
		</c:if>
		<c:if test="${ !empty status }">
			<div class="sign">
				<form action="signOut" method="post" style='float: left;'>
					<input id="signColor" type="submit" class="nav-link p-2"
						value="로그아웃">
				</form>
			</div>
		</c:if>
		<!-- 회원가입 및 로그인 끝 -->

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
	        
	        makeDiv();
	        insertImg();
	        load();
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

	<!-- svg inline -->
	<script>
	function load() {
		jQuery('img.svg').each(function(){
	        var $img = jQuery(this);
	        var imgID = $img.attr('id');
	        var imgClass = $img.attr('class');
	        var imgURL = $img.attr('src');

	        jQuery.get(imgURL, function(data) {
	            // Get the SVG tag, ignore the rest
	            var $svg = jQuery(data).find('svg');

	            // Add replaced image's ID to the new SVG
	            if(typeof imgID !== 'undefined') {
	                $svg = $svg.attr('id', imgID);
	            }
	            // Add replaced image's classes to the new SVG
	            if(typeof imgClass !== 'undefined') {
	                $svg = $svg.attr('class', imgClass+' replaced-svg');
	            }

	            // Remove any invalid XML tags as per http://validator.w3.org
	            $svg = $svg.removeAttr('xmlns:a');

	            // Replace image with new SVG
	            $img.replaceWith($svg);

	        }, 'xml');

	    });
	}
	</script>