<%@page import="java.util.List"%>
<%@page import="com.example.model.FeedBack"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="../Header.jsp" />
	
 <!--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-TpCbqN6Fw2hej6DflCTzpkJyX14+Xr3NsIZWU+u8Tu7i7wKpZBuDm7bIk9tPt+fPkrDg0ojFhpc+azlr0ovRQw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <script src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
    --> <script>
        function confirm_delete(productCode) {
            let ans = confirm("Want to delete this?");
            if (ans) {
                window.location = "/ECommerceProject/DeleteFeedbackServlet?productCode=" + productCode;
            }
        }

        $(document).ready(function() {
            $('#table_id').DataTable();
            $('#success_id').slideUp(3000);
        });
    </script>
</head>
<body>
    <jsp:include page="CustomerNavbar.jsp" />
    <%
        FeedBack feedback = new FeedBack();
        List<FeedBack> feedbackList = feedback.getAllFeedback();
    %>
    <div class="container mt-4">
        <div class="mx-auto border-success" style="max-width: 1000px;">
            <h2 class="text-center mb-4"><u>View Feedback</u></h2>
            <div class="table-responsive">
                <table class="table table-striped table-hover" id="table_id">
                    <thead class="table-dark">
                        <tr>
                            <th>Slno</th>
                            <th>FeedbackId</th>
                            <th>Date</th>
                            <th>CustomerId</th>
                            <th>CustomerQuery</th>
                            <th>Feedback</th>
                            <th>Operation</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int slno = 0;
                            for (FeedBack feedbackOb : feedbackList) {
                                slno++;
                        %>
                        <tr>
                            <td><%= slno %></td>
                            <td><%= feedbackOb.getFeedbackId() %></td>
                            <td><%= feedbackOb.getDate() %></td>
                            <td><%= feedbackOb.getCustomerId() %></td>
                            <td><%= feedbackOb.getCustomerQuery() %></td>
                            <td><%= feedbackOb.getFeedback() %></td>
                            <td>
                                <button class="btn btn-sm btn-danger" onclick="confirm_delete(<%= feedbackOb.getCustomerId() %>)">Delete</button>
                                <a href="/ECommerceProject/admin/editfeedback.jsp?productCode=<%= feedbackOb.getCustomerId() %>" class="btn btn-sm btn-info">Edit</a>
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
    <div class="mt-5">
	<jsp:include page='../footer.jsp'></jsp:include>
	</div>
</body>
</html>
