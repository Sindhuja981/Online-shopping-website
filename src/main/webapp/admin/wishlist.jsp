<%@page import="com.example.model.wishlist"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <!-- Bootstrap CSS -->
		    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-TpCbqN6Fw2hej6DflCTzpkJyX14+Xr3NsIZWU+u8Tu7i7wKpZBuDm7bIk9tPt+fPkrDg0ojFhpc+azlr0ovRQw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Bootstrap JS bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-2L5wJ8kq38eAMkGqDpSOc6Ff1fAWIkCG71b45OPWahFujnJ+41v3QSkpr3a/v5yI" crossorigin="anonymous"></script>

</head>
<body>
	
	<jsp:include page='CustomerNavbar.jsp'></jsp:include>
	<center><h2 style="color:red;"><b>Wishlist</b></h2></center>

	<%
	    wishlist wlist=new wishlist();
	    List<product> ListProducts=wlist.getAllWishlistProductsByCustomerId((int)session.getAttribute("customerId"));
	    System.out.println("n = " + ListProducts.size());
    %>


	<div class="container mt-4">
    <div class="row">
        <%
        int slno = 0;
        for (product productOb : ListProducts) {
        %>
        <div class="col-sm-6 col-md-4 col-lg-3 mt-2">
            <div class="card" style="background-color: #f0f0f0;">
                <img src="../uploads/<%=productOb.getProductImage1()%>"
                    class="img-thumbnail mx-auto d-block" alt="notfound"
							style="width: 260px; height: 180px">
                <div class="card-body" style="height: 150px; overflow:hidden;">
                    <h5 class="card-title" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><%=productOb.getProductName()%></h5>
                    <p class='card-text'><%=productOb.getDescription()%></p>
                    <p class="card-text">
                        <strong>Cost:</strong> <%=productOb.getCost()%>
                    </p>
                </div>
                <div class="card-footer">
                    <a href='/ECommerceProject/DeleteFromWishListServlet?productCode=<%=productOb.getProductCode()%>' class='btn btn-danger btn-sm float-start'>Delete</a>
                    <a href='/ECommerceProject/AddToCartServlet?productCode=<%=productOb.getProductCode()%>' class='btn btn-primary btn-sm float-end'>Add to Cart</a>                    
                </div>
            </div>
        </div>
        <%
        }
        %>
    </div>
</div>
	
	<div class="mt-5">
	<jsp:include page='../footer.jsp'></jsp:include>
	</div>
</body>
</html>