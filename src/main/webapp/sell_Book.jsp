<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book User</title>
<%@include file="all_Component/allcss.jsp"%>

</head>
<body style="background-color: #f0f1f2;">

<c:if test="${empty userobj }">
<c:redirect url="login.jsp " />
</c:if>

	<%@include file="all_Component/Navbar.jsp"%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-primary p-1">Sell Old Book</h5>
						
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						<form action="add_old_book" method="post"
							enctype="multipart/form-data">

							<input type="hidden" value="${userobj.email}" name="user_email">
							
							
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
								<label>Upload Photo</label> <input name="bimg" type="file"
									class="form-control-file">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Sell</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>