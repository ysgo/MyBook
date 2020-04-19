<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<tiles:insertAttribute name="head"/>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();">
	<tiles:insertAttribute name="script"/>
	<tiles:insertAttribute name="body"/>
</body>
</html>