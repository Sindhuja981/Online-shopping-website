<%@page import="com.example.model.product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page='../Header.jsp'></jsp:include>
</head>
<body>
<% 
	String productCode = request.getParameter("productCode");
	product Product = new product();
	Product.setProductCode(Integer.parseInt(productCode));
	Product = Product.getProductByCode();
%>
<div class="container mt-5">
  <h1 class="text-center">Edit Product</h1>
  <div class="card bg-light mt-4">
    <div class="card-body">
      <form method="post" action="/ECommerceProject/UpdateProductServlet">
        <div class="form-group mb-3">
          <label for="productCode">Product Code:</label>
          <input type="number" class="form-control" id="productCode" name="productCode" value="<%= Product.getProductCode() %>" readonly>
        </div>
        <div class="form-group mb-3">
          <label for="categoryName">Category Name:</label>
          <input type="text" class="form-control" id="categoryName" name="categoryName" value="<%= Product.getCategoryName() %>" required>
        </div>
        <div class="form-group mb-3">
          <label for="productName">Product Name:</label>
          <input type="text" class="form-control" id="productName" name="productName" value="<%= Product.getProductName() %>" required>
        </div>
        <div class="form-group mb-3">
          <label for="description">Description:</label>
          <input type="text" class="form-control" id="description" name="description" value="<%= Product.getDescription() %>" required>
        </div>
        <div class="form-group mb-3">
          <label for="discount">Discount:</label>
          <input type="number" class="form-control" id="discount" name="discount" value="<%= Product.getDiscount() %>" required>
        </div>
        <div class="form-group mb-3">
          <label for="cost">Cost:</label>
          <input type="number" class="form-control" id="cost" name="cost" value="<%= Product.getCost() %>" required>
        </div>
        <button type="submit" class="btn btn-primary">Update Product</button>
        <% 
          String res = request.getParameter("res");
          if (res != null) {
            if (res.equals("0")) {
              out.println("<h4 class='text-danger mt-3'>Not updated</h4>");
            } else {
              out.println("<h4 class='text-success mt-3'>Updated successfully</h4>");
            }
          }
        %>
      </form>
    </div>
  </div>
</div>
</body>
</html>
