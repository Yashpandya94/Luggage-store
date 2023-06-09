package com.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.Storedao;
import com.entities.Store;
import com.entities.StoreOwner;
import com.entities.User;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class StoreServelet
 */
@WebServlet()
@MultipartConfig 
public class StoreServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreServelet() {
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
		String storename = request.getParameter("storename"); 
		String storedesc = request.getParameter("storedesc"); 
		String lon = request.getParameter("Longitude"); 
		String lat = request.getParameter("Latitude"); 
		String type = request.getParameter("type"); 
		String country = request.getParameter("country"); 
		String state = request.getParameter("state"); 
		String city = request.getParameter("city"); 
		String pincode = request.getParameter("pincode"); 
		String address = request.getParameter("address"); 
         
		double latt = Double.parseDouble(lat);
		double lonn = Double.parseDouble(lon);
		long pin = Long.parseLong(pincode) ;
		  
		
		Part part = request.getPart("productPic") ; 
		 
		String pic = part.getSubmittedFileName() ;  
		  PrintWriter out = response.getWriter();
		  
		  //uploading photo :
	       //finding path : 
		    String path = request.getRealPath("img")+File.separator + "stores"+File.separator+part.getSubmittedFileName() ;
	       
		    //uploading code :
		    try {
				//write data
  FileOutputStream fos = new FileOutputStream(path) ;  
  
  //read data 
				 InputStream fis = part.getInputStream() ; 
  //reading data : 
				 
				 byte []data = new byte[fis.available()] ; 
				 
				 fis.read(data) ;
  //writing data : 
				 fos.write(data) ; 
				 fos.close();
				 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		     
		    
		
		  try { 
			  HttpSession hts = request.getSession();
			                StoreOwner st =  (StoreOwner)hts.getAttribute("recentowner") ;
			  Storedao sdao = new Storedao(FactoryProvider.getfactory()); 
			      boolean b =  sdao.saveStore(storename,pic,storedesc,type,address,country,city,state,pin,lonn,latt,st);
			         if(b) {       
		               //  httpSession = request.getSession(); 
		                // httpSession.setAttribute("message", "Sucessfully Register");
			        	   System.out.println("jii");
		                 response.sendRedirect("Login.jsp");
						  }
		} catch (Exception e) {
			 
			e.printStackTrace();
		}	
		
  
    	  
     
 
	}

}
