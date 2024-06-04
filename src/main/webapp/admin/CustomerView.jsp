<%@page import="java.util.List"%>
<%@page import="com.example.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page='../Header.jsp'></jsp:include>
<script type="text/javascript">
  function confirm_delete(customerId){
    let ans = confirm("Do you want to delete this record?");
    if(ans){
      window.location ="/ECommerceProject/DeletecustomerServlet?customerId="+ customerId;
    }
  }
</script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-3">
  <h2>Customer Records</h2>
  <%
		Customer customer = new Customer();
		List<Customer> customerList = customer.getAllCustomers();
	%>
  <div class="table-responsive">
    <table class="table table-striped" id="table_id1">
      <thead>
        <tr>
          <th>Slno</th>
          <th>Customer Id</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Mobile Number</th>
          <th>Email Id</th>
          <th>Password</th>
          <th>Profile Pic</th>
          <th>Registration Date</th>
          <th>Operations</th>
        </tr>
      </thead>
      <tbody>
        <% 
          int Slno = 0;
          for (Customer customer2 : customerList){
            Slno++;
        %>
        <tr>
          <td><%=Slno %></td>
          <td><%=customer2.getCustomerId()%></td>
          <td><%=customer2.getFirstName() %></td>
          <td><%=customer2.getLastName()%></td>
          <td><%=customer2.getMoblieNumber()%></td>
          <td><%=customer2.getEmailid() %></td>
          <td><%=customer2.getPassword() %></td> 
          <td><img src='../uploads/<%=customer2.getProfilePic()%>' style='width:100px;height:100px'></td>
          <td><%=customer2.getRegisterDate() %></td>
          <td><a href="javascript:void(0)" onclick="confirm_delete('<%=customer2.getCustomerId()%>')" class='btn btn-sm btn-danger'>Delete</a></td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </div>
</div>
<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
  $(document).ready(function(){
    $('#table_id1').DataTable();
  });
</script>
</body>
</html>
