<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page='../Header.jsp'></jsp:include>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-info navbar-dark.text-body">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"></a>
			
			<div class="container-fluid">
				
				<div class="collapse navbar-collapse " id="collapsibleNavbar">
				
					<ul class="navbar-nav ">
						
						<li class="nav-item"><a class="nav-link" href="Index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="About.jsp">About</a></li>
						<li class="nav-item"><a class="nav-link" href="Contactjsp.jsp">Contact</a></li>
						

						<li class="nav-item dropdown "><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown">Login</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item bg-secondary " href="#">Store</a></li>
								<li><a class="dropdown-item bg-secondary" href="#">Customer</a></li>
							</ul></li>
					</ul>

				</div>


			</div>
		</div>
	</nav>
	

<div class="container mt-2">
<div class='card'>
<div class='card-body '>
<form method='post' action='/ECommerceProject/CustomerLoginValidation'>
    <h2>Customer Login </h2>
    <img  src='Customer_login.png' class='align-center' style="'width:50px' height:50px"><br><br>
	email id: <input type="email" size='40' name='emailId' class='form-control' required></br></br>
	Password: <input type="password" size='20' name='password' class='form-control' required></br></br>
	
	<A href='NewCustomerlogin.jsp'>New Registation...?</A><br><br>
	
	<input type="submit" size='20' name='submit' value='sign in'>
	</form>
</div>
</div>
</div>
</body>
</html>