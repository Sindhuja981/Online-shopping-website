package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutils.DbConnection;

public class wishlist implements Serializable{
	private int productCode;
	private int customerId;
	private String wishlistDate;
	public wishlist() {
		super();
	}
	public wishlist(int productCode, int customerId, String wishlistDate) {
		super();
		this.productCode = productCode;
		this.customerId = customerId;
		this.wishlistDate = wishlistDate;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getWishlistDate() {
		return wishlistDate;
	}
	public void setWishlistDate(String wishlistDate) {
		this.wishlistDate = wishlistDate;
	}
	
	public int addWishlist() {
		int n=0;
		
			try {
				DbConnection db = new DbConnection();
				Connection conn = db.getConnection();
				String qry="insert into wishlist (productCode,customerId,wishlistDate) values(?,?,?)";
				PreparedStatement pst = conn.prepareStatement(qry);
				System.out.println(qry);
				pst.setInt(1,this.productCode);
				pst.setInt(2, this.customerId);
				pst.setString(3, this.wishlistDate);
				n = pst.executeUpdate();
				System.out.println(pst);
		
			}catch(Exception e) {
				System.out.println(e);
			}
		return n;	
	}
	
	//get all products by customerId as that of wishlist
	public <Product> List<product> getAllWishlistProductsByCustomerId(int customerId) {
		List<product> ProductsList = new ArrayList<product>();
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry="Select productCode,categoryName,productName,description,discount,cost,productImage1,productImage2,productImage3  from products where productCode in(select productCode from wishlist where customerId=?)order by productName";
			PreparedStatement st = conn.prepareStatement(qry);
			st.setInt(1, customerId);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				product Product = new product();
				Product.setProductCode(rs.getInt("productCode"));
				Product.setCategoryName(rs.getString("categoryName"));
				Product.setProductName(rs.getString("productName"));
				Product.setDescription(rs.getString("description"));			
				Product.setDiscount(rs.getInt("discount"));
				Product.setCost(rs.getInt("cost"));
				Product.setProductImage1(rs.getString("productImage1"));
				Product.setProductImage2(rs.getString("productImage2"));
				Product.setProductImage3(rs.getString("productImage3"));
				ProductsList.add(Product);
			}
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return ProductsList;
	}
	public boolean deleteWishlistItemByProducCode() {
		boolean flag=false;
		try {
			DbConnection db = new DbConnection();
		    Connection conn = db.getConnection();
			
		    String qry="delete from wishlist where productCode=?";
		    PreparedStatement pst=conn.prepareStatement(qry);
		    pst.setInt(1,  this.productCode);
		    
		    int n=pst.executeUpdate();
		    
		    if(n==0) {
		    	flag=false;
		    }else {
		    	flag=true;
		    }
		}catch(Exception e){
			flag=false;			
		}
		return flag;
	}
}
