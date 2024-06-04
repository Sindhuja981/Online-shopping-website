package com.example.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.CustomerOrders;

/**
 * Servlet implementation class UpdateOrderStatusServlet
 */
@WebServlet("/updateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String orderId = request.getParameter("orderId");
		String OrderStatus = request.getParameter("OrderStatus");
		
		
		CustomerOrders corders = new CustomerOrders();
		corders.setOrderId(Long.parseLong(orderId));
		corders.setOrderStatus(OrderStatus);
		int n = corders.customerOrderStatusUpdate(Long.parseLong(orderId), OrderStatus);
	
		int m=Integer.parseInt(request.getParameter("n"));
		if(m==1) { //customer
			response.sendRedirect("/ECommerceProject/admin/OrdersHistory.jsp?res="+ n);
		}else if(m==2) {
			response.sendRedirect("/ECommerceProject/admin/AdminOrders.jsp?res="+ n);
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
