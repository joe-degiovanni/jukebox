<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.flynntown.utils.DbUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	boolean success = DbUtils.testConnection("#{param.user}","#{param.pw}");
%>
<title>DB TEST</title>
</head>
<body>
success = <%= success %>
</body>
</html>