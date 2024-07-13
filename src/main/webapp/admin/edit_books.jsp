<%@page import="com.entity.Book_Details"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.BooksDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Books</title>
<%@include file="allcss.jsp"%>

</head>

<body style="background-color: #f0f1f2">

	<%@include file="Navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Edit Books</h4>

						

						<%
						int id = Integer.parseInt(request.getParameter("id"));

						BooksDaoImp dao = new BooksDaoImp(DBConnect.getConn());

						Book_Details b = dao.getBookById(id);
						%>

						<form action="../edit_books" method="post">
						<input type="hidden" name="id" value="<%=b.getBookId()%>">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=b.getBookname()%>"
									required="required" name="book_name">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=b.getAuthor()%>"
									required="required" name="author_name">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" value="<%=b.getPrice()%>"
									required="required" name="price">

							</div>

							<div class="form-group">
								<label>Book Status</label> <select name="status"
									class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>


									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>

									<%
									}
									%>
								</select>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update</button>
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