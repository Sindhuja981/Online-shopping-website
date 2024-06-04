package com.example.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Rating;

/**
 * Servlet implementation class UpdateRateingServlet
 */
@WebServlet("/UpdateRateingServlet")
public class UpdateRateingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRateingServlet() {
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
		
		String ratingId=request.getParameter("ratingId");
		
		String rating=request.getParameter("rating");
        String comment=request.getParameter("comment");
        
        
        
        //
        
        System.out.println("ratingId: "+ratingId);
       
        System.out.println("rating: "+rating);
        System.out.println("comments: "+comment);
       
        
        
        
        
        //
        Rating ratings= new Rating();
        ratings.setRatingId(Integer.parseInt(ratingId));
        
        ratings.setRating(Integer.parseInt(rating));
        ratings.setComment(comment);
       
        
        int n=ratings.updateRatingById();
        
        if(n>0) {//successfully updated
        	response.sendRedirect("/ECommerceProject/admin/viewRating.jsp?res="+n);	
       }

	}
		
	

}
