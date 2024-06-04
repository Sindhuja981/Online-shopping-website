<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap 5 Example</title>
  
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
</head>
<body>
  <jsp:include page='AdminNavbar.jsp'></jsp:include>
   
  <div class="container mt-5">
    <div class="card-body">
      <h1 style="color:green">Welcome Admin Home</h1>
    </div>
  </div>
   
  <br><br><br><br><br><br><br><br>
   
  <div class="container-fluid mt-5">
    <jsp:include page="../footer.jsp" />
  </div>
   
  <script>
    $(document).ready(function(){
      $(".navbar-toggler").click(function(){
        $(".closers").toggle();
      });
    });
  </script>
</body>
</html>
