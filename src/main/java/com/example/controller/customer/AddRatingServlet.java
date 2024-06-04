package com.example.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Rating;

/**
 * Servlet implementation class AddRatingServlet
 */
@WebServlet("/AddRatingServlet")
public class AddRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRatingServlet() {
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
		
		String productCode = request.getParameter("productCode");
		String rating=request.getParameter("rating");
		String comment=request.getParameter("comment");
		
		System.out.println("productCode="+productCode);
		System.out.println("rating="+rating);
		System.out.println("comments="+comment);
		
		HttpSession session=request.getSession();
		
		int customerId=(int)session.getAttribute("customerId");
		System.out.println("customerId="+customerId);
		
		Rating ratings=new Rating();
		ratings.setProductCode(Integer.parseInt(productCode));
		ratings.setRating(Integer.parseInt(rating));
		ratings.setComment(comment);
		ratings.setCustomerId(customerId);
		
		int n= ratings.addRating();
		
		response.sendRedirect("/ECommerceProject/admin/OrdersHistory.jsp?res="+n);
		pw.close();
	
		
	}

}
