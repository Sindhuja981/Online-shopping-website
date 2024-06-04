<%@ page import="java.util.List"%>
<%@ page import="com.example.model.product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <jsp:include page='../Header.jsp'></jsp:include>
  
  <script type="text/javascript">
    function confirm_delete(productCode) {
      let ans = confirm("Do you want to delete this record?");
      if (ans) {
        window.location = "/ECommerceProject/DeleteProductServlet?productCode=" + productCode;
      }
    }
  </script>
  
</head>
<body>
  <div class="container mt-3">
    <%
      product Product = new product();
      List<product> productList = Product.getAllProducts(null);
    %>

    <div class="container">
      <%
        String res = request.getParameter("res");
        if (res != null) {
          if (res.equals("1")) {
      %>
      <div class="alert alert-success alert-dismissible" id="success-id">
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <strong>Success!</strong> Record updated.
      </div>
      <%
          } else if (res.equals("0")) {
      %>
      <div class="alert alert-danger alert-dismissible" id="success-id">
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <strong>Error!</strong> Record not updated.
      </div>
      <%
          }
        }
      %>

      <h2>Product Records</h2>
      <div class="table-responsive">
        <table class="table table-striped" id="table_id">
          <thead>
            <tr>
              <th>Operations</th>
              <th>Operations</th>
              <th>Slno</th>
              <th>Product Code</th>
              <th>Category Name</th>
              <th>Product Name</th>
              <th>Description</th>
              <th>Discount</th>
              <th>Cost</th>
              <th>Product Image 1</th>
              <th>Product Image 2</th>
              <th>Product Image 3</th>
            </tr>
          </thead>
          <tbody>
            <%
              int Slno = 0;
              for (product ProductOb : productList) {
                Slno++;
            %>
            <tr>
              <td>
                <a href="javascript:void(0);" onclick="confirm_delete(<%= ProductOb.getProductCode() %>)" class="btn btn-sm btn-danger">Delete</a>
              </td>
              <td>
                <a href="/ECommerceProject/admin/EditProduct.jsp?productCode=<%= ProductOb.getProductCode() %>" class="btn btn-sm btn-info">Edit</a>
              </td>
              <td><%= Slno %></td>
              <td><%= ProductOb.getProductCode() %></td>
              <td><%= ProductOb.getCategoryName() %></td>
              <td><%= ProductOb.getProductName() %></td>
              <td><%= ProductOb.getDescription() %></td>
              <td><%= ProductOb.getDiscount() %></td>
              <td><%= ProductOb.getCost() %></td>
              <td>
                <a href="EditImg.jsp?tableName=products&setColName=productImage1&whereColName=productCode&conditionValue=<%= ProductOb.getProductCode() %>&colName=productImage1">
                  <img src="../uploads/<%= ProductOb.getProductImage1() %>" style="width:100px;height:100px">
                </a>
              </td>
              <td>
                <a href="EditImg.jsp?tableName=products&setColName=productImage2&whereColName=productCode&conditionValue=<%= ProductOb.getProductCode() %>&colName=productImage2">
                  <img src="../uploads/<%= ProductOb.getProductImage2() %>" style="width:100px;height:100px">
                </a>
              </td>
              <td>
                <a href="EditImg.jsp?tableName=products&setColName=productImage3&whereColName=productCode&conditionValue=<%= ProductOb.getProductCode() %>&colName=productImage3">
                  <img src="../uploads/<%= ProductOb.getProductImage3() %>" style="width:100px;height:100px">
                </a>
              </td>
            </tr>
            <%
              }
            %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  
  <script>
    $(document).ready(function() {
      $('#table_id').DataTable();
    });
  </script>
</body>
</html>
