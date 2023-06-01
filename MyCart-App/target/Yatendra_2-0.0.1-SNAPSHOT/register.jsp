<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<%@include file="common_css_js.jsp"%>


<style>
     .error {
      		color: red;
        }
  </style>
</head>
<body style="background-color: lightblue" >
	<%@include file="navbar.jsp"%>
	<div class="container-fluid">
		<div clsss="row mt-5">

			<div class="col-md-4 offset-md-4">

				<div class="card" style="background-color:lightgreen">		

					<div class="card-body px-5">

						<h2 class="text-center my-3 text-white" style="background-color:green ">Sign Up Here</h3>
						<form action="ServletRegister" method="post" id="form1">
							<div class="form-group">
								<label for="exampleInputEmail1">User Name</label> <input name="user_name"
									type="text" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter here">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">User Email</label> <input name="user_email"
									type="email"class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter here">
									<%
									String messagee=(String)session.getAttribute("message");
										if(messagee!=null)
										{
											%>
												<%@include file="massage.jsp" %>
											<%
										}
									%>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> <input name ="user_password"
									type="password" class="form-control" id="password"
									aria-describedby="emailHelp" placeholder="Enter password">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Confirm password</label> <input name ="user_password2"
									type="password" class="form-control" id="password2"
									aria-describedby="emailHelp"
									placeholder="Enter confirm password">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">User Phone</label> <input name ="user_phone"
									type="number" class="form-control" id="phone"
									aria-describedby="emailHelp" placeholder="Enter here">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">User address</label> 
								<textarea name ="user_address" style="height: 120px" ; class="form-control"
									placeholder="Enter your address"></textarea>
							</div>
							<div class="container text-center">
								<button class="btn btn-outline-success" type="submit">Register</button>
								<button class="btn btn-outline-warning">Reset</button>

							</div>
						</form>
					</div>

				</div>

			</div>
		</div>

	</div>
	<script src="bootstrap.min.js"></script>
	<script src="jquery.min.js"></script>
	<script src="jquery.js"></script>
	<script src="popper.js"></script>
	<script src="jquery-validation/dist/jquery.validate.min.js"></script>
<script >
        $(document).ready(function() {

            $.validator.addMethod('StrongPassword', function(value) {
                return /(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/.test(value);
            }, "Please Enter Strong Password");


            $('#form1').validate({
                rules: {
                	user_name: {
                        required: true,
                        minlength: 3,
                    },
                    user_email: {
                        required: true,
                        email: true,
                    },
                    user_password: {
                        required: true,
                        StrongPassword: true
                    },
                    user_password2: {
                        required: true,
                        equalTo: '#password'
                    }
                },
                messages: {
                	user_name: {
                        required: "Please Enter Your Name",
                        minlength: '3 characters must'
                    },
                    user_email: {
                        required: 'Please Enter Email',
                        email: 'invalid email'
                    },
                    user_password: {
                        required: 'Please Enter Password'
                    },
                    user_password2: {
                        required: 'Please Enter Confirm Password',
                        equalTo: "Password does not matched"
                    }
                }
            });

        });
    </script>
</body>
</html>