<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav id="sidebar">
	<div class="sidebar-header p-3">
		<a href="/" class="brand-logo">CHACKCHECK</a>
	</div>

	<ul class="list-unstyled components">
		<li>
			<form class="leftSideBar" action="/" method="GET">
				<input class="leftSideBarColor" type="submit" value="메인">
			</form>
		</li>
		<c:choose>
			<c:when test="${ !empty user }">
				<li class="active">
					<form class="leftSideBar" action="/books/readBook" method="GET">
						<a href="#bookSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
							<input class="leftSideBarColor" type="submit" value="내 서재">
						</a>
					</form>
					<ul class="collapse list-unstyled" id="bookSubmenu">
						<li>
							<form class="leftSideBar" action="/books/readBook" method="GET">
								<input class="leftSideBarColor" type="submit" value="읽은 책">
							</form>
						</li>
						<li>
							<form class="leftSideBar" action="/books/interestBook" method="GET">
								<input class="leftSideBarColor" type="submit" value="관심 책">
							</form>
						</li>
					</ul>
				</li>
				<li>
					<form class="leftSideBar" action="/users/myPage" method="GET">
						<input class="leftSideBarColor" type="submit" value="내 정보">
					</form>
				</li>
			</c:when>
			<c:otherwise>
				<li class="active">
					<form class="leftSideBar" action="/users/signIn" method="GET">
						<a href="#bookSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
								<input class="leftSideBarColor" type="submit" value="내 서재">
						</a>
					</form>
					<ul class="collapse list-unstyled" id="bookSubmenu">
						<li>
							<form class="leftSideBar" action="/users/signIn" method="GET">
								<input class="leftSideBarColor" type="submit" value="읽은 책">
							</form>
						</li>
						<li>
							<form class="leftSideBar" action="/users/signIn" method="GET">
								<input class="leftSideBarColor" type="submit" value="관심 책">
							</form>
						</li>
					</ul>
				</li>
				<li>
					<form class="leftSideBar" action="/users/signIn" method="GET">
						<input class="leftSideBarColor" type="submit" value="내 정보">
					</form>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>