<%@ page import="com.example.model.Category"%>
<%@ page import="java.sql.Connection, java.sql.Statement, java.sql.ResultSet, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-TpCbqN6Fw2hej6DflCTzpkJyX14+Xr3NsIZWU+u8Tu7i7wKpZBuDm7bIk9tPt+fPkrDg0ojFhpc+azlr0ovRQw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Bootstrap JS bundle (includes Popper) -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-2L5wJ8kq38eAMkGqDpSOc6Ff1fAWIkCG71b45'[]77776
	t6hhhnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnj                                                                                                                                                                                                                      mOPWahFujnJ+41v3QSkpr3a/v5yI"
	crossorigin="anonymous"></script>

  
  <script type="text/javascript">
    function confirm_delete(categoryId){
      let ans = confirm("Do you want to delete this record?");
      if(ans){
        window.location = "/ECommerceProject/DeleteCategoryServlet?categoryId=" + categoryId;
      }
    }
  </script>
</head>
<body>
<jsp:include page='AdminNavbar.jsp'></jsp:include>
  <div class="container mt-3">
    <%
      Category category = new Category();
      List<Category> categoryList = category.getAllCategories();
    %>

    <div class="container">
      <%
        String res = request.getParameter("res");
        if (res != null) {
          if (res.equals("1")) {
      %>
      <div class="alert alert-success alert-dismissible" id='success-id'>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <strong>Success!</strong> Record updated.
      </div>
      <%
          } else if (res.equals("0")) {
      %>
      <div class="alert alert-danger alert-dismissible" id='success-id'>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        <strong>Error!</strong> Record not updated.
      </div>
      <%
          }
        }
      %>

      <h2>Category Records</h2>
      <div class="table-responsive">
        <table class="table table-striped" id="table_id">
          <thead>
            <tr>
              <th>Operations</th>
              <th>Operations</th>
              <th>Slno</th>
              <th>Category Id</th>
              <th>Category Name</th>
            </tr>
          </thead>
          <tbody>
            <%
              int Slno = 0;
              for (Category categoryOb : categoryList) {
                Slno++;
            %>
            <tr>
              <td>
                <a href="javascript:void(0);" onclick="confirm_delete(<%= categoryOb.getCategoryId() %>)" class="btn btn-sm btn-danger">Delete</a>
              </td>
              <td>
                <a href="/ECommerceProject/admin/EditCategory.jsp?categoryId=<%= categoryOb.getCategoryId() %>" class="btn btn-sm btn-info">Edit</a>
              </td>
              <td><%= Slno %></td>
              <td><%= categoryOb.getCategoryId() %></td>
              <td><%= categoryOb.getCategoryName() %></td>
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
    $(document).ready(function(){
      $('#table_id').DataTable();
    });
  </script>
  <div class="mt-5"> 
 <jsp:include page='../footer.jsp'></jsp:include>
</div>
</body>
</html>
