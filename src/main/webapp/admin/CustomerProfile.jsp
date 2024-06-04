<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page='../Header.jsp'></jsp:include>
</head>
<body>
<jsp:include page='CustomerNavbar.jsp'></jsp:include>
	
	<%
	Customer customer = new Customer();
	 //List<Customer> customerlist = customer.getAllCustomerDetails((int)session.getAttribute("customerId"));
	
	 customer = customer.getCustomerById((int) session.getAttribute("customerId")); 
		
	%>
	
        <div class="container mt-2 card bg-info">
			<center></center>
            <div class='card-body'>

                <h2>Customer Profile</h2>
                
                    
                    <center>
                    
                      <img src='../uploads/<%=customer.getProfilePic()%>' alt='not Found' style="width:150px;height:150px" class='rounded-pill '><br>
                      <A href='EditProfileImage.jsp?tableName=customer&setColName=profilePic&whereColName=customerId&conditionValue=<%=customer.getCustomerId()%>&colName=profilePic'>Edit</A></center><br>
                    	<label for="customerId">Customer Id: </label>
                        <input type='number' name='customerId' class="form-control" id="customerId" size='20' value='<%=customer.getCustomerId() %>'><br>
                        <label for="firstName">First Name: </label>
                        <input type='text' name='firstName' class="form-control" id="firstName" size='20' value='<%=customer.getFirstName() %>'><br>
                        <label for="lastName">Last Name:</label>
                        <input type='text' name='lastName' class="form-control" id="lastName" size='20' value='<%=customer.getLastName()%>'><br>
                        <label for="emailid">Email Id:</label>
                        <input type='email' name='emailid' class="form-control" id="emailid" size='30' value='<%=customer.getEmailid()%>'><br>
                        <label for="moblieNumber">Mobile:</label>
                        <input type='number' name='moblieNumber' class="form-control" id="moblieNumber" size='20' value='<%=customer.getMoblieNumber() %>'><br>
                        <center><A href='EditCustomerProfile.jsp?customerId=<%=customer.getCustomerId()%>' style='color:Black'>Edit</A></center>
                    </div>
               
            </div>
            </center>
         
        </div>
        
 <div class="container-fluid mt-4" style="background-color:#B4AEA6; background-size: cover;">
    <jsp:include page="../footer.jsp" />
</div>       
        
   
    
</body>
</html>



