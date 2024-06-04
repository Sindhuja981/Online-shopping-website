package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dbutils.DbConnection;

public class Cart implements Serializable{
	private int cartId;
	private int productCode;
	private String selectedDate;
	private int customerId;
	public Cart() {
		super();
	}
	
	public Cart(int cartId, int productCode, String selectedDate, int customerId) {
		super();
		this.cartId = cartId;
		this.productCode = productCode;
		this.selectedDate = selectedDate;
		this.customerId = customerId;
	}





	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
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
	
	
	
	public int addCartfromCartModel() {
		int n=0;
		
			try {
				DbConnection db = new DbConnection();
				Connection conn = db.getConnection();
				String qry="insert into cart (productCode,selectedDate,customerId) values(?,?,?)";
				PreparedStatement pst = conn.prepareStatement(qry);
				System.out.println(qry);
				pst.setInt(1,this.productCode);
				pst.setString(2, this.selectedDate);
				pst.setInt(3, this.customerId);
				n = pst.executeUpdate();
				System.out.println(pst);
		
			}catch(Exception e) {
				System.out.println(e);
			}
		return n;	
	}


	/*public int addWishlist() {
		int n=0;
		
			try {
				DbConnection db = new DbConnection();
				Connection conn = db.getConnection();
				String qry="insert into cart (productCode,selectedDate,customerId) values(?,?,?)";
				PreparedStatement pst = conn.prepareStatement(qry);
				System.out.println(qry);
				pst.setInt(1,this.productCode);
				pst.setString(2, this.selectedDate);
				pst.setInt(3, this.customerId);
				
				n = pst.executeUpdate();
				System.out.println(pst);
		
			}catch(Exception e) {
				System.out.println(e);
			}
		return n;	
	}*/
	
	public <Product> List<product> getAllCartProductsByCustomerId(int customerId) {
		List<product> ProductsList = new ArrayList<product>();
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry="Select productCode,categoryName,productName,description,discount,cost,productImage1,productImage2,productImage3  from products where productCode in(select productCode from cart where customerId=?)order by productName";
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
	public Cart getCartByCartId() {
		Cart cart = new Cart();
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry="select cartId,productCode,selectedDate,customerId from cart";

			PreparedStatement pst = conn.prepareStatement(qry);
			
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				cart.setProductCode(rs.getInt("productCode"));
				cart.setCartId(rs.getInt("cartId"));
				cart.setSelectedDate(rs.getString("selectedDate"));
				cart.setCustomerId(rs.getInt("customerId"));


			}

		} catch (Exception e) {
			System.out.println("error=" + e);
		}
		return cart;
	}
	
	
	
	public boolean DeleteByCartId() {
		boolean flag=false;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry ="Delete from cart where cartId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,this.cartId);
			
			
			int n = pst.executeUpdate();
			if(n==0) {
				return true;
			}else {
				return false;
			}
		}catch(Exception e) {
			System.out.println("Error for DeleteByCartId():"+e);
		}
	
		return flag;
	}
	public boolean DeleteCartByCustomerId(int customerId) {
		boolean flag=false;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry ="Delete from cart where customerId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,customerId);
			System.out.println("CustomerId in DeleteByCustomerId="+ customerId);
			int n = pst.executeUpdate();
			System.out.println("DeleteCartByCustomerId qry="+pst.toString());
			if(n==0) {
				return true;
			}else {
				return false;
			}
		}catch(Exception e) {
			System.out.println("Error for DeleteCartByCustomerId():"+e);
		}
	
		return flag;
	} 
	
	

	
	
	
}
