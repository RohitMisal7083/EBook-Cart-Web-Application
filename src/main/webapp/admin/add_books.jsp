<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
<%@include file="allcss.jsp"%>

</head>

<body style="background-color: #f0f1f2">

	<%@include file="Navbar.jsp"%>
	
	<!-- To secure user add book page and dont open page without login  
	so 1st check user obj is null or not if null then go to login page
	-->
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if> <!-- end of user admin add book page secure -->

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Add Books</h4>

						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="../add_books" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Book Name"
									required="required" name="book_name">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Author Name"
									required="required" name="author_name">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Price"
									required="required" name="price">

							</div>

							<div class="form-group">
								<label>Book Catagories</label> <select name="categories"
									class="form-control">
									<option selected>--select--</option>
									<option value="New">New Book</option>
								</select>
							</div>

							<div class="form-group">
								<label>Book Status</label> <select name="status"
									class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="form-group">
								<label>Upload Photo</label> <input name="bimg" type="file"
									class="form-control-file">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Add</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>

	</div>

	<div style="margin-top: 30px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>