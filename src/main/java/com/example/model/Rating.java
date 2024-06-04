package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutils.DbConnection;

public class Rating implements Serializable {
	private int ratingId;
	private int productCode;
	private int rating;
	private String comment;
	private int customerId;
	public Rating() {
		super();
	}
	public Rating(int ratingId, int productCode, int rating, String comment, int customerId) {
		super();
		this.ratingId = ratingId;
		this.productCode = productCode;
		this.rating = rating;
		this.comment = comment;
		this.customerId = customerId;
	}
	public int getRatingId() {
		return ratingId;
	}
	public void setRatingId(int ratingId) {
		this.ratingId = ratingId;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	
	public int addRating() {
		int n=0;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry="insert into rating(ratingId,productCode,rating,comment,customerId) values(?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.ratingId);
			pst.setInt(2, this.productCode);
			pst.setInt(3, this.rating);
			pst.setString(4, this.comment);
			pst.setInt(5, this.customerId);
			
			n = pst.executeUpdate();
		}catch(Exception e) {
			System.out.println("Error in addRating:"+e);
			n=0;
		}
		
		return n;
		
	}
	public boolean isRatingGiven(int customerId, int productCode) {
		boolean found = false;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry= "select ratingId from rating where customerId=? and productCode=? ";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,customerId);
			pst.setInt(2, productCode);
			System.out.println("isRatingGiven qry="+pst.toString());
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				found=true;
			}
		
		}catch(Exception e) {
			System.out.println("Error in addRating:"+e);
		}
		return found;
	}
	public <rating> List<Rating> getAllRatings() {
		List<Rating> RatingList = new ArrayList<Rating>();
		
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry="Select ratingId,productCode,rating,comment,customerId from rating order by ratingId";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);
			 
			while(rs.next()) {
				Rating rating = new Rating();
				rating.setRatingId(rs.getInt("ratingId"));
				rating.setProductCode(rs.getInt("productCode"));
				rating.setRating(rs.getInt("rating"));
				rating.setComment(rs.getString("comment"));
				rating.setCustomerId(rs.getInt("customerId"));
				RatingList.add(rating);
			}
			
		}catch(Exception e) {
			System.out.println("Error in getAllRatings:"+e);
		}
	
	 return RatingList;
	}
	
	public boolean DeleteByratingId() {
		boolean flag=false;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry ="Delete from rating where ratingId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,this.ratingId);
			
			int n = pst.executeUpdate();
			if(n==0) {
				return true;
			}else {
				return false;
			}
		}catch(Exception e) {
			System.out.println("Error in DeleteByratingId"+e);
		}
	
		return flag;
	}
	public Rating getRatingById(int ratingId) {
		Rating rating = new Rating();
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry="Select ratingId,productCode,rating,comment,customerId  from rating where ratingId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,ratingId);
			System.out.println("qry=" + pst.toString());
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				rating.setRatingId(rs.getInt("ratingId"));
				rating.setProductCode(rs.getInt("productCode"));
				rating.setRating(rs.getInt("rating"));
				rating.setComment(rs.getString("comment"));
				rating.setCustomerId(rs.getInt("customerId"));
				System.out.println("ok, res="+rs.getInt("ratingId"));
			}else {
				rating=null;
			}
			
		}catch(Exception e) {
			System.out.println("Error in getRatingById()"+e);
		}
		return rating;
	}
	public int updateRatingById() {
		int n=0;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry="update rating set  rating=?, comment=?  where ratingId= ?";
			PreparedStatement pst = conn.prepareStatement(qry);
			
			
			pst.setInt(1, this.rating);
			pst.setString(2, this.comment);
			
			pst.setInt(3, this.ratingId);
			
			n=pst.executeUpdate();
		}catch(Exception e) {
			System.out.println("Error in updateRatingById():"+e);
		}
		
		return n;
	}
	public List<Rating> getRatingsByProductCode(int productCode){
		List<Rating> ratingList=new ArrayList<Rating>();

		try {
			DbConnection db = new DbConnection();
		    Connection conn = db.getConnection();
		    
		    String qry="select * from rating where productCode=?";
			
			PreparedStatement pst = conn.prepareStatement(qry);
			 pst.setInt(1, productCode);
		    
			ResultSet rs = pst.executeQuery();
		    
		    while(rs.next()) {
		    	Rating rating= new Rating();
		    	rating.setRatingId(rs.getInt("ratingId"));
		    	rating.setCustomerId(rs.getInt("customerId"));
		    	rating.setRating(rs.getInt("rating"));
		    	rating.setComment(rs.getString("comment"));
		    	rating.setProductCode(rs.getInt("productCode")); // Set the description parameter
		    	

			
		    	ratingList.add(rating);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllCustomerOrders..:" +e);
			
		}
		return ratingList;
		}

}
