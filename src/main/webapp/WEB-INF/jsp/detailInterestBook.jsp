<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<!-- Page Content 시작 -->
		<div id="content">
			<div class="top-page mb-5">
				<!-- top page 시작 -->
				<div class="btn-with-fixedInput pr-1 pl-3">
					<!-- 메뉴 버튼 -->
					<button type="button" id="sidebarCollapse"
						class="btn btn-outline-secondary">
						<i class="fas fa-align-left"></i> <span>MENU</span>
					</button>
				</div>
			</div>
			<!-- top page 끝 -->
			<!-- navbar 끝 -->

			<!-- 선택한 관심책 상세 내용 출력 -->
			<c:if test="${ !empty list }">
				<c:forEach var="vo" items="${ list }">
					<div style="display: table; margin: 0 auto;">
						<div style="display: table-cell; vertical-align: middle;"
							class="pb-2">
							<img alt="이미지" src="${vo.image}" width="120" height="180"
								style="border: 1px solid lightgray; box-shadow: 2px 2px 3px 0px rgba(107, 106, 107, 1);" />
						</div>

						<div style="display: table-cell; vertical-align: middle;"
							class="pl-4">
							<span style="font-weight: bold; font-size: 25px;">${vo.title}</span><br>
							<span style="font-weight: bold; font-size: 17px;">저자 :
								${vo.author}</span><br> <span
								style="font-weight: bold; font-size: 17px;">출판사 :
								${vo.publisher}</span><br> <br>
							<p style="font-size: 15px;">${vo.description}</p>
						</div>
					</div>
					<div class="line"></div>
					<!-- 구분선 -->
					<div class="mb-4" style="font-size: 18px; color: gray">지금 사러
						가기</div>
					<div class="booklink">
						<%
							String encodeStr = (String) request.getAttribute("bookTitle");
						%>
						<a
							href="http://www.kyobobook.co.kr/search/SearchKorbookMain.jsp?vPstrCategory=KOR&vPstrKeyWord=<%=URLEncoder.encode(encodeStr, "euc-kr")%>&vPplace=top"
							target="_blank">KYOBO</a> | <a
							href="http://bsearch.interpark.com/dsearch/book.jsp?sch=all&bid1=search_auto&bid2=product&bid3=000&bid4=001&query=<%=URLEncoder.encode(encodeStr, "euc-kr")%>"
							target="_blank">INTERPARK</a> | <a
							href="https://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=All&SearchWord=<%=URLEncoder.encode(encodeStr, "euc-kr")%>&x=0&y=0"
							target="_blank">ALADDIN</a> | <a
							href="http://www.yes24.com/searchcorner/Search?keywordAd=&keyword=&domain=ALL&qdomain=%C0%FC%C3%BC&Wcode=001_005&query=<%=URLEncoder.encode(encodeStr, "euc-kr")%>"
							target="_blank">YES24</a>
					</div>
				</c:forEach>
			</c:if>
			<!-- 선택한 관심책 상세 내용 출력 끝 -->
		</div>
		<!-- Page Content 끝 -->

	<script>
		$('#tooltip').hover(function() {
			//$( '#tooltiptext' ).removeClass( 'invisible' );
			$('#tooltiptext').animate({
				opacity : "1"
			}, 1000);

		});
		$('#tooltip').mouseleave(function() {
			$('#tooltiptext').animate({
				opacity : "0"
			}, 500);
			//$( '#tooltiptext' ).fadeTo("fast", 0);
			//$( '#tooltiptext' ).addClass( 'invisible' );
		});

		slide();

		jQuery('img.svg').each(function() {
			var $img = jQuery(this);
			var imgID = $img.attr('id');
			var imgClass = $img.attr('class');
			var imgURL = $img.attr('src');

			jQuery.get(imgURL, function(data) {
				// Get the SVG tag, ignore the rest
				var $svg = jQuery(data).find('svg');

				// Add replaced image's ID to the new SVG
				if (typeof imgID !== 'undefined') {
					$svg = $svg.attr('id', imgID);
				}
				// Add replaced image's classes to the new SVG
				if (typeof imgClass !== 'undefined') {
					$svg = $svg.attr('class', imgClass + ' replaced-svg');
				}

				// Remove any invalid XML tags as per http://validator.w3.org
				$svg = $svg.removeAttr('xmlns:a');

				// Replace image with new SVG
				$img.replaceWith($svg);

			}, 'xml');
		});
	</script>