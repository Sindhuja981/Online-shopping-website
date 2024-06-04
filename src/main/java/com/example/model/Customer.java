package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutils.DbConnection;
import jakarta.servlet.http.HttpSession;

public class Customer implements Serializable {
	private int customerId;
	private String firstName;
	private String lastName;
	private int moblieNumber;
	private String emailid;
	private String password;
	private String profilePic;
	private String registerDate;
	public Customer() {
		super();
	}
	public Customer(int customerId, String firstName, String lastName, int moblieNumber, String emailid,
			String password, String profilePic, String registerDate) {
		super();
		this.customerId = customerId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.moblieNumber = moblieNumber;
		this.emailid = emailid;
		this.password = password;
		this.profilePic = profilePic;
		this.registerDate = registerDate;
	}

	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getMoblieNumber() {
		return moblieNumber;
	}
	public void setMoblieNumber(int moblieNumber) {
		this.moblieNumber = moblieNumber;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	public boolean CustomerLoginValidation() {
		boolean flag = false;
		DbConnection db = new DbConnection();
		Connection conn = db.getConnection();
		if (conn==null) {
			flag= false;
		}else {
			try {
				String qry="Select * from customer where emailId=? and password=?";
				System.out.println(qry);
				 PreparedStatement pst = conn.prepareStatement(qry);
		        
		         pst.setString(1, this.emailid);
		         pst.setString(2, this.password);
		         System.out.println("emailid1="+emailid +"password1="+ password);
		         ResultSet rs = pst.executeQuery();

		         if (rs.next()) {
		        	 this.setCustomerId(rs.getInt("customerId"));
		        	 this.setEmailid(rs.getString("emailId"));
		        	 this.setFirstName(rs.getString("firstName"));
		        	 this.setLastName(rs.getString("LastName"));
		        	 
		             flag = true;
		         } else {
		             flag = false;
		         }
				}catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		
		return flag;
	}
	
	public boolean AddRegistration() {
		boolean flag=false;
		DbConnection db = new DbConnection();
		Connection conn = db.getConnection();
		if (conn==null) {
			flag= false;
		}else {
			try {
				String qry="insert into customer(customerId,firstName,lastName,moblieNumber,emailid,password,profilePic,registerDate) values(?,?,?,?,?,?,?,?)";
				PreparedStatement pst = conn.prepareStatement(qry);
				
				pst.setInt(1,this.customerId);
				pst.setString(2, this.firstName);
				pst.setString(3, this.lastName);
				pst.setInt(4, this.moblieNumber);
				pst.setString(5, this.emailid);
				pst.setString(6, this.password);
				pst.setString(7, this.profilePic);
				pst.setString(8, this.registerDate);
				
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
	
	
	
	
	public Customer getCustomerById(int customerId) {
		Customer customer = new Customer();
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry = "Select customerId,firstName,lastName,moblieNumber,emailid,password,profilePic,registerDate from customer where customerId=?";
			System.out.println("qry="+qry);
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, customerId);
			System.out.println("customerId="+ customerId);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				
				customer.setCustomerId(rs.getInt("customerId"));
				System.out.println("customer="+customerId);
				customer.setFirstName(rs.getString("firstName"));
				System.out.println("firstName="+ firstName);
				customer.setLastName(rs.getString("lastName"));
				System.out.println("lastName=" +lastName);
				
				customer.setMoblieNumber(rs.getInt("moblieNumber"));
				System.out.println("moblieNumber=" +moblieNumber);
				customer.setEmailid(rs.getString("emailid"));
				System.out.println("emailid=" + emailid);
				customer.setPassword(rs.getString("password"));
				System.out.println("password=" +password);
				customer.setProfilePic(rs.getString("profilePic"));
				System.out.println("profilePic=" +profilePic);
				customer.setRegisterDate(rs.getString("registerDate"));
				System.out.println("registerDate=" +registerDate);
				
				//System.out.println("customer="+CustomerList);
			}
			System.out.println("customer="+customer);
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return customer;
	}
	public List<Customer> getAllCustomers(){
		List<Customer> customerList = new ArrayList<Customer>();
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry ="Select customerId,firstName,lastName,moblieNumber,emailid,password,profilePic,registerDate from customer order by firstName";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);
			
			while(rs.next()) {
				Customer customer = new Customer();
				customer.setCustomerId(rs.getInt("customerId"));
				customer.setFirstName(rs.getString("firstName"));			
				customer.setLastName(rs.getString("lastName"));							
				customer.setMoblieNumber(rs.getInt("moblieNumber"));				
				customer.setEmailid(rs.getString("emailid"));				
				customer.setPassword(rs.getString("password"));				
				customer.setProfilePic(rs.getString("profilePic"));				
				customer.setRegisterDate(rs.getString("registerDate"));				
				customerList.add(customer);
			}
			
		}catch(Exception e) {
			System.out.println("Error:"+e);
		}
		
		return customerList;
	}
	public boolean DeleteCustomerById() {
		boolean flag=false;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry ="Delete from customer where customerId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,this.customerId);
			
			int n = pst.executeUpdate();
			if(n==0) {
				return true;
			}else {
				return false;
			}
		}catch(Exception e) {
			System.out.println("Error DeleteCustomerById:"+e);
		}
	
		return flag;
	}
	public int updateCustomerByCustomerId() {
        int n = 0;

        try {
            DbConnection db = new DbConnection();
            Connection conn = db.getConnection();

            if (conn != null) {
                String query = "UPDATE customer SET firstName=?, lastName=?, moblieNumber=?, "
                             + "emailId=?, password=?, registerDate=? WHERE customerId=?";
                PreparedStatement pst = conn.prepareStatement(query);
                System.out.println("query=" + query);
                pst.setString(1, this.firstName);
                pst.setString(2, this.lastName);
                pst.setInt(3, this.moblieNumber);
                pst.setString(4, this.emailid);
                pst.setString(5, this.password);
                pst.setString(6, this.registerDate);  // Assuming registerDate is a string, adjust if it's a date
                pst.setInt(7, this.customerId);

                	System.out.println("query1="+pst.toString());
                n = pst.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("Error:updateCustomerByCustomerId"+e);
        }

        return n;
    }
    
    
    ///////
    public Customer getCustomerProfileById() {
    	Customer customer=new Customer();
    	try {
    		DbConnection db=new DbConnection();
    		Connection conn=db.getConnection();
    		
    		String qry="select customerId,firstName,lastName,moblieNumber,emailId,password,registerDate from customer where customerId=?";
    		PreparedStatement pst=conn.prepareStatement(qry);
    		
    		 		
    		pst.setInt(1,  customerId);
    		
    		System.out.println("qry111="+pst.toString());
    		ResultSet rs=pst.executeQuery();
    		
    		if(rs.next()) {
    			customer.setCustomerId(rs.getInt("customerId"));
    			customer.setFirstName(rs.getString("firstName"));
				customer.setLastName(rs.getString("lastName"));
				customer.setMoblieNumber(rs.getInt("moblieNumber"));
				customer.setEmailid(rs.getString("emailId"));
				customer.setPassword(rs.getString("password"));
				customer.setRegisterDate(rs.getString("registerDate"));
			} else {
				customer = null;
			}
		} catch (Exception e) {
			System.out.println("Error getCustomerProfileById:" + e);
		}
		return customer;
	
    }
	
}
