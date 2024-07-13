<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Edit Address</title>
<%@include file="all_Component/allcss.jsp"%>

</head>
<body style="background-color: #edf0d8">

	<%@include file="all_Component/Navbar.jsp"%>

	<div class="container">
		<div class="row p-3">
			<div class="col-md-5 offset-md-4">
				<div class="card">
					<div class="card-body">
					
					<h3 class="text-center text-success">Add Address</h3>

						<form>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" value="">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>

							</div>
							
							<div class="form-row">
							<div class="form-group col-md-4">
								<label for="inputPassword4">City</label> <input type="text"
									class="form-control" id="inputPassword4">
							</div>
								<div class="form-group col-md-4">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">Pincode</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
							</div>
							
							<div class="text-center">
							
							<button class="btn btn-warning text-white">Add Address</button>
							
							</div>
							
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_Component/footer.jsp"%>


</body>
</html>