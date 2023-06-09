package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;

import com.dao.Storedao;
import com.entities.Store;
import com.helper.FactoryProvider;

import antlr.collections.List;

/**
 * Servlet implementation class StoreOperation
 */

@MultipartConfig
public class StoreOperation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreOperation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub 
		doPost(request,response) ;
		response.getWriter().append("Served at: ").append(request.getContextPath()); 
		
		  
		 
	     
		  
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  

		   String[] myJsonData = request.getParameterValues("json[]"); 
        java.util.List<String> li = new ArrayList<String>();
       for(String s:myJsonData) {
       	 li.add(s) ; 
       	 System.out.println(s);
       }   
		  
		   
		   try {
				response.sendRedirect("main.jsp") ;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  
	}

}
