<%@page import="java.util.List"%>
<%@page import="com.example.model.Rating"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../Header.jsp"></jsp:include>
<meta charset="ISO-8859-1">
<title>Ratings</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container-fluid">
    <div class="row">
    
			<%
			//for vewing in the tble code 
			Rating  rati = new Rating();

			List<Rating> ratinglist = rati.getAllRatings();
		
			%>
    
        <div class="col-sm-12">
            <h1 class="text-center bg-info text-white mt-5">Ratings</h1>
            <div class="table-responsive">
                <table class="table table-bordered table-hover mt-3" id='table_id'>
                    <thead class='table-dark'>
                        <tr>
                            <th scope="col">SLNO</th>
                            <th scope="col">Rating Id</th>
                            <th scope="col">Product Code</th>
                            <th scope="col">Rating</th>
                            <th scope="col">Comments</th>
                            <th scope="col">CustomerId</th>
                        </tr>
                    </thead>
                    <tbody class='table-success'>
                        <%
                        int slno = 0;
                        for (Rating ratingob : ratinglist) {
                        %>
                        <tr>
                            <td class="text-center"><%=slno++%></td>
                            <td class="text-center"><%=ratingob.getRatingId()%></td>
                            <td class="text-center"><%=ratingob.getProductCode()%></td>
                            <td class="text-center"><%=ratingob.getRating()%></td>
                            <td class="text-center"><%=ratingob.getComment()%></td>
                            <td class="text-end"><%=ratingob.getCustomerId()%></td>
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
