<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- left Sidebar 시작 -->
<nav id="sidebar">
	<div class="sidebar-header p-3">
		<a href="${pageContext.request.contextPath}/" class="brand-logo">	CHACKCHECK </a>
	</div>

	<ul class="list-unstyled components">
		<li>
			<form id="leftSideBar" action="${pageContext.request.contextPath}/" method="GET">
				<input id="leftSideBarColor" type="submit" value="메인">
			</form>
		</li>
		<c:choose>
			<c:when test="${ !empty status }">
				<li class="active">
					<form id="leftSideBar" action="readBook" method="GET">
						<a href="#bookSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
							<input id="leftSideBarColor" type="submit" value="내 서재">
						</a>
					</form>
					<ul class="collapse list-unstyled" id="bookSubmenu">
						<li>
							<form id="leftSideBar" action="readBook" method="GET">
								<input id="leftSideBarColor" type="submit" value="읽은 책">
							</form>
						</li>
						<li>
							<form id="leftSideBar" action="interestBook" method="GET">
								<input id="leftSideBarColor" type="submit" value="관심 책">
							</form>
						</li>
					</ul>
				</li>
				<li>
					<form id="leftSideBar" action="myPage" method="GET">
						<input id="leftSideBarColor" type="submit" value="내 정보">
					</form>
				</li>

				<!-- admin jsp 페이지 추가 -->
				<c:if test="${ empty admin }">
					<li>
						<form id="leftSideBar" action="admin" method="GET">
							<input id="leftSideBarColor" type="submit" value="관리자">
						</form>
					</li>
				</c:if>
			</c:when>
			<c:otherwise>
				<li class="active">
					<form id="leftSideBar" action="signIn" method="GET">
						<a href="#bookSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
								<input id="leftSideBarColor" type="submit" value="내 서재">
						</a>
					</form>
					<ul class="collapse list-unstyled" id="bookSubmenu">
						<li>
							<form id="leftSideBar" action="signIn" method="GET">
								<input id="leftSideBarColor" type="submit" value="읽은 책">
							</form>
						</li>
						<li>
							<form id="leftSideBar" action="signIn" method="GET">
								<input id="leftSideBarColor" type="submit" value="관심 책">
							</form>
						</li>
					</ul>
				</li>
				<li>
					<form id="leftSideBar" action="signIn" method="GET">
						<input id="leftSideBarColor" type="submit" value="내 정보">
					</form>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>
<!-- left Sidebar 끝 -->