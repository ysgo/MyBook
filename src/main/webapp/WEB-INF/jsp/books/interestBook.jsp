<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<!-- Page Content 시작 -->
		<div id="content">
			<div class="top-page mb-5 center-block">
				<!-- top page 시작 -->
				<div class="btn-with-fixedInput pr-1 pl-3">
					<!-- 메뉴 버튼 -->
					<button type="button" id="sidebarCollapse" class="btn btn-outline-secondary">
						<i class="fas fa-align-left"></i> <span>MENU</span>
					</button>

				</div>

				<div class="fixedInput pl-1">
					<!-- 고정된 인풋 -->

					<form method="get" action="interestBook" target="_self">
						<div class="input-group">
							<input name="interestkeyword" type="text" class="form-control" placeholder="내가 추가한 책 제목, 저자, 출판사 검색"	aria-describedby="basic-addon2">
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
			
			<div class="container" id="displayInterestBook">
				<c:choose>
					<c:when test="${ !empty books }">
						<c:forEach var="book" items="${ books }" varStatus="status">
							<img class="interestBook" id="image${ status.count }" src="${ book.image }"/>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h2>관심 책을 추가해주세요. 
							<img src="/images/smile-emoji.png" style="width: 50px; padding-bottom: 5px">
						</h2>
			</c:otherwise>
				</c:choose>
			</div>
			
			<c:if test="${ !empty books }">
				<script>
		    /* function insertImg() {
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
		
		    }		 */
			</script>
			</c:if>
			<!-- 중앙 정렬 끝 -->
			<!-- <a href="interestBook" style="text-decoration: none">
				전체목록으로 이동
				<button class="btn btn-outline-secondary mx-auto mt-5" type="button" style="display: block;" id="listall">전체 목록</button>
			</a> -->
			<%-- <c:if test="${ empty list }">
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
					관심 책을 추가해주세요 <img src="/images/smile-emoji.png"
						style="width: 50px; padding-bottom: 5px">
				</h2>
				<%
				}
			%>
				<div class="line"></div>
				<!-- 구분선 -->
			</c:if> --%>
			<!-- 책이미지 출력 끝 -->

			<c:if test="${!empty msg}">
				<script> alert("${msg}"); </script>
			</c:if>

			<!-- 모달 영역 시작 -->
			<!-- Button trigger modal -->
			<button id="addButton" type="button" class="btn btn-primary btn-lg"	data-toggle="modal" data-target="#myModal">+</button>

			<!-- 책 추가 모달 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog"	style="max-width: 100%; width: auto; display: table;">
					<div class="modal-content">
						<!-- 닫기 버튼 -->
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>

						<div class="modal-body">
							<!--  모달 컨텐트 컨테이너 -->
							<div class="container">
								<!--  인풋 로우 -->
								<div class="row inputrow">
									<div class="col-sm-12">
										<div class="input-group">
											<input name="keyword" type="text" class="form-control" placeholder="책 제목, 저자 검색" aria-describedby="basic-addon2" width="20px">
											<div class="input-group-append">
												<button class="btn btn-outline-secondary" id="submitForm">검색</button>
											</div>
										</div>
									</div>
								</div>

								<br>
<!--  결과 로우 -->
<div id="search-result">
	<script id="search-result-item" type="text/x-handlebars-template">
	{{#each books}}
		<div id="row" class="row mr-1 searchResult">
			<div id="imgContainer" class="col-sm-3">
				<img id="image" src="{{image}}" style="width: 200px">
			</div>
			<div class="col-sm-4">
				<span id="title">{{{title}}}</span>
				<br>
				<br>
				<span id="author">{{author}}</span>
				<br>
				<span id="publisher">{{publisher}}</span>
			</div>
			<div class="col-sm" id="description">{{{description}}}</div>
			<div class="w-150"></div>
		</div>
	{{/each}}
	</script>
</div>
						<%-- 		<c:forEach items="${bookList}" var="b">
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
								</c:forEach> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 책 추가 모달 끝 -->

		</div>
		<!-- Page Content 끝 -->
<script type="text/javascript" src="/js/interestBook.js"></script>