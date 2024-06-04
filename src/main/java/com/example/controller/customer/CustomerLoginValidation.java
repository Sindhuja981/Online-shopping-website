package com.example.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Customer;

/**
 * Servlet implementation class CustomerLoginValidation
 */
@WebServlet("/CustomerLoginValidation")
public class CustomerLoginValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerLoginValidation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		 String emailid = request.getParameter("emailId");
		 String password = request.getParameter("password");
        System.out.println("emailid="+emailid +" password="+ password);
		 Customer customer = new Customer();
		 customer.setEmailid(emailid);
		 customer.setPassword(password);
		
		 
		 
		 boolean flag = customer.CustomerLoginValidation();
		 System.out.println("flag=" + flag);
			if(flag==true) {//admin is exits
				HttpSession session = request.getSession();
				session.setAttribute("customerId", customer.getCustomerId());
				session.setAttribute("customerName",customer.getFirstName()+" "+customer.getLastName());
				session.setAttribute("customerEmailId", customer.getEmailid());
				
				response.sendRedirect("admin/CustomerHome.jsp");
			}else {// admin doesn't exits
				response.sendRedirect("admin/CustomerLogin.jsp?res=0");
			}
			pw.close();
		 
	}
	

}
