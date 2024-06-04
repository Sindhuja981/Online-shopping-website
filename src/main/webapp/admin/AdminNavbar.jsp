<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dropdown Example</title>


<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-TpCbqN6Fw2hej6DflCTzpkJyX14+Xr3NsIZWU+u8Tu7i7wKpZBuDm7bIk9tPt+fPkrDg0ojFhpc+azlr0ovRQw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Bootstrap JS bundle (includes Popper) -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-2L5wJ8kq38eAMkGqDpSOc6Ff1fAWIkCG71b45OPWahFujnJ+41v3QSkpr3a/v5yI"
	crossorigin="anonymous"></script>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light"
		style="background-image: url('../bg4.jpg'); background-size: cover;">
		<div class="container-fluid">
			<!-- Logo -->
			<a class="navbar-brand" href="#"> <img src="../logo2.jpg"
				alt="logo" class="nav_logo"
				style="width: 80px; height: 80px; border-radius: 50%; overflow: hidden;">
			</a>

			<!-- Toggle button -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar items and search bar -->
			<div class="collapse navbar-collapse justify-content-between"
				id="navbarNav">
				<ul class="navbar-nav" style="flex-grow: 1;">
					<li class="nav-item"><a class="nav-link"
						href="AdminHomejsp.jsp" style="color: white; font-weight: bold;">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false"
						style="color: white; font-weight: bold;">Category</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown"
							style="background-image: url('../bg4.jpg'); background-size: cover;">
							<li><a class="dropdown-item" href="Category.jsp"
								style="color: dark; font-weight: bold;">Add</a></li>
							<li><a class="dropdown-item" href="ViewCategory.jsp"
								style="color: dark; font-weight: bold;">View</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false"
						style="color: white; font-weight: bold;">Products</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown"
							style="background-image: url('../bg4.jpg'); background-size: cover;">
							<li><a class="dropdown-item" href="AddProduct.jsp"
								style="color: dark; font-weight: bold;">Add</a></li>
							<li><a class="dropdown-item" href="ViewProduct.jsp"
								style="color: dark; font-weight: bold;">View</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false"
						style="color: white; font-weight: bold;">Employee</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown"
							style="background-image: url('../bg4.jpg'); background-size: cover;">
							<li><a class="dropdown-item" href="AddEmployee.jsp"
								style="color: dark; font-weight: bold;">Add</a></li>
							<li><a class="dropdown-item" href="ViewEmployee.jsp"
								style="color: dark; font-weight: bold;">View</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link"
						href="CustomerView.jsp" style="color: white; font-weight: bold;">Customer</a></li>
					<li class="nav-item"><a class="nav-link"
						href="AdminOrders.jsp" style="color: white; font-weight: bold;">Orders</a></li>
					<li class="nav-item"><a class="nav-link" href="Invoices.jsp"
						style="color: white; font-weight: bold;">Invoices</a></li>
					<li class="nav-item"><a class="nav-link"
						href="AdminRating.jsp" style="color: white; font-weight: bold;">Reviews</a></li>
					<li class="nav-item"><a class="nav-link" href="Logout.jsp"
						style="color: white; font-weight: bold;">Logout</a></li>


				</ul>
				<!-- Search bar -->
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search" style="color: dark; font-weight: bold;">
					<button class="btn btn-outline-light" type="submit"
						style="color: Dark; font-weight: bold;">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>
		</div>
	</nav>

</body>
</html>