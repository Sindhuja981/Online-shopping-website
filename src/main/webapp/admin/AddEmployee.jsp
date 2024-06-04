<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page='../Header.jsp'></jsp:include>
</head>
<body>

<form method='post' action='/ECommerceProject/AddEmployeeServlet'>

    <div class="container mt-5">
        <div class="card mx-auto col-lg-6 col-md-8 col-sm-12" style="background-color:#50F77D; box-shadow:5px 5px 7px black;">
            <div class="card-body">
                <h3 class="card-title text-center mt-3">Add Employee</h3>
                <div class="form-group row mt-3">
                    <div class="col-sm-6 mb-3">
                        <label for="EmployeeId">Employee Id:</label>
                        <input type="number" class="form-control" id="EmployeeId" name="EmployeeId">
                    </div>
                    <div class="col-sm-6 mb-3">
                        <label for="FirstName">First Name:</label>
                        <input type="text" class="form-control" id="FirstName" name="FirstName">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-6 mb-3">
                        <label for="LastName">Last Name:</label>
                        <input type="text" class="form-control" id="LastName" name="LastName">
                    </div>
                    <div class="col-sm-6 mb-3">
                        <label for="Gender">Gender:</label>
                        <input type="text" class="form-control" id="Gender" name="Gender">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-6 mb-3">
                        <label for="Mobile">Mobile:</label>
                        <input type="number" class="form-control" id="Mobile" name="Mobile">
                    </div>
                    <div class="col-sm-6 mb-3">
                        <label for="EmailId">Email Id:</label>
                        <input type="email" class="form-control" id="EmailId" name="EmailId">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-6 mb-3">
                        <label for="Designation">Designation:</label>
                        <input type="text" class="form-control" id="Designation" name="Designation">
                    </div>
                    <div class="col-sm-6 mb-3">
                        <label for="Password">Password:</label>
                        <input type="password" class="form-control" id="Password" name="Password">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-12 text-center">
                        <input type="submit" name="submit" class="btn btn-success" value="Add Employee">
                    </div>
                </div>
            </div>
        </div>
    </div>

</form>

</body>
</html>
