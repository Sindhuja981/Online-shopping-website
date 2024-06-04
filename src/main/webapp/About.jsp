<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-info navbar-dark.text-body">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">E-COMMERCE</a>
			<img class='navbar-brand round-circle' src='ShoppingImg.png' alt='img not found' width='70px' height='50px'></img>
			<div class="container-fluid">
				
				<div class="collapse navbar-collapse " id="collapsibleNavbar">
				
					<ul class="navbar-nav ">
						
						<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="About.jsp">About</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
						

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
	
	<div class='container-fluid mt-3'>
	<h2>What is an e-commerce website?</h2><br/>
		<p>Much like a traditional physical retail store, e-commerce websites allow consumers and businesses to 
		buy and sell to one another on a designated platform. The main difference between e-commerce and physical 
		commerce, however, is that e-commerce transactions occur entirely over the internet rather than at a 
		brick-and-mortar location.</p><br/><br/><br/>
	</div>
</body>
</html>