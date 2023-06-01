
<%
User user = (User) session.getAttribute("current.user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! login first to access checkout page");
	response.sendRedirect("login.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CheckOut</title>
<%@include file="common_css_js.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<!-- card -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-5">Your selected items</h3>
						<div class="cart-body"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<!--  form details -->
				<div class="card">

					<div class="card-body">
						<h3 class="text-center mb-5">Your details for order</h3>
						<form action="#">
							<div class="form-group">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input value="<%=user.getUserEmail() %>" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="form-group">
								<label for="Your Name" class="form-label">Name</label>
								<input value="<%=user.getUserName() %>" type="text" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter name">

							</div>
							<div class="form-group">
								<label for="Your contect No." class="form-label">Phone no.</label>
								<input value="<%=user.getUserPhone() %>" type="text" class="form-control" id="name"
									aria-describedby="number" placeholder="Enter your contect no.">

							</div>
							<div class="form-floating">
								<textarea value="<%=user.getUserAddress() %>" class="form-control" placeholder="Enter your address"
									id="floatingTextarea2" style="height: 100px"></textarea>
								<label for="floatingTextarea2">Your shipping address</label>
							</div>
							<div class="container text-center">
								<button class="btn btn-outline-success">Order Now</button>
								<button class="btn btn-outline-primary">Continue
									Shopping</button>
							</div>
						</form>
					</div>
				</div>
			</div>


		</div>


	</div>
	<%@include file="comman_modals.jsp"%>
</body>
</html>