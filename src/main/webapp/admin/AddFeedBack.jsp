<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../Header.jsp" />
</head>

<body>
	<center><h2 class='mt-5'>Add FeedBack</h2></center>
	<form method='post' action='/ECommerceProject/AddFeedBackServlet'>
	<center>
	<div class='container card mt-5'>
	<div class='card-body'>
	<div class='row'>
	<div class='col-sm-8'>
	<label for="customerQuery" class="fw-bold">Customer Query</label>
  		<select class="form-control" id="CustomerQuery" name="CustomerQuery">
        	<option value="">Select Query</option>
            <option value="How can I help?">How can I help?</option>
            <option value="Could you give me some background about the issue?">Could you give me some background about the issue?</option>
            <option value="Issue About the delivery date or Address?">Issue About the delivery date or Address?</option>
            <option value="Other">Other</option>
        </select><br>
        <div class='row'>
                    <div class='col-sm-8'>
                        <label for='feedback' class="fw-bold">FeedBack</label>
                        <textarea class="form-control" rows="3" cols="10" name="feedback"></textarea>
                    </div>
                </div><br/>
	                <button type="submit" class="btn btn-primary ">SUBMIT</button>
	</div>
	</div>
	</div>
	</div>
	</center>
	</form>
</body>
</html>