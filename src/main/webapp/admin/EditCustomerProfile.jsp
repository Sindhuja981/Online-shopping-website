<%@page import="com.example.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page='../Header.jsp'></jsp:include>
</head>
<body>


<form action="/ECommerceProject/UpdateCustomerDataServlet"
			method="post" >
			
			

	<div class="container mt-4">
		
				<div class="card w-100 mx-auto border-warning border-4 bg-light text-dark"
					style="max-width: none;">
					<div class="card-body">
						<h2 class="card-title text-center mb-4">Edit Profile</h2>

						<%
						String res = request.getParameter("res");
						if (res != null) {
							if (res.equals("1")) {
						%>
						<div class="alert alert-success alert-dismissible" id='success_id'>
							<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
							<strong>Success!</strong> *Updated ..!
						</div>
						<%
						} else if (res.equals("0")) {
						%>
						<div class="alert alert-danger alert-dismissible" id='success_id'>
							<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
							<strong>Success!</strong> *Account not Updated..!
						</div>
						<%
						}
						}
						%>
						<%
						String customerId = request.getParameter("customerId");
						System.out.println("customerId2222222="+customerId);
						Customer customer = new Customer();
						customer.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
						customer = customer.getCustomerProfileById();
					
						%>


						<div class="row">
							<div class="col-md-6 mx-auto">
								
									<label for="customerId" class="form-label fw-bold">Customer
										Id :</label> 
										<input type="text" class="form-control" id="customerId"
										name="customerId" value='<%=customer.getCustomerId()%>'
										placeholder="Enter your customerId">
	

								
									<label for="firstName" class="form-label fw-bold">First
										Name:</label> <input type="text" class="form-control" id="firstName"
										name="firstName" value='<%=customer.getFirstName()%>'
										placeholder="Enter your first name">
								
							</div>

							<div class="col-md-6 mx-auto">
								
									<label for="lastName" class="form-label fw-bold">Last
										Name:</label> <input type="text" class="form-control" id="lastName"
										name="lastName" value='<%=customer.getLastName()%>'
										placeholder="Enter your last name">
								

								
									<label for="mobileNumber" class="form-label fw-bold">Mobile
										Number:</label> <input type="text" class="form-control"
										id="mobileNumber" name="mobileNumber"
										value='<%=customer.getMoblieNumber() %>'
										placeholder="Enter your mobile number">
								
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mx-auto">
								
									<label for="emailId" class="form-label fw-bold">Email
										Id:</label> <input type="text" class="form-control" id="emailId"
										name="emailId" value='<%=customer.getEmailid() %>'
										placeholder="Enter your E-mail">
								
							</div>

							<div class="col-md-6 mx-auto">
								
									<label for="password" class="form-label fw-bold">Password:</label>
									<input type="password" class="form-control" id="password"
										name="password" value='<%=customer.getPassword()%>'
										placeholder="Enter your Password">
								
								
									<label for="registerDate" class="form-label fw-bold">Register
										Date:</label> <input type="Date" class="form-control"
										id="registerDate" name="registerDate"
										value='<%=customer.getRegisterDate()%>'
										placeholder="Enter your registerDate">
								
							</div>
						</div>
						<div class="text-center mt-2">
							<input type="submit" name="submit" class="btn btn-info" value="Upload">
						</div>
					</div>
				</div>
		</form>
	</div>

</body>
</html>