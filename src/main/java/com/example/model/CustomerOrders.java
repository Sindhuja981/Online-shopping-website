package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutils.DbConnection;

public class CustomerOrders implements Serializable{
	private long orderId;
	private int customerId;
	private long invoiceNumber;
	private int productCode;
	private String orderDateTime;
	private float cost;
	private int discountAmount;
	private int quantity;
	private int gstAmount;
	private float billAmount;
	private String orderStatus;
	public CustomerOrders() {
		super();
	}
	
	
	

	public CustomerOrders(long orderId, int customerId, long invoiceNumber, int productCode, String orderDateTime,
			float cost, int discountAmount, int quantity, int gstAmount, float billAmount, String orderStatus) {
		super();
		this.orderId = orderId;
		this.customerId = customerId;
		this.invoiceNumber = invoiceNumber;
		this.productCode = productCode;
		this.orderDateTime = orderDateTime;
		this.cost = cost;
		this.discountAmount = discountAmount;
		this.quantity = quantity;
		this.gstAmount = gstAmount;
		this.billAmount = billAmount;
		this.orderStatus = orderStatus;
	}




	public long getOrderId() {
		return orderId;
	}




	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}




	public int getCustomerId() {
		return customerId;
	}




	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}




	public long getInvoiceNumber() {
		return invoiceNumber;
	}




	public void setInvoiceNumber(long invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}




	public int getProductCode() {
		return productCode;
	}




	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}




	public String getOrderDateTime() {
		return orderDateTime;
	}




	public void setOrderDateTime(String orderDateTime) {
		this.orderDateTime = orderDateTime;
	}




	public float getCost() {
		return cost;
	}




	public void setCost(float cost) {
		this.cost = cost;
	}




	public int getDiscountAmount() {
		return discountAmount;
	}




	public void setDiscountAmount(int discountAmount) {
		this.discountAmount = discountAmount;
	}




	public int getQuantity() {
		return quantity;
	}




	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}




	public int getGstAmount() {
		return gstAmount;
	}




	public void setGstAmount(int gstAmount) {
		this.gstAmount = gstAmount;
	}




	public float getBillAmount() {
		return billAmount;
	}




	public void setBillAmount(float billAmount) {
		this.billAmount = billAmount;
	}


	public String getOrderStatus() {
		return orderStatus;
	}




	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}




	//////
	public int addCustomersOrders() {
		int n=0;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry = "insert into customerorders(orderId,customerId,invoiceNumber,productCode,orderDateTime,cost,discountAmount,quantity,gstAmount,billAmount,orderStatus) values(?,?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setLong(1, this.orderId);
			pst.setInt(2, this.customerId);
			pst.setLong(3, this.invoiceNumber);
			pst.setInt(4, this.productCode);
			pst.setString(5, this.orderDateTime);
			pst.setFloat(6, this.cost);
			pst.setInt(7, this.discountAmount);
			pst.setInt(8, this.quantity);
			pst.setInt(9, this.gstAmount);
			pst.setFloat(10, this.billAmount);
			pst.setString(11, this.orderStatus);
			System.out.println("qry1111="+pst.toString());
			
			
			
			n= pst.executeUpdate();
			System.out.println("nnnn=" + n);
			
			
			
			
		}catch (Exception e) {
			System.out.println("error addcustomerorders():" + e);
			n=0;
		}
		return n;
	}
	
	public <customer> List<CustomerOrders> getAllCustomerOrders() {
		List<CustomerOrders> customersList = new ArrayList<CustomerOrders>();
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry="Select orderId,customerId,invoiceNumber,productCode,orderDateTime,cost,discountAmount,quantity,billAmount,orderStatus from customerorders order by customerId";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);
			
			while(rs.next()) {
				CustomerOrders customer = new CustomerOrders();
				customer.setOrderId(rs.getLong("orderId"));
				customer.setCustomerId(rs.getInt("customerId"));
				customer.setInvoiceNumber(rs.getLong("invoiceNumber"));
				customer.setProductCode(rs.getInt("productCode"));
				customer.setOrderDateTime(rs.getString("orderDateTime"));
				customer.setCost(rs.getFloat("cost"));
				customer.setDiscountAmount(rs.getInt("discountAmount"));
				customer.setQuantity(rs.getInt("quantity"));
				customer.setBillAmount(rs.getFloat("billAmount"));
				customer.setOrderStatus(rs.getString("orderStatus"));
				customersList.add(customer);
			}
			
		}catch(Exception e) {
			System.out.println("Error for getAllCustomerOrders():"+e);
		}
		return customersList;
	}
	public int customerOrderStatusUpdate(long orderId , String orderStatus ) {
		int n=0;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry = "update customerorders set orderStatus=? where orderId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setString(1, orderStatus);
			pst.setLong(2, orderId);			
			n= pst.executeUpdate();
			System.out.println("nnnn=" + n);
			
		}catch(Exception e) {
			System.out.println("Error for customerOrderStatusUpdate():"+e);
			n=0;
		}
		return n;
	}

	
}
