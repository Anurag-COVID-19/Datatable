<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" 
		   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link href="<c:url value="/resources/images/techno.png" />" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/loginstyle.css" />" rel="stylesheet" type="text/css">
<title>Login</title>
</head>
<body>
	<div id="login-form-wrap">
		<h2>Login</h2>
		<form id="login-form">
			<p><input type="text" id="username" name="username" placeholder="Username"><i class="validation">
			<span></span><span></span></i></p>
			<p><input type="email" id="email" name="email" placeholder="Email Address"><i class="validation">
			<span></span><span></span></i></p>
			<p><input type="submit" id="login" value="Login"></p>
		</form>
		<div id="create-account-wrap">
			<p>Not a member? <a href="#">Create Account</a><p>
		</div>
	</div>
</body>
</html>