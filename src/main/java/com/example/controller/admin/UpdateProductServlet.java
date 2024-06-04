package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.product;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/UpdateProductServlet")
@MultipartConfig
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
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
		System.out.println(productCode);
		String categoryName = request.getParameter("categoryName");
		String productName = request.getParameter("productName");
		String description = request.getParameter("Description");
		String discount = request.getParameter("discount");
		String cost = request.getParameter("cost");
		product Product = new product();
		Product.setProductCode(Integer.parseInt(productCode));
		Product.setCategoryName(categoryName);
		Product.setProductName(productName);
		Product.setDescription(description);
		Product.setDiscount(Integer.parseInt(discount));
		Product.setCost(Integer.parseInt(cost));
		int n = Product.updateProductByCode();
		/*if(n==0) {
		response.sendRedirect("admin/ViewCategory.jsp?res=0");
	}else {// Category doesn't exits
		response.sendRedirect("admin/ViewCategory.jsp?res=1");
	}*/
	response.sendRedirect("/ECommerceProject/admin/ViewProduct.jsp?res="+ n);
	pw.close();
	}
	}


