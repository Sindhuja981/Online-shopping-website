package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dbutils.DbConnection;

public class AddCart implements Serializable {
	private String productCode;
	private String selectedDate;
	private int customerId;
	public AddCart() {
		super();
	}
	public AddCart(String productCode, String selectedDate, int customerId) {
		super();
		this.productCode = productCode;
		this.selectedDate = selectedDate;
		this.customerId = customerId;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getSelectedDate() {
		return selectedDate;
	}
	public void setSelectedDate(String selectedDate) {
		this.selectedDate = selectedDate;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	
	public int addCart() {
		int n=0;
		
			try {
				DbConnection db = new DbConnection();
				Connection conn = db.getConnection();
				String qry="insert into cart (productCode,selectedDate,customerId) values(?,?,?)";
				PreparedStatement pst = conn.prepareStatement(qry);
				System.out.println(qry);
				pst.setString(1,this.productCode);
				pst.setString(2, this.selectedDate);
				pst.setInt(3, this.customerId);
				n = pst.executeUpdate();
				System.out.println(pst);
		
			}catch(Exception e) {
				System.out.println(e);
			}
		return n;	
	}

}
