package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProviderr;

@WebServlet("/ServletRegister")
public class ServletRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRegister() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        
        try(PrintWriter out = response.getWriter()){
        	try {
        		String userName=request.getParameter("user_name");
        		String userEmail=request.getParameter("user_email");
        		String userPassword=request.getParameter("user_password");
        		String userPhone=request.getParameter("user_phone");
        		String userAddress=request.getParameter("user_address");
        		
        		UserDao userDao=new UserDao(FactoryProviderr.getFactory());
        		User userr=userDao.getUserEmailExitOrNot(userEmail);
        		
        	
        		if(userr==null){
        		//creating user object to store data
        		User user=	new User(userName, userEmail, userPassword, userPhone, "default",userAddress,"normal");
        		
        		Session hibernateSession=FactoryProviderr.getFactory().openSession();
        		Transaction tx=hibernateSession.beginTransaction();
        		int userId=(int) hibernateSession.save(user);
        		
        		tx.commit();
        		hibernateSession.close();
        		
        		HttpSession httpSession =request.getSession();
        		httpSession.setAttribute("message","Registeration Successfull !!"+userId);
        		response.sendRedirect("register.jsp");
        		return;
        		}
        		else{
        			HttpSession httpSession =request.getSession();
            		httpSession.setAttribute("message",userEmail+" is all ready exist !!");
            		response.sendRedirect("register.jsp");
            		//System.out.println(user);
            		return;
        		}
        	}catch (Exception e) {
        		e.printStackTrace();
        	}
          
        
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}catch (Exception e) {
		e.printStackTrace();
	}
        }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
