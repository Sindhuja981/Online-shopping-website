<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	session.invalidate();
	%>

	<center>
		<h1 style="color: green;">You have been successfully logged out</h1>

		<button type="button" class="btn btn-outline-danger float-left"
			onclick="window.location.href='../Index.jsp'">Back to Index
			page</button>
	</center>

</body>
</html>