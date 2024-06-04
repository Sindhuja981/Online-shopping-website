<%@page import="java.util.List"%>
<%@page import="com.example.model.Rating"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../Header.jsp" />
    <script type="text/javascript">
        function confirm_delete(ratingId) {
            let ans = confirm("Want to delete this record?");
            if (ans) {
                window.location = "/ECommerceProject/DeleteRatingServlet?ratingId=" + ratingId;
            }
        }
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <jsp:include page="CustomerNavbar.jsp" />
    <div class="container mt-4">
        <%
            Rating rating = new Rating();
            List<Rating> RatingList = rating.getAllRatings();
        %>
        <div class="container">
            <center><h2>View Records</h2></center>
            <h2>Category Records</h2>
            <div class="table-responsive">
                <table class="table table-striped" id="table_id">
                    <thead class="table-dark">
                        <tr>
                            <th>Slno</th>
                            <th>Rating ID</th>
                            <th>Product Code</th>
                            <th>Rating</th>
                            <th>Comments</th>
                            <th>Customer ID</th>
                            <th>Operation</th>
                            <th>Operation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int slno = 0;
                            for (Rating ratingOb : RatingList) {
                                slno++;
                        %>
                        <tr>
                            <td><%= slno %></td>
                            <td><%= ratingOb.getRatingId() %></td>
                            <td><%= ratingOb.getProductCode() %></td>
                            <td><%= ratingOb.getRating() %></td>
                            <td><%= ratingOb.getComment() %></td>
                            <td><%= ratingOb.getCustomerId() %></td>
                            <td>
                                <a href="javascript:void(0);" onclick="confirm_delete(<%= ratingOb.getRatingId() %>)" class="btn btn-sm btn-danger">Delete</a>
                            </td>
                            <td>
                                <a href="/ECommerceProject/admin/EditRating.jsp?ratingId=<%= ratingOb.getRatingId() %>" class="btn btn-sm btn-info">Edit</a>
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <script>
        $(document).ready(function() {
            $('#table_id').DataTable();
        });
    </script>
    <br></br><br></br>
    <div class="mt-5">
	<jsp:include page='../footer.jsp'></jsp:include>
	</div>
</body>
</html>
