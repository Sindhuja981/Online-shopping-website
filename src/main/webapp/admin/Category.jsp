<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Add Category</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
 <jsp:include page='AdminNavbar.jsp'></jsp:include>
<div class="container mt-5">
  <h1 class="text-center mb-4">Add Category</h1>
  <div class="card">
    <div class="card-body">
      <form method="post" action="/ECommerceProject/AddCategoryServlet">
        <div class="mb-3">
          <label for="categoryName" class="form-label">Category Name:</label>
          <input type="text" class="form-control" id="categoryName" name="categoryName" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Category</button>
      </form>
    </div>
  </div>
</div>
<div class="mt-5"> 
 <jsp:include page='../footer.jsp'></jsp:include>
</div>
</body>
</html>
