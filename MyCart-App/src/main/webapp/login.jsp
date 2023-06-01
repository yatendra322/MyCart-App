<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login - MyCart</title>
<%@include file="common_css_js.jsp"%>
</head>
<body style="background-color:lightblue">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-4">
				<div class="card mt-3" style="background-color:lightgreen">
					<div class="card-header custom-bg text-white" style="background-color:green">
						<h3>Login here</h3>
					</div>
					<div class="card-body">
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input name="password"
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div >
							<a href="register.jsp" class="text-conter d-block">if not registered cleck here </a>
							<div class="container text-center">
							<%
									String messagee=(String)session.getAttribute("message");
										if(messagee!=null)
										{
											%>
												<%@include file="massage.jsp" %>
											<%
										}
									%>
							<button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
							<button type="submit" class="btn btn-primary custom-bg border-0">Reset</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>