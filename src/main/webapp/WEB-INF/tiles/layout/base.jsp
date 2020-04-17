<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<tiles:insertAttribute name="head" />
</head>
<style>
#userNameCss {
	font-weight: bold;
	border: none;
	background-color: #58C9B9;
	color: #fff;
}
#kyoboImg, #interparkImg, #aladinImg, #yes24Img {
	width: 178px;
	height: 65px;
}
</style>
<body>
<div class="wrapper">
	<tiles:insertAttribute name="logo"/>
	<tiles:insertAttribute name="sidebar"/>
	<tiles:insertAttribute name="script"/>
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="login"/>
</div>
</body>
</html>