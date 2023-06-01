package com.learn.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProviderr;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
        	try {
        		String email=request.getParameter("email");
        		String password=request.getParameter("password");
        		
        		//authenticating user
        		UserDao userDao=new UserDao(FactoryProviderr.getFactory());
        		User user=userDao.getUserByEmailAndPassword(email,password);
        		HttpSession httpSession = request.getSession();
        		if(user==null) {
        			httpSession.setAttribute("message","Email or Password Invalid !!");
        			response.sendRedirect("login.jsp");
        			return;
        		}else {
        			out.println("<h1>Welcome "+user.getUserName()+"</h1>");
        			//login
        			httpSession.setAttribute("current.user",user);
        			if(user.getUserType().equals("admin")) {
        				// admin :- admin.jsp
        				response.sendRedirect("admin.jsp");
        			}else if(user.getUserType().equals("normal")) {
        				//normal :normal.jsp
        				response.sendRedirect("normal.jsp");
        			}else {
        				out.println("We have not identified user type");
        			}
        		}
        		
        	}catch (Exception e) {
        		e.printStackTrace();
        	}
	}catch (Exception e) {
		e.printStackTrace();
	}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
