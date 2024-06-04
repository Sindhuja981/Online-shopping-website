package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutils.DbConnection;

public class Employee implements Serializable {
	private int employeeId;
	private String firstName;
	private String lastName;
	private String gender;
	private String mobile;
	private String emailId;
	private String designation;
	private String password;
	public Employee() {
		super();
	}
	public Employee(int employeeId, String firstName, String lastName, String gender, String mobile, String emailId,
			String designation, String password) {
		super();
		this.employeeId = employeeId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.mobile = mobile;
		this.emailId = emailId;
		this.designation = designation;
		this.password = password;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public boolean AddEmployee() {
		boolean flag=false;
		DbConnection db = new DbConnection();
		Connection conn = db.getConnection();
		if (conn==null) {
			flag= false;
		}else {
			try {
				String qry="insert into employee(employeeId,firstName,lastName,gender,mobile,emailId,designation,password) values(?,?,?,?,?,?,?,?)";
				PreparedStatement pst = conn.prepareStatement(qry);
				pst.setInt(1,this.employeeId);
				pst.setString(2, this.firstName);
				pst.setString(3, this.lastName);
				pst.setString(4, this.gender);
				pst.setString(5, this.mobile);
				pst.setString(6, this.emailId);
				pst.setString(7, this.designation);
				pst.setString(8, this.password);
				
				int rs = pst.executeUpdate();
				System.out.println("qry="+qry.toString());
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
	public List<Employee> getAllEmployees(){
		List<Employee> EmployeeList = new ArrayList<Employee>();
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry = "select employeeId,firstName,lastName,gender,mobile,emailId,designation,password from Employee order by firstName";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);
			
			while(rs.next()) {
				Employee employee = new Employee();
				employee.setEmployeeId(rs.getInt("employeeId"));
				employee.setFirstName(rs.getString("firstName"));
				employee.setLastName(rs.getString("lastName"));
				employee.setGender(rs.getString("gender"));
				employee.setMobile(rs.getString("mobile"));
				employee.setEmailId(rs.getString("emailId"));
				employee.setDesignation(rs.getString("designation"));
				employee.setPassword(rs.getString("password"));
				EmployeeList.add(employee);
			}
			
		}catch(Exception e) {
			System.out.println(e);
		}		
		return EmployeeList;
	}
	public boolean DeleteEmployee() {
		boolean flag=false;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry ="Delete from employee where employeeId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,this.employeeId);
			
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
	
	public Employee getEmployeeById() {
		Employee employeeRows = new Employee();
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry ="Select employeeId,firstName,lastName,gender,mobile,emailId,designation,password from Employee where employeeId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1,this.employeeId);
			ResultSet rs = pst.executeQuery();
			
			
			if(rs.next()) {
				employeeRows.setEmployeeId(rs.getInt("employeeId"));
				employeeRows.setFirstName(rs.getString("firstName"));
				employeeRows.setLastName(rs.getString("lastName"));
				employeeRows.setGender(rs.getString("gender"));
				employeeRows.setMobile(rs.getString("mobile"));
				employeeRows.setEmailId(rs.getString("emailId"));
				employeeRows.setDesignation(rs.getString("designation"));
				employeeRows.setPassword(rs.getString("password"));
				
				System.out.println("ok, res="+rs.getInt("employeeId"));
			}else {
				employeeRows = null;
			}		
		}catch(Exception e) {
			System.out.println(e);
		}
		return employeeRows;
	}
	public int updateEmployeeById() {
		int n=0;
		try {
			DbConnection db = new DbConnection();
			Connection conn = db.getConnection();
			String qry ="update employee set firstName=?, lastName=?, gender=?, mobile=?, emailId=?, designation=?, password=? where employeeId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setString(1,this.firstName);
			pst.setString(2, this.lastName);
			pst.setString(3, this.gender);
			pst.setString(4, this.mobile);
			pst.setString(5, this.emailId);
			pst.setString(6, this.designation);
			pst.setString(7, this.password);
			pst.setInt(8, this.employeeId);
			System.out.println("qry="+ qry.toString());
			n = pst.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
		return n;
	}
}
