package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutils.DbConnection;

public class product implements Serializable{
	
	private int productCode;
	private String categoryName;
	private String productName;
	private String description;
	private int discount;
	private int cost;
	private String productImage1;
	private String productImage2;
	private String productImage3;
	public product() {
		super();
	}
	public product(int productCode, String categoryName, String productName, String description, int discount, int cost,
			String productImage1, String productImage2, String productImage3) {
		super();
		this.productCode = productCode;
		this.categoryName = categoryName;
		this.productName = productName;
		this.description = description;
		this.discount = discount;
		this.cost = cost;
		this.productImage1 = productImage1;
		this.productImage2 = productImage2;
		this.productImage3 = productImage3;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getProductImage1() {
		return productImage1;
	}
	public void setProductImage1(String productImage1) {
		this.productImage1 = productImage1;
	}
	public String getProductImage2() {
		return productImage2;
	}
	public void setProductImage2(String productImage2) {
		this.productImage2 = productImage2;
	}
	public String getProductImage3() {
		return productImage3;
	}
	public void setProductImage3(String productImage3) {
		this.productImage3 = productImage3;
	}
	
	//////Add record to product table////
	
	public int addProduct() {
		int n=0;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry = "insert into products(productCode,categoryName,productName,description,discount,cost,productImage1,productImage2,productImage3) values(?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.productCode);
			pst.setString(2, this.categoryName);
			pst.setString(3, this.productName);
			pst.setString(4, this.description);
			pst.setInt(5, this.discount);
			pst.setInt(6, this.cost);
			pst.setString(7, this.productImage1);
			pst.setString(8, this.productImage2);
			pst.setString(9, this.productImage3);
			
			n = pst.executeUpdate();
		}catch (Exception e) {
			n=0;
		}
		return n;
	}
	////////////////////////////
	
	
	public <Product> List<product> getAllProducts(String search) {
		List<product> ProductsList = new ArrayList<product>();
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry="";
			if(search==null) {
			qry="Select productCode,categoryName,productName,description,discount,cost,productImage1,productImage2,productImage3  from products order by productName";
			}else {
				search = search.toLowerCase();
		    	String words[] = search.split(" ");
		    	String columnNames[] = {"categoryName", "productName", "description"};
		    	qry="select productCode,categoryName,productName,description,discount,cost,productImage1,productImage2,productImage3 from products where ";
		    	
		    	for(String word: words) {
		    		for (String colName: columnNames) {
		    			qry+= "lower("+colName +") like '%" + word + "%' or ";
		    		}
		    	}
		    	
		    	qry = qry.substring(0, qry.length()-3);
		    	
		    	qry +=" order by categoryName, productName";
		    	System.out.println("qry=" + qry);	
		    	
		    }
		    
			
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);
			
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
			System.out.println("Error getAllProducts:"+e);
		}
		return ProductsList;
	}
	public boolean DeleteProduct() {
		boolean flag=false;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry ="Delete from products where productCode=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,this.productCode);
			
			int n = pst.executeUpdate();
			if(n==0) {
				return true;
			}else {
				return false;
			}
		}catch(Exception e) {
			System.out.println(e);
		}
	
		return flag;
	}
	
	
	public product getProductByCode() {
		product ProductRow = new product();
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry ="Select productCode,categoryName,productName,description,discount,cost,productImage1,productImage2,productImage3  from products where productCode=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,this.productCode);
			ResultSet rs = pst.executeQuery();
			
			
			if(rs.next()) {
				ProductRow.setProductCode(rs.getInt("productCode"));
				ProductRow.setCategoryName(rs.getString("categoryName"));
				ProductRow.setProductName(rs.getString("productName"));
				ProductRow.setDescription(rs.getString("description"));
				ProductRow.setDiscount(rs.getInt("discount"));
				ProductRow.setCost(rs.getInt("cost"));
				ProductRow.setProductImage1(rs.getString("productImage1"));
				ProductRow.setProductImage2(rs.getString("productImage2"));
				ProductRow.setProductImage3(rs.getString("productImage3"));
				System.out.println("ok, res="+rs.getInt("productCode"));
			}else {
				ProductRow = null;
			}
			// return categoryRow;
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return ProductRow;
		//return Category;
	}
	
	
	
	public int updateProductByCode() {
		int n=0;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry ="update products set categoryName=?, productName=?, description=?, discount=?, cost=? where productCode=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setString(1,this.categoryName);
			pst.setString(2, this.productName);
			pst.setString(3, this.description);
			pst.setInt(4, this.discount);
			pst.setInt(5, this.cost);
			pst.setInt(6, this.productCode);
			n = pst.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
		return n;
	}
	
}
