<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.flynntown.utils.DbUtils"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
    Map<String, String[]> params = request.getParameterMap();
	boolean success = DbUtils.testConnection(params.get("user")[0],params.get("pw")[0]);
%>
<title>DB TEST</title>
</head>
<body>
success = <%= success %>
</body>
</html>