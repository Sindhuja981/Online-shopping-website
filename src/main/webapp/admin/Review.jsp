<%@page import="java.util.List"%>
<%@page import="com.example.model.Rating"%>
<%@page import="com.example.model.product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color: #f8f9fa;">
    <form action="/ECommerceProject/AddRatingsServlet" method="post">
        <div class="container mt-5">
            <% 
                String productCode = request.getParameter("productCode");
                product Product = new product();
                Product.setProductCode(Integer.parseInt(productCode));
                Product = Product.getProductByCode();
            %>
            <center>
                <div class="card border-danger border-2 shadow" style="width: 50%; background-color: #fff;">
                    <div class="card-body">
                        <h1 class="card-title text-bold text-center" style="color: #2C3E50; font-family: 'Protest Guerilla', cursive;">Product</h1>
                        <div class="row mt-2">
                            <div class="col-sm-4">
                                <img src='../uploads/<%= Product.getProductImage1() %>' class='card-img-top' alt='Product Image' style="width:200px; height:150px"/>
                            </div>
                            <div class="col-sm-8">
                                <p class="card-text">ProductName: <%=Product.getProductName()%></p>
                                <p class="card-text">Cost: <%=Product.getCost()%></p>
                                <p class="card-text">Discount: <%=Product.getDiscount()%></p>
                                <p class="card-text">Description: <%=Product.getDescription()%></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mt-5 mx-auto" style="width: 50%; background-color: #fff;">
                    <div class="card-body">
                        <h1 class="card-title text-bold text-center" style="color:#7A035D;font-weight: bold;font-family: 'Protest Guerilla', cursive;">Ratings</h1>
                        <div class="col-sm-12">
                            <%
                                Rating rating = new Rating();
                                List<Rating> ratingList = rating.getRatingsByProductCode(Integer.parseInt(productCode));
                            %>
                            <%
                                for(Rating ratingsOb :ratingList){
                            %>
                                    <p class="card-text text-danger font-weight-bold">Rating: <%=ratingsOb.getRating()%></p>
                                    <p class="card-text text-danger font-weight-bold">Comments: <%=ratingsOb.getComment()%></p>
                                    <hr>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </center>
        </div>
    </form>
</body>
</html>