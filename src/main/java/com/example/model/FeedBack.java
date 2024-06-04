package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


import dbutils.DbConnection;

public class FeedBack implements Serializable {
	private int feedbackId;
	private Date date;
	private int customerId;
	private String customerQuery;
	private String feedback;
	public FeedBack() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FeedBack(int feedbackId, Date date, int customerId, String customerQuery, String feedback) {
		super();
		this.feedbackId = feedbackId;
		this.date = date;
		this.customerId = customerId;
		this.customerQuery = customerQuery;
		this.feedback = feedback;
	}
	public int getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getCustomerQuery() {
		return customerQuery;
	}
	public void setCustomerQuery(String customerQuery) {
		this.customerQuery = customerQuery;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	
	public int addFeedback() {
		int n=0;
		try {
			DbConnection db=new DbConnection();
			Connection conn=db.getConnection();
			
			String query="insert into feedback(date,customerId,customerQuery,feedback)values(?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(query);
			
			pst.setDate(1, Date.valueOf(LocalDate.now()));
			pst.setInt(2, this.customerId);
			pst.setString(3, this.customerQuery);
			pst.setString(4, this.feedback);
			
			System.out.println("feedback qry = " +pst.toString());
			
			n=pst.executeUpdate();
			
			
		}catch(Exception e) {
			System.out.println("Error addFeedback: "+e);
			
		}
		return n;
	}
	
	 // Get all feedback
    public List<FeedBack> getAllFeedback() {
        List<FeedBack> feedbackList = new ArrayList<FeedBack>();
        try {
            DbConnection db = new DbConnection();
            Connection conn = db.getConnection();

            String qry = "select feedbackId,date,customerId,customerQuery,feedback from feedback ";
  			Statement st = conn.createStatement();
  			ResultSet rs = st.executeQuery(qry);
  			
  			
  			System.out.println("feedback qry = " +st.toString());

  			while (rs.next()) {
  				FeedBack feedback = new FeedBack();
  				
  				feedback.setFeedbackId(rs.getInt("feedbackId"));
  				feedback.setDate(rs.getDate("date"));
  				feedback.setCustomerId(rs.getInt("customerId"));
  				feedback.setCustomerQuery(rs.getString("customerQuery"));
  				feedback.setFeedback(rs.getString("feedback"));
  				
                
                feedbackList.add(feedback);
            }

            conn.close();
        } catch (Exception e) {
            System.out.println("Error getAllFeedback():" + e);
        }
        return feedbackList;
    }
    
    
    // delete//
    public static boolean deleteFeedback(int feedbackId) {
        boolean deleted = false;
        try {
            DbConnection db = new DbConnection();
            Connection conn = db.getConnection();

            String query = "DELETE FROM feedback WHERE feedbackId=?";
            PreparedStatement pst = conn.prepareStatement(query);
            pst.setInt(1, feedbackId);

            int n = pst.executeUpdate();
            if (n > 0) {
                deleted = true;
            }
            
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return deleted;
    }

}
