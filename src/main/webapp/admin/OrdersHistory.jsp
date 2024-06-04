<%@page import="com.example.model.Rating"%>
<%@page import="com.example.model.product"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.CustomerOrders"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <meta charset="ISO-8859-1">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function confirm_delete(orderId) {
            let ans = confirm("Do you want to cancel this record?");
            if (ans) {
                window.location = "/ECommerceProject/updateOrderStatusServlet?n=1&orderId=" + orderId + "&orderStatus=cancel";
            }
        }
    </script>
</head>
<body>
	<jsp:include page="CustomerNavbar.jsp" />
    <%
        CustomerOrders Corders = new CustomerOrders();
        int customerId = (int) session.getAttribute("customerId");
        List<CustomerOrders> ListOrders = Corders.getAllCustomerOrders();
        System.out.print("ListOrders=" + ListOrders.size());
    %>
    <h2 class="text-center text-danger mt-2">CART HISTORY</h2>
    <div class="container">
        <form name='f1' method='POST' action="/ECommerceProject/UpdateOrderStatusServlet">
            <div class='row'>
                <div class='col-md-12'>
                    <div class='table-responsive'>
                        <table class="table table-hover table-bordered mt-4">
                            <thead class="table-dark">
                                <tr class="text-center">
                                    <th>Order Id</th>
                                    <th>Customer Id</th>
                                    <th>Invoice No</th>
                                    <th>Product code</th>
                                    <th>Product Image</th>
                                    <th>Product Name</th>
                                    <th>Order Date</th>
                                    <th>Cost</th>
                                    <th>Discount Amount</th>
                                    <th>Quantity</th>
                                    <th>GST Amount</th>
                                    <th>Bill Amount</th>
                                    <th>Status</th>
                                    <th>Operation</th>
                                    <th>Operation</th>
                                </tr>
                            </thead>
                            <tbody style="background-color:#8BED4B;">
                                <%
                                    product Product = new product();
                                    for(CustomerOrders CordersOb : ListOrders ){
                                %>
                                <tr class="text-center">
                                    <td><%= CordersOb.getOrderId() %></td>
                                    <td><%= CordersOb.getCustomerId() %></td>
                                    <td><%= CordersOb.getInvoiceNumber() %></td>
                                    <td><%= CordersOb.getProductCode() %></td>
                                    <%
                                        Product.setProductCode(CordersOb.getProductCode());
                                        Product = Product.getProductByCode();
                                    %>
                                    <td><img src='../uploads/<%= Product.getProductImage1() %>' style='width:100px;height:100px; object-fit:contain;'/></td>
                                    <td><%= Product.getProductName() %></td>
                                    <td class="text-end"><%= CordersOb.getOrderDateTime() %></td>
                                    <td class="text-end"><%= CordersOb.getCost() %></td>
                                    <td class="text-end"><%= CordersOb.getDiscountAmount() %></td>
                                    <td class="text-end"><%= CordersOb.getQuantity() %></td>
                                    <td class="text-end"><%= CordersOb.getGstAmount() %></td>
                                    <td class="text-end"><%= CordersOb.getBillAmount() %></td>
                                    <td class="text-end"><%= CordersOb.getOrderStatus() %></td>
                                    <td>
                                        <%
                                            if (CordersOb.getOrderStatus().toString().equalsIgnoreCase("pending")) {
                                        %>
                                        <input type="button" value='Cancel' class="btn btn-sm btn-danger" onclick="confirm_delete(<%= CordersOb.getOrderId() %>)">
                                        <%
                                            }
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            Rating rating = new Rating();
                                            boolean found = rating.isRatingGiven(customerId, CordersOb.getProductCode());
                                            if (!found) {
                                        %>
                                        <a href="/ECommerceProject/admin/AddRating.jsp?productCode=<%= CordersOb.getProductCode() %>" class='btn btn-sm btn-info'>Rate</a>
                                        <%
                                            }
                                        %>
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
        </form>
    </div>
    
    <div class="mt-5">
	<jsp:include page='../footer.jsp'></jsp:include>
	</div>
</body>
</html>
