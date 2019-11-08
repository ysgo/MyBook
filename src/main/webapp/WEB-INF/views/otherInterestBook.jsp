<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>
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
		                        	<form id="leftSideBar" action="readBook" method="post">
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
			                        	<form id="leftSideBar" action="signIn" method="post">
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

			<div class="top-page mb-5 center-block"><!-- top page 시작 -->
		 		<div class="btn-with-fixedInput pr-1 pl-3">
					<!-- 메뉴 버튼 -->
						<button type="button" id="sidebarCollapse"
							class="btn btn-outline-secondary">
							<i class="fas fa-align-left"></i> <span>MENU</span>
						</button>
				</div>
					
				<div class="fixedInput pl-1"><!-- 고정된 인풋 -->
				
					<form method="get" action="otherInterestBook" target="_self">
					<div class="input-group">
						<input name="interestkeyword" 
				        	type="text" class="form-control" 
				        	placeholder="내가 추가한 책 제목, 저자, 출판사 검색"
			        	 	aria-describedby="basic-addon2"
			        	 	>
			        	 	<input type="hidden" name="email" value="<%= request.getParameter("email")%>">
			        	 <div class="input-group-append">
			    			<button class="btn btn-outline-secondary" type="submit">검색</button>
			 			 </div>
					</div>
					</form>

			     </div><!-- 고정된 인풋 끝 -->
	 			
	 		</div><!-- top page 끝 -->
			

		<c:if test="${ !empty list }">
	
		  <div class="container" id="displayInterestBook"></div>
		  
		</c:if>	
		<!-- 중앙 정렬 끝 -->
		
			<a href="otherInterestBook?email=<%= request.getParameter("email")%>" style="text-decoration: none"><!-- 전체목록으로 이동 -->
				<button class="btn btn-outline-secondary mx-auto mt-5" type="button" style="display: block;" id="listall">전체 목록</button>
			</a>
			<c:if test="${ empty list }">
			<% 
				if(request.getParameter("interestkeyword") != null) { 
			%>
				<h2 style="padding-top: 30px">찾으시는 책이 없어요  <img src="images/sad-emoji.png" style="width: 50px; padding-bottom: 5px"></h2>
			<%
				} 
			%>
			<div class="line"></div> <!-- 구분선 -->
			</c:if>
			<!-- 책이미지 출력 끝 -->           
            
            <c:if test="${!empty msg}">
				<script> alert("${msg}"); </script> 
			</c:if>	

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
	       		<form action="signOut" method="post" style ='float: left;'>
	              		<input id="signColor" type="submit" class="nav-link p-2" value="로그아웃">
	          	</form>
	        </div>
        </c:if>
        <!-- 회원가입 및 로그인 끝 -->
        
	 </div>
<script>
// 책이미지 출력
// 중앙 정렬
	function makeDiv() {
		var total = '${total}';
		if (total % 4 > 0) {
			var rows = parseInt(total / 4) + 1;
		} else {
			var rows = parseInt(total / 4);
		}

		for (var i = 1; i <= rows; i++) {
			$('#displayInterestBook')
					.append(
							"<div class='row justify-content-md-center mb-0' id=row"+ i +"></div><div class='line'></div>");
			for (var j = 1; j <= 4; j++) {
				$('#row' + i).append(
						"<div class='col'><div class='center-block' id='col"
								+ (((i - 1) * 4) + j) + "'></div></div>");
			}
		}
	};
	function insertImg() {
		var count = 1;

		<c:forEach var="vo" items="${ list }" varStatus="status">

		var vo_id = '${vo.id}';
		var vo_title = '${vo.title}';
		var vo_img = '${vo.image}';
		var image = $('<img />', {
			id : 'image' + count,
			src : vo_img,
		});

		image.css('width', '120px');
		image.css('height', '180px');
		image.css('border', '1px solid lightgray');

		image.hover(function() {
			$(this).stop().animate({
				zoom : '1.1'
			}, 150);
		}, function() {
			$(this).stop().animate({
				zoom : '1'
			}, 200);
		})

		image.click({
			bookNum : vo_id,
			bookTitle : vo_title,
			image : vo_img,
			email : '<%=request.getParameter("email")%>'}, interestForm);
	
		      function interestForm(e, bookNum, bookTitle, image, email) {
		        $.ajax({
		          url: "detailInterestBook",
		          type: 'GET', 
		          data: {
		            bookNum : e.data.bookNum,
		            bookTitle : e.data.bookTitle,
		            image : e.data.image,
		            email : e.data.email
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
		      /* $('#col' + count).append("<div style='position: relative;' id='iconbox'><div style='position: absolute; right: 3px; bottom: 153px'><a href='interestBook?bookNum=${vo.id}'><img class='svg deletelink' src='images/times-solid.svg' style='z-index: 999;'></a></div></div>"); */
		
		      count++;
		
		    </c:forEach>		
		
		    }		
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
	
	// svg inline
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
<!-- svg inline -->
</script>
</body>
</html>