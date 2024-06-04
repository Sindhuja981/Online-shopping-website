package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutils.DbConnection;

public class Category implements Serializable{
	
	private int categoryId;
	private String categoryName;
	private Category Category;
	public Category() {
		super();
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public boolean AddCategory() {
		boolean flag=false;
		DbConnection db = new DbConnection();
		Connection conn = db.getConnection();
		if (conn==null) {
			flag= false;
		}else {
			try {
				String qry="insert into category(categoryName) values(?)";
				PreparedStatement pst = conn.prepareStatement(qry);
				
				pst.setString(1,this.categoryName);
				
				int rs = pst.executeUpdate();
				System.out.println(pst);
				if (rs==0) {
		             flag = false;
		         } else {
		             flag = true;
		         }
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return flag;	
		
	}
	
	public List<Category> getAllCategories() {
		List<Category> categoryList = new ArrayList<Category>();
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry="Select categoryId,categoryName from category order by categoryName";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);
			
			while(rs.next()) {
				Category category = new Category();
				category.setCategoryId(rs.getInt("categoryId"));
				category.setCategoryName(rs.getString("categoryName"));
				categoryList.add(category);
			}
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return categoryList;
	}
	
	public boolean DeleteCategory() {
		boolean flag=false;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry ="Delete from category where categoryId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,this.categoryId);
			
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
	public Category getCategoryById() {
		Category categoryRow = new Category();
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry ="select categoryId,categoryName from category where categoryId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,this.categoryId);
			ResultSet rs = pst.executeQuery();
			
			
			if(rs.next()) {
				categoryRow.setCategoryId(rs.getInt("categoryId"));
				categoryRow.setCategoryName(rs.getString("categoryName"));
				System.out.println("ok, res="+rs.getString("categoryName"));
			}else {
				categoryRow = null;
			}
			// return categoryRow;
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return categoryRow;
		//return Category;
	}
	
	public int updateCategoryById() {
		int n=0;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry ="update category set categoryName=? where categoryId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setString(1,this.categoryName);
			pst.setInt(2, this.categoryId);
			
			n = pst.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
		return n;
	}
	
	///////////
	public List<String> getAllCategoriesByName(){
		List<String> categoryList = new ArrayList<String>();
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			
			String qry="select categoryName from category order by categoryName";
			Statement st = conn.createStatement();
			ResultSet rs= st.executeQuery(qry);
			
			while(rs.next()) {
				categoryList.add(rs.getString("categoryName"));
			}
			
		}catch(Exception e) {
			System.out.println("Error: getAllCategoriesByName()...."+e);
		}
		return categoryList;
	}
	
}
