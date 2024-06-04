<%@page import="java.util.List"%>
<%@page import="com.example.model.Invoices"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Status</title>
<jsp:include page="../Header.jsp" />
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row">
    <%
			//for vewing in the tble code 
			Invoices  invoice = new Invoices();

			List<Invoices> invoiceList = invoice.getAllInvoices();
		
			%>
    
        <div class="col-sm-12">
            <h1 class="text-center bg-info text-white mt-5">Payment Status</h1>
            <div class="table-responsive">
                <table class="table table-bordered table-hover mt-3" id='table_id'>
                    <thead class='table-dark'>
                        <tr>
                            <th scope="col">SLNO</th>
                            <th scope="col">Invoice Number</th>
                            <th scope="col">Order Id</th>
                            <th scope="col">Invoice Amount</th>
                            <th scope="col">Invoice Date</th>
                            <th scope="col">Invoice Type</th>
                            <th scope="col">Card Number</th>
                            <th scope="col">Card Type</th>
                            <th scope="col">Payment Status</th>
                        </tr>
                    </thead>
                    <tbody class='table-info'>
                        <%
                        int slno = 0;
                        for (Invoices invoiceOb : invoiceList) {
                        %>
                        <tr>
                            <td class="text-center"><%=slno++%></td>
                            <td class="text-center"><%=invoiceOb.getInvoiceNumber()%></td>
                            <td class="text-center"><%=invoiceOb.getOrderId()%></td>
                            <td class="text-center"><%=invoiceOb.getInvoiceAmount()%></td>
                            <td class="text-center"><%=invoiceOb.getInvoiceDate()%></td>
                            <td class="text-end"><%=invoiceOb.getInvoiceType()%></td>
                            <td class="text-end"><%=invoiceOb.getCardNumber()%></td>
                            <td class="text-end"><%=invoiceOb.getCardType()%></td>
                            <td class="text-end"><%=invoiceOb.getPaymentStatus()%></td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../footer.jsp" />
<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
