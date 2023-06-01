package com.learn.mycart.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProviderr;

/**
 * Servlet implementation class ProductOperationsServlet
 */
@MultipartConfig
@WebServlet("/ProductOperationsServlet")
public class ProductOperationsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ProductOperationsServlet() {
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
		try(PrintWriter out = response.getWriter()){
        	try {
        		 String op=request.getParameter("operation");
        		if(op.trim().equals("addCategory"))
        		{
        			String categoryTitle=request.getParameter("categoryTitle");
            		String categoryDescription=request.getParameter("categoryDiscription");
            		Category category=new Category();
            		category.setCategoryTitle(categoryTitle);
            		category.setCategoryDescription(categoryDescription);
            		//Category database save
            		CategoryDao categoryDao=new CategoryDao(FactoryProviderr.getFactory());
            		int catId=categoryDao.saveCategory(category);
            		//out.println("Category Saved");
            		HttpSession httpSession=request.getSession();
            		httpSession.setAttribute("message","Category added Successfully : "+catId);
            		response.sendRedirect("admin.jsp");
            		return;
        		}
        		else if(op.trim().equals("addProduct"))
        		{
        			String pName=request.getParameter("productName");
        			String pDescription=request.getParameter("productDiscription");
        			int pPrice=Integer.parseInt(request.getParameter("productPrice"));
        			int pDiscount=Integer.parseInt(request.getParameter("productDiscount"));
        			int pQuantity=Integer.parseInt(request.getParameter("productQuantity"));
        			int categoryId=Integer.parseInt(request.getParameter("categoryId"));
        			Part part=request.getPart("productPic");
        			
        			Product p= new Product();
        			p.setProductName(pName);
        			p.setProductDescription(pDescription);
        			p.setProductPrice(pPrice);
        			p.setProductDiscount(pDiscount);
        			p.setProductQuantity(pQuantity);
        			p.setProductPhoto(part.getSubmittedFileName());
        			//Get category by id
        			CategoryDao cdoa = new CategoryDao(FactoryProviderr.getFactory());
        			Category category=cdoa.getCategoryById(categoryId);
        			p.setCategory(category);
        			
        			
        			//product save.......
        			ProductDao pdao=new ProductDao(FactoryProviderr.getFactory());
        			pdao.saveProduct(p);
        			
        			try {
        			String path=request.getRealPath("productImages")+File.separator+"products"+File.separator+part.getSubmittedFileName();
        			System.out.println(path);
        			//uploading code
        			FileOutputStream fos=new FileOutputStream(path);
        			InputStream is=part.getInputStream();
        			byte []data=new byte[is.available()];
        			is.read(data);
        			fos.write(data);
        			fos.close();
        			HttpSession httpSession =request.getSession();
        			httpSession.setAttribute("message","Product is added Successfully.....");
        			response.sendRedirect("admin.jsp");
        			return;
        		}catch (Exception e) {
					e.printStackTrace();
				}
        		}
        	}catch(Exception e) {
        		e.printStackTrace();
        	}
        	
		doGet(request, response);
	}catch(Exception ee) {
		ee.printStackTrace();
	}
	}
}
