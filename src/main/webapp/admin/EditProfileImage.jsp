<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page='../Header.jsp'></jsp:include>
</head>
<body>
<center>
<form action="/ECommerceProject/UploadCustomerImageServlet" method='post' enctype='multipart/form-data'>
		<div class='container mt-3 card bg-success'>
			<h3 class='text-info'>Edit Image</h3>			
			
			<input type='hidden' name='tableName' value='<%=request.getParameter("tableName")%>'>
			<input type='hidden' name='setColName' value='<%=request.getParameter("setColName")%>'>
			<input type='hidden' name='whereColName' value='<%=request.getParameter("whereColName")%>'>
			<input type='hidden' name='conditionValue' value='<%=request.getParameter("conditionValue")%>'>
			<br>
			<div class='row' >
				<div class='col-sm-6'>
					<input type='file' class='form-control' name='image1'> <br><br>
				</div>
			</div>
	
			<div class='row' >
				<div class='col-sm-3 mb-3'>
					<input type='submit' class='form-control btn btn-md btn-outline-primary' style='width:150px' value='Upload Img' name='submit'> 
				</div>
			</div>
			
		</div>
	
	</form>
</center>

</body>
</html>