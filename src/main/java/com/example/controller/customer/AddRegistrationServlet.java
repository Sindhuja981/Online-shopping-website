package com.example.controller.customer;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

import com.example.model.Category;
import com.example.model.Customer;

/**
 * Servlet implementation class AddRegistrationServlet
 */
@WebServlet("/AddRegistrationServlet")
@MultipartConfig
public class AddRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String customerId = request.getParameter("customerId");
		System.out.println("customerId="+customerId);
		String firstName =request.getParameter("firstname");
		String lastName =request.getParameter("lastname");
		String moblieNumber =request.getParameter("mobile");
		System.out.println("moblieNumber="+moblieNumber);
		String emailid =request.getParameter("emailid");
		String password =request.getParameter("password");
		//String profilePic =request.getParameter("profilePic");
		String registerDate =request.getParameter("Date");
		
		
		Part profilePic = request.getPart("profilePic");
		
	/////// Creation of uploads in webapp folder/////////////////

			ServletContext sc = getServletContext();
			String path = sc.getRealPath("/");
			System.out.println("path = " + path);

			String str = path.substring(0, path.indexOf(".metadata") - 1);
			System.out.println("str = " + str);
			// get application name
			String appName = path.substring(path.lastIndexOf("\\", path.length() - 2));
			System.out.println("appName = " + appName);

			// Concatenate root directory with application name
			String uploadDirectory = str + appName + "\\src\\main\\webapp\\uploads";
			System.out.println("uploadDirectory :" + uploadDirectory);

			Path uploadPath = Path.of(uploadDirectory);
			
			
			// Create the directory if it doesnt't exist
			if (!Files.exists(uploadPath)) {
				Files.createDirectories(uploadPath);
				System.out.println("directory Created");
			} else {
				System.out.println("directory not Created");
			}
			
			

			/////// upload productImage1////////////////////
			//////////////////////////////

			// Get the input stream of the uploaded file
			InputStream inputStream1 = profilePic.getInputStream();

			// Generate the unique filename or use the original file name
			String fileName1 = System.currentTimeMillis() + "_" + profilePic.getSubmittedFileName();

			// Save file to the server
			Path filePath1 = uploadPath.resolve(fileName1);
			Files.copy(inputStream1, filePath1, StandardCopyOption.REPLACE_EXISTING);

		
	
		Customer customer = new Customer();	
		customer.setCustomerId(Integer.parseInt(customerId));
		customer.setFirstName(firstName);
		customer.setLastName(lastName);
		customer.setMoblieNumber(Integer.parseInt(moblieNumber));
		customer.setEmailid(emailid);
		customer.setPassword(password);
		customer.setProfilePic(fileName1);
		customer.setRegisterDate(registerDate);
		
		boolean rs =customer.AddRegistration();
		if(rs==true) {//Category is exits
			response.sendRedirect("admin/CustomerHome.jsp");
		}else {// Category doesn't exits
			response.sendRedirect("admin/CustomerLogin.jsp?res=0");
		}
		pw.close();
		
	}

}
