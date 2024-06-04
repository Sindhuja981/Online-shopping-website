<%@page import="com.example.model.product"%>
<%@page import="com.example.model.Rating"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.CustomerOrders"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../Header.jsp" />
    
    <script>
        function confirm_update(orderId, OrderStatus) {
            let ans = confirm("Do you want to dispatch this Order?");
            if (ans) {
                window.location = "/ECommerceProject/updateOrderStatusServlet?n=2&orderId=" + orderId + "&orderStatus=Dispatch";
            }
        }
    </script>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
    
    CustomerOrders  Corders = new CustomerOrders();
    List<CustomerOrders> ListOrders = Corders.getAllCustomerOrders();
%>
<h2 class="text-center text-danger mt-2">Admin Orders History</h2>
<div class="container mt-3">
    <div class='table-responsive'>
        <table class="table table-hover table-bordered table-responsive mt-4" id="table_id">
            <thead class="table-dark">
                <tr class="text-center">
                    <th>Order Id</th>
                    <th>Customer Id</th>
                    <th>Invoice No</th>
                    <th>Product code</th>
                    <th>Product Name</th>
                    <th>Product Image</th>
                    <th>Order Date</th>
                    <th>Cost</th>
                    <th>Discount Amount</th>
                    <th>Quantity</th>
                    <th>GST Amount</th>
                    <th>Bill Amount</th>
                    <th>Status</th>
                    <th>Operation</th>
                </tr>
            </thead>
            <tbody style="background-color:#8BED4B;">
                <%
                product Product = new product();
                for(CustomerOrders CordersOb : ListOrders ){
                %>
                <tr>
                    <td class="text-center"><%=CordersOb.getOrderId()%></td>
                    <td class="text-center"><%=CordersOb.getCustomerId()%></td>
                    <td class="text-center"><%=CordersOb.getInvoiceNumber()%></td>
                    <td class="text-center"><%=CordersOb.getProductCode()%></td>
                    <%
                    Product.setProductCode(CordersOb.getProductCode());
                    Product = Product.getProductByCode();
                    %>
                    <td class="text-center"><%=Product.getProductName()%></td>
                    <td class="text-center"><img src='../uploads/<%=Product.getProductImage1()%>' style='width:100px;height:100px;'/></td>
                    <td class="text-end"><%=CordersOb.getOrderDateTime()%></td>
                    <td class="text-end"><%=CordersOb.getCost()%></td>
                    <td class="text-end"><%=CordersOb.getDiscountAmount()%></td>
                    <td class="text-end"><%=CordersOb.getQuantity()%></td>
                    <td class="text-end"><%=CordersOb.getGstAmount()%></td>
                    <td class="text-end"><%=CordersOb.getBillAmount()%></td>
                    <td class="text-end"><%=CordersOb.getOrderStatus()%></td>
                    <td>
                        <%
                        if(CordersOb.getOrderStatus().equalsIgnoreCase("pending")){
                        %>
                        <input type="button" value='Update' class='btn btn-success' onclick="confirm_update(<%=CordersOb.getOrderId()%>)">
                        <% } %>
                    </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function(){
        $('#table_id').DataTable();
    });
</script>
</body>
</html>
