package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.StoreOwnerdao;
import com.entities.StoreOwner;
import com.entities.User;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class StoreOwnerServlet
 */
public class StoreOwnerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreOwnerServlet() {
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
	public String encryptpsd(String pass) {
		int key = 11;
		char[] chars = pass.toCharArray();
		String psd ="";
		for(char c:chars){
			   c+=key;
			 psd+=c ;
			} 
		
		return psd ;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		  try { 
				 String name = request.getParameter("name");
				 String userphone = request.getParameter("phone");
				 String email = request.getParameter("email");
				 String password = request.getParameter("password");
				 
				 long phone = Long.parseLong(userphone); 
					
				 
				 
				 String encryptedPassword =  encryptpsd(password);
				 
				  PrintWriter out = response.getWriter();
			  
			  StoreOwnerdao st = new StoreOwnerdao(FactoryProvider.getfactory()) ;
			  boolean b = st.saveStoreowner(name,phone,email,encryptedPassword) ;
			
			  if(b) {       
	              //   HttpSession = request.getSession(); 
	                // HttpSession.setAttribute("message", "Sucessfully Register");
				  
				    StoreOwner sto  = st.getcustomerByphone(phone) ; 
				     
				    HttpSession ht = request.getSession(); 
	                 ht.setAttribute("recentowner", sto);
	                 response.sendRedirect("StoreRegister.jsp");
					  }
			 
			 
		} catch (Exception e) {
			 
			e.printStackTrace();
		}	
	}

}
