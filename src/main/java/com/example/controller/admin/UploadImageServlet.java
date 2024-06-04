package com.example.controller.admin;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.sql.Connection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.PreparedStatement;

import dbutils.DbConnection;

/**
 * Servlet implementation class UploadImageServlet
 */
@WebServlet("/UploadImageServlet")
@MultipartConfig
public class UploadImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		// read data from the view
		String tableName = request.getParameter("tableName");
		String setColName = request.getParameter("setColName");
		String whereColValue = request.getParameter("whereColName");
		String conditionValue = request.getParameter("conditionValue");
		
	/////// Creation of uploads in webapp folder/////////////////

			ServletContext sc = getServletContext();
			String path = sc.getRealPath("/");
			System.out.println("path = " + path);

			String str = path.substring(0, path.indexOf(".metadata") - 1);
			System.out.println("str = " + str);
			// get application name
			String appName = path.substring(path.lastIndexOf("\\", path.length() - 2));
			System.out.println("appName = " + appName);

			// Concatenate root directory with application name
			String uploadDirectory = str + appName + "\\src\\main\\webapp\\uploads";
			System.out.println("uploadDirectory :" + uploadDirectory);

			Path uploadPath = Path.of(uploadDirectory);
			
		/////// upload productImage1////////////////////
			//////////////////////////////
			Part image1 = request.getPart("image1");
			// Get the input stream of the uploaded file
			InputStream inputStream1 = image1.getInputStream();
			
			// Generate the unique filename or use the original file name
			String fileName1 = System.currentTimeMillis() + "_" + image1.getSubmittedFileName();
			
			// Save file to the server
			Path filePath1 = uploadPath.resolve(fileName1);
			Files.copy(inputStream1, filePath1, StandardCopyOption.REPLACE_EXISTING);
			
			try {
				DbConnection db = new DbConnection();
				Connection conn= db.getConnection();
				
				String qry="update "+tableName+" set "+setColName+" = '"+fileName1+"' where "+ whereColValue +" = '"+ conditionValue +"'";
				System.out.println("qry="+qry);
				
				PreparedStatement pst = conn.prepareStatement(qry);
				int n= pst.executeUpdate();
						
				response.sendRedirect("admin/CustomerProfile.jsp?res="+n);
			}catch(Exception e) {
				System.out.println(e);
			}


	}

}
