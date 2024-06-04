<%@page import="com.example.model.product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>AddRating...</title>
<jsp:include page="../Header.jsp" />
</head>
<body>
	<% 
		
		String productCode=request.getParameter("productCode");
		product Product = new product();
		Product.setProductCode(Integer.parseInt(productCode));
		Product=Product.getProductByCode();
	%>

<center><h2>AddRating...</h2></center>
		<div class='container card mt-3'>
		<form method='post' action='/ECommerceProject/AddRatingServlet'>
		<div class='card-body'>
		<div class='row'>
		<div class=col-sm-6>
		<span><img src='../uploads/<%=Product.getProductImage1()%>' /></span>
			
			
		</div> 
		<div class=col-sm-6>
		<label><b>ProductCode:</b></label>
		<span><%=Product.getProductCode()%></span></br>
		
		<input type='hidden' class='formControl' name='productCode' value='<%=Product.getProductCode()%>'/>
		<label><b>ProductName:</b></label>
		<span><%=Product.getProductName()%></span></br>
		<label><b>Description:</b></label>
		<span><%=Product.getDescription()%></span></br>
		<label><b>Rating:</b></label>
		<select class="form-control" name="rating" id='rating'>
				<option value=""></option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">6</option>
		</select></br>
		<label><b>Comment:</b></label>
		<textArea class='formControl' rows='5' cols='20' name='comment'></textArea><br>		
		<button type="submit" class="btn btn-primary mt-3" >Add RATING</button>
		</div>
		</div>
		</div>
		</form>
		</div>		
</body>
</html>