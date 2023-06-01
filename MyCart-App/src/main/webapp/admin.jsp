<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProviderr"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
	User user=(User) session.getAttribute("current.user");
	if(user==null){
		session.setAttribute("message", "You are not logged in !! login first");
		response.sendRedirect("login.jsp");
		return;
	}else{
		if(user.getUserType().equals("normal")){
			session.setAttribute("message","You are not admin ! Do not access this page");
			response.sendRedirect("login.jsp");
			return;
		}
	}
%>

<%
CategoryDao cdao = new CategoryDao(FactoryProviderr.getFactory());
List<Category> list = cdao.getCategories();

// getting the cout 
Map<String,Long> m = Helper.getCouts(FactoryProviderr.getFactory());
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<%@include file="common_css_js.jsp"%>
	<link rel="stylesheet" href="style.css">
</head>
<body style="background-color:lightblue">
	<%@include file="navbar.jsp"%>
	<div class ="container admin-style">
		<div class="container-fluid">
			<%@include file="massage.jsp" %>
		</div>
		<div class="row mt-3" >
			<!-- first column -->
			<div class="col-md-4">
			<div class="card">
				<div class="cord-body text-center">
				<div class="container image-down">
				<img style="max-width: 125px" class="img-fluid rounded-circle"src="icons/team.png" class="img-fluid" alt="user_icon"></div>
					<h1><%=m.get("userCount") %></h1>
					<h1 class="text-uppercase text-muted">Users</h1>
				</div>
				</div>
			</div>
			<!-- second column -->
			<div class="col-md-4">
				<div class="card">
				<div class="cord-body text-center">
					<div class="container image-down">
				<img style="max-width: 125px" class="img-fluid rounded-circle"src="icons/bullet.png" class="img-fluid" alt="user_icon"></div>
					<h1><%=list.size() %></h1>
					<h1 class="text-uppercase text-muted">Categories</h1>
				</div>
				</div>
			</div>
			<!-- third column -->
			<div class="col-md-4">
				<div class="card">
				<div class="cord-body text-center">
					<div class="container image-down">
					<img style="max-width: 125px" class="img-fluid rounded-circle"src="icons/delivery-box.png" class="img-fluid" alt="product-icon"></div>
					<h1><%=m.get("productCount")%></h1>
					<h1 class="text-uppercase text-muted">Products</h1>
				</div>
				</div>
			</div>
		
		</div>
		<div class="row mt-3">
			<!-- second row first column -->
				<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-category-modal">
				<div class="cord-body text-center">
					<div class="container image-down">
					<img style="max-width: 125px" class="img-fluid rounded-circle"src="icons/calculator.png" class="img-fluid" alt="product-icon"></div>
					<p class="mt-2">Click here to add new categories</p>
					<h1 class="text-uppercase text-muted">Add Categories</h1>
				</div>
				</div>
			</div>
			<!-- second row first column -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-product-modal">
				<div class="cord-body text-center">
					<div class="container image-down">
					<img style="max-width: 125px" class="img-fluid rounded-circle" src="icons/plus.png" class="img-fluid" alt="product-icon"></div>
					<p class="mt-2">Click here to add new Product</p>
					<h1 class="text-uppercase text-muted">Add Product</h1>
				</div>
				</div>
			</div>
		</div>
	
	</div>
	<!-- Add Category model  -->
<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-costom text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="ProductOperationsServlet" method="post">
        	<input type="hidden" name="operation" value="addCategory"/>
        	<div class="form-group">
        		<input type="text" class="form-control" name="categoryTitle" placeholder="Enter category title" required/>        	
        	</div>
        	<div class="form-group">
        		<textarea style="height:200px" class="form-control"placeholder="Enter category description" name="categoryDiscription" required ></textarea>
        	</div>
        	<div class="container text-center">
        		<button  class="btn btn-outline-success">Add Category</button>
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        	</div>
        </form>
      </div>
      
    </div>
  </div>
</div>
	<!-- End add category model -->
	
	<!-- Add Product model  -->
<!-- Modal -->
	<div  class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header bg-costom text-white">
	        <h5 class="modal-title" id="exampleModalLabel">Fill product details</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action="ProductOperationsServlet" method="post" enctype="multipart/form-data">
	        	<input type="hidden" name="operation" value="addProduct"/>
	        	<div class="form-group">
	        		<input type="text" class="form-control" name="productName" placeholder="Enter product name" required/>        	
	        	</div>
	        	<div class="form-group">
	        		<input type="text" class="form-control" name="productPrice" placeholder="Enter product price" required/>        	
	        	</div>
	        	<div class="form-group">
	        		<input type="text" class="form-control" name="productDiscount" placeholder="Enter product discount" required/>        	
	        	</div>
	        	<div class="form-group">
	        		<input type="text" class="form-control" name="productQuantity" placeholder="Enter product quantity" required/>        	
	        	</div>
	        	<div class="form-group">
	        		<textarea style="height:100px" class="form-control"placeholder="Enter product description" name="productDiscription" required ></textarea>
	        	</div>

	        	<div class="form-group">
	        		<select name="categoryId" id="" class="form-control">
	        			<%for(Category c:list){ %>
	        			<option value="<%=c.getCategoryId() %>"><%=c.getCategoryTitle()%></option>
	        			<%}%>
	        		</select>
	        	</div>
	        	<div class="form-group">
	        		<label for="productPic">Upload Picture of product</label>
	        		<br>
	        		<input type="file" id="productPic" name="productPic" required/>
	        	</div>
	        	
	        	<div class="container text-center">
	        		<button  class="btn btn-outline-success">Add Product</button>
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        	</div>
	        </form>
	      </div>
	      
	    </div>
	  </div>
	</div>
	<!-- End add Product model -->
	<%@include file="comman_modals.jsp"%>
</body>
</html>