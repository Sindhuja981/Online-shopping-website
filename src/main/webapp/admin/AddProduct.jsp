<%@page import="com.example.model.Category"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page='../Header.jsp'></jsp:include>
</head>
<body style="background-color:#EAB7CF ;">
	<%
		Category category = new Category();
		List<String> categoryList = category.getAllCategoriesByName();
	%>
	<form action="/ECommerceProject/AddProductServlet" method='post' enctype='multipart/form-data'>
		<div class='container mt-3 card ' style="background-color:powderblue;box-shadow:5px 5px 7px black">
		<h3 >Add Product</h3>
		<div class='row'>
		<div class='col-sm-6'>
			<label>Product code</label>
			<input type='number' class='form-control' name='productCode'>
		</div>
		<div class='col-sm-6'>
			<label>Category Name</label>
			<select  class='form-control' name='categoryName' >
			<%
				for(String categoryName: categoryList){
					String option = "<option value='"+categoryName+"'>"+categoryName+"</option>";
					//String option = //"<option value='%s'>%s</option>".format(categoryName, categoryName);
					System.out.println(option);
					out.println(option);
				}
			%>	
			</select>
		</div>
		</div>
		
			<div class='row'>
		<div class='col-sm-6'>
			<label>Product Name</label>
			<input type='text' class='form-control' name='productName'>
		</div>
		<div class='col-sm-6'>
			<label>Description</label>
			<textArea row='2' cols='50'  class='form-control' name='description'></textArea>
		</div>
		</div>
		
			
			<div class='row'>
		<div class='col-sm-6'>
			<label>Discount</label>
			<input type='number' class='form-control' name='discount'>
		</div>
		<div class='col-sm-6'>
			<label>Cost</label>
			<input type='number' class='form-control' name='cost'>
		</div>
		</div>
		
			<div class='row'>
		<div class='col-sm-6'>
			<label>ProductImg1</label>
			<input type='file' class='form-control' name='productImg1'>
		</div>
		<div class='col-sm-6'>
			<label>ProductImg2</label>
			<input type='file' class='form-control' name='productImg2'>
		</div>
		</div>
		
		
		<div class='row'>
		<div class='col-sm-6'>
			<label>ProductImg3</label>
			<input type='file' class='form-control' name='productImg3'>
		</div>
		</div>
		<br>
			<div class='row mt-3'>
				<div class='col-sm-12 text-center'>
					<input type='submit' name='submit' value='AddProduct' class='form-control btn btn-md btn-outline-dark'  style='width:150px;background-color:#BB8CA2;'>
					<br>
				</div>				
			</div>
			<br>
		</div>
		<br>	
		<%
			String res= request.getParameter("res");
			if(res!=null){
				if(res.equals("0")){
					out.println("<h4 style='color:red'>Img not addedd</h4>");
				}else{
					out.println("<h4 style='color:green'>Img addedd</h4>");
				}
			}
		%>		
	</form>
</body>
</html>