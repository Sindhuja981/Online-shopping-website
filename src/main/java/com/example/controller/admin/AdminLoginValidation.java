package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Admin;

/**
 * Servlet implementation class AdminLoginValidation
 */
@WebServlet("/AdminLoginValidation")
public class AdminLoginValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginValidation() {
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
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		admin.setRole(role);
		
		boolean flag = admin.adminLoginValidation();
		if(flag==true) {//admin is exits
			response.sendRedirect("admin/AdminHomejsp.jsp");
		}else {// admin doesn't exits
			response.sendRedirect("admin/AdminLogin.jsp?res=0");
		}
		pw.close();
	}

}
