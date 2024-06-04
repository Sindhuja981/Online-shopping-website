<%@page import="com.example.model.Rating"%>
<%@page import="com.example.model.product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../Header.jsp" />
</head>
<body>

    <% 
    String ratingId = request.getParameter("ratingId");
    Rating rating = new Rating();
	//rating.setRatingId(Integer.parseInt(ratingId));
	rating= rating.getRatingById(Integer.parseInt(ratingId));
	%>

<center><h2>EditRating...</h2></center>
		<div class='container card mt-3'>
		<form method='post' action='/ECommerceProject/UpdateRateingServlet'>
		<div class='card-body'>
		<div class='row'>
		<div class=col-sm-6>

		</div> 
		<div class=col-sm-12>
		<label><b>ratingId:</b></label>
		<span><input type="number" name='ratingId' class='form-control' value='<%=rating.getRatingId() %>'></span>	
		<label><b>ProductCode:</b></label>
		<span><%=rating.getProductCode()%></span></br>	
		<label><b>CustomerId:</b></label>
		<span><%=rating.getCustomerId()%></span></br>	
			
		<label><b>Rating:</b></label>
		<select class="form-control" name="rating" id='rating'>
		<option value="<%=rating.getRating()%>"><%=rating.getRating()%></option>
				<option value=""></option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">6</option>
		</select></br>
			<label><b>Comment:</b></label></br>	
			<textArea class='formControl' rows='5' cols='20' name='comment'><%=rating.getComment()%></textArea><br>		
			<button type="submit" class="btn btn-primary mt-3" >update RATING</button>
		</div>
		</div>
		</div>
		</form>
		</div>	
		
		

</body>
</html>