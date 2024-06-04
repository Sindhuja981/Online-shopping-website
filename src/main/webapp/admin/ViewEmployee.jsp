<%@ page import="java.util.List"%>
<%@ page import="com.example.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page='../Header.jsp'></jsp:include>

<script type="text/javascript">
  function confirm_delete(employeeId) {
    let ans = confirm("Want to delete this record?");
    if (ans) {
      window.location = "/ECommerceProject/DeleteEmployeeServlet?employeeId=" + employeeId;
    }
  }
</script>

</head>
<body>
  <div class="container mt-5">
    <h2 class="text-center text-danger">Employee Records</h2>
    
    <%
      Employee employee = new Employee();
      List<Employee> employeeList = employee.getAllEmployees();
    %>

    <%
      String res = request.getParameter("res");
      if (res != null) {
        if (res.equals("1")) {
    %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
      <strong>Success!</strong> Record Updated.
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
      } else if (res.equals("0")) {
    %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      <strong>Error!</strong> Record not Updated.
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <%
      }
    }
    %>
    
    <div class="table-responsive">
      <table class="table table-striped table-hover table-bordered mt-4" id="table_id">
        <thead class="table-dark">
          <tr class="text-center">
            <th>Sl No</th>
            <th>Employee ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Gender</th>
            <th>Mobile</th>
            <th>Email ID</th>
            <th>Designation</th>
            <th>Password</th>
            <th>Delete</th>
            <th>Edit</th>
          </tr>
        </thead>
        <tbody>
          <%
            int Slno = 0;
            for (Employee employeeOb : employeeList) {
              Slno++;
          %>
          <tr>
            <td class="text-center"><%= Slno %></td>
            <td class="text-center"><%= employeeOb.getEmployeeId() %></td>
            <td class="text-center"><%= employeeOb.getFirstName() %></td>
            <td class="text-center"><%= employeeOb.getLastName() %></td>
            <td class="text-center"><%= employeeOb.getGender() %></td>
            <td class="text-center"><%= employeeOb.getMobile() %></td>
            <td class="text-center"><%= employeeOb.getEmailId() %></td>
            <td class="text-center"><%= employeeOb.getDesignation() %></td>
            <td class="text-center"><%= employeeOb.getPassword() %></td>
            <td class="text-center">
              <a href="/ECommerceProject/DeleteEmployeeServlet?employeeId=<%= employeeOb.getEmployeeId() %>" onclick="confirm_delete(<%= employeeOb.getEmployeeId() %>)" class='btn btn-sm btn-danger'>Delete</a>
            </td>
            <td class="text-center">
              <a href="/ECommerceProject/admin/EditEmployee.jsp?employeeId=<%= employeeOb.getEmployeeId() %>" class='btn btn-sm btn-info'>Edit</a>
            </td>
          </tr>
          <%
            }
          %>
        </tbody>
      </table>
    </div>
  </div>

  <script>
    $(document).ready(function() {
      $('#table_id').DataTable();
    });
  </script>
</body>
</html>
