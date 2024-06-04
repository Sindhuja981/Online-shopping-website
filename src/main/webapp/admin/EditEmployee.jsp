<%@page import="com.example.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Employee</title>
  <jsp:include page='../Header.jsp'></jsp:include>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
  <% 
    String employeeId = request.getParameter("employeeId");
    Employee employee = new Employee();
    System.out.println("EmployeeId =" + employeeId);
    employee.setEmployeeId(Integer.parseInt(employeeId));
    employee = employee.getEmployeeById();
  %>
  
  <div class="container mt-5">
    <h3 class="text-center">Edit Employee</h3>
    <div class="card col-md-8 mx-auto mt-4">
      <div class="card-body">
        <form method="post" action="/ECommerceProject/UpdateEmployeeServlet">
          <div class="mb-3">
            <label for="EmployeeId" class="form-label">Employee Id:</label>
            <input type="number" class="form-control" id="EmployeeId" name="EmployeeId" value="<%=employee.getEmployeeId()%>" readonly>
          </div>
          <div class="mb-3">
            <label for="FirstName" class="form-label">First Name:</label>
            <input type="text" class="form-control" id="FirstName" name="FirstName" value="<%=employee.getFirstName()%>" required>
          </div>
          <div class="mb-3">
            <label for="LastName" class="form-label">Last Name:</label>
            <input type="text" class="form-control" id="LastName" name="LastName" value="<%=employee.getLastName()%>" required>
          </div>
          <div class="mb-3">
            <label for="Gender" class="form-label">Gender:</label>
            <input type="text" class="form-control" id="Gender" name="Gender" value="<%=employee.getGender()%>" required>
          </div>
          <div class="mb-3">
            <label for="Mobile" class="form-label">Mobile:</label>
            <input type="number" class="form-control" id="Mobile" name="Mobile" value="<%=employee.getMobile()%>" required>
          </div>
          <div class="mb-3">
            <label for="EmailId" class="form-label">Email Id:</label>
            <input type="email" class="form-control" id="EmailId" name="EmailId" value="<%=employee.getEmailId()%>" required>
          </div>
          <div class="mb-3">
            <label for="Designation" class="form-label">Designation:</label>
            <input type="text" class="form-control" id="Designation" name="Designation" value="<%=employee.getDesignation()%>" required>
          </div>
          <div class="mb-3">
            <label for="Password" class="form-label">Password:</label>
            <input type="password" class="form-control" id="Password" name="Password" value="<%=employee.getPassword()%>" required>
          </div>
          <div class="text-center">
            <button type="submit" class="btn btn-success">Update Employee</button>
          </div>
        </form>
        <% 
          String res = request.getParameter("res");
          if(res != null) {
            if(res.equals("0")) {
        %>
        <div class="alert alert-danger mt-3">Not updated</div>
        <% 
            } else {
        %>
        <div class="alert alert-success mt-3">Updated</div>
        <% 
            }
          }
        %>
      </div>
    </div>
  </div>
</body>
</html>
