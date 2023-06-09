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

import com.entities.User;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		int key = 6 ;
		char[] chars = pass.toCharArray();
		String psd ="";
		for(char c:chars){
			   c+=key;
			 psd+=c ;
			} 
		
		return psd ;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   
		 String name = request.getParameter("name");
		 String userphone = request.getParameter("phone");
		 String email = request.getParameter("email");
		 String city = request.getParameter("city");
		 String state = request.getParameter("state");
		 String address = request.getParameter("address");
		 String password = request.getParameter("password");
		 
		 long phone = Long.parseLong(userphone); 
			
		 String Address = address+", "+city+", "+state ; 
		 
		 String encryptedPassword =  encryptpsd(password);
		 
		  PrintWriter out = response.getWriter();
		
		  try {
		    User user = new User(name,email,phone,encryptedPassword,Address,"normal");
			
			Session hibernateSession = FactoryProvider.getfactory().openSession() ;	 
			 Transaction tx = hibernateSession.beginTransaction();  
			 hibernateSession.save(user) ; 
			 tx.commit();  
			 hibernateSession.close();
			 
			 HttpSession httpSession = request.getSession() ; 
			 out.println("register");
			 //httpSession.setAttribute("message", "Sucessfully Register");
			 response.sendRedirect("index.jsp");
		} catch (Exception e) {
			 
			e.printStackTrace();
		}	
		
		
	}

}
