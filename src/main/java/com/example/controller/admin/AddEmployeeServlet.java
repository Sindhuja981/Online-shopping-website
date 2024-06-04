package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Employee;

/**
 * Servlet implementation class AddEmployeeServlet
 */
@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployeeServlet() {
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
		
		String employeeId = request.getParameter("EmployeeId");
		System.out.println("EmployeeId="+employeeId);
		String firstName = request.getParameter("FirstName");
		String lastName = request.getParameter("LastName");
		String gender = request.getParameter("Gender");
		String mobile =request.getParameter("Mobile");
		String emailId = request.getParameter("EmailId");
		String designation = request.getParameter("Designation");
		String password = request.getParameter("Password");
		
		Employee employee = new Employee();
		employee.setEmployeeId(Integer.parseInt(employeeId));
		employee.setFirstName(firstName);
		employee.setLastName(lastName);
		employee.setGender(gender);
		employee.setMobile(mobile);
		employee.setEmailId(emailId);
		employee.setDesignation(designation);
		employee.setPassword(password);
		
		boolean rs =employee.AddEmployee();
		if(rs==true) {//Category is exits
			response.sendRedirect("admin/AddEmployee.jsp");
		}else {// Category doesn't exits
			response.sendRedirect("admin/AddEmployee.jsp?res=0");
		}
		pw.close();
		
		
	}

}
