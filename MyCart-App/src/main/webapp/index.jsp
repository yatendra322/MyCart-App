<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProviderr"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="common_css_js.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-3 mx-2">
			<%
			String cat = request.getParameter("category");
			//out.println(cat);
			ProductDao dao = new ProductDao(FactoryProviderr.getFactory());
			List<Product> list = null;
			if (cat == null || cat.trim().equals("all")) {
				list = dao.getAllProducts();
			} else {
				int cId = Integer.parseInt(cat.trim());
				list = dao.getAllProductsByCategoryId(cId);
			}

			CategoryDao categoryDao = new CategoryDao(FactoryProviderr.getFactory());
			List<Category> clist = categoryDao.getCategories();
			%>
			<!-- Show categories -->
			<div class="col-md-2">
				<div class="list-group mt-4">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active">All
						Products</a>
					<%
					for (Category category : clist) {
					%>
					<a href="index.jsp?category=<%=category.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=category.getCategoryTitle()%></a>

					<%
					}
					%>
				</div>
			</div>
			<!-- Show Product -->
			<div class="col-md-10">
				<!-- row -->
				<div class="row mt-4">
					<!-- column:12 -->
					<div class="com-md-12">
						<div class="card-columns">
							<!-- Traversing products -->
							<%
							for (Product p : list) {
							%>
							<!-- Product card -->
							<div class="card product-card ">
								<div class="container text-center">
									<img src="productImages/products/<%=p.getProductPhoto()%> "
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-tap m-2" alt="">
								</div>
								<div class="card-body">
									<h5 class="card-title"><%=p.getProductName()%></h5>
									<p class="card-text">
										<%=Helper.getTenWords(p.getProductDescription())%>
									</p>

								</div>
								<div class="cart-footer text-center">
									<button class="btn bg-costom text-white"
										onclick="add_to_cart(<%=p.getProductId()%>,'<%=p.getProductName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Add
										to Cart</button>
									<button class="btn btn-outline-success">
										&#8377;
										<%=p.getPriceAfterApplyingDiscount()%>/-<span
											class="text-secondry-success discount-label"> &#8377;
											<%=p.getProductPrice()%> ,<%=p.getProductDiscount()%>% off
										</span>
									</button>
								</div>

							</div>

							<%
							}
							if (list.size() == 0) {
							out.println("<h1>No items in this category</h1>");
							}
							%>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%@include file="comman_modals.jsp"%>
</body>
</html>