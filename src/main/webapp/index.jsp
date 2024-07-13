<%@page import="com.entity.User"%>
<%@page import="com.entity.Book_Details"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BooksDaoImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="all_Component/allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/book-background.webp");
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #d6d3d2;
}
</style>
</head>
<body style="background-color: #edf0d8">
	<%@include file="all_Component/Navbar.jsp"%>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">Ebook Management System</h2>
	</div>

	<!-- Start Recent Book  -->

	<div class="container ">
		<h3 class="text-center">Recent Book</h3>

		<div class="row">

			<%
			BooksDaoImp dao2 = new BooksDaoImp(DBConnect.getConn());
			List<Book_Details> list2 = dao2.getReceBook_Details();

			for (Book_Details b : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;" class="ing-thu mblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>

							<!-- used if and else for hiding add card option from old book -->
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row ">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						Categories:
						<%=b.getBookCategory()%></p>
						
						<div class="row ">
						
						<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>


							<%
							} else {
							%>
							<!-- use cartServlet used to store user in database -->
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>


							<%
							}
							%>

								<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

						<%
						}
						%>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>

		<div class="text-center mt-1">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<hr>

	<!-- End Recent Book -->


	<!-- Start New book -->

	<div class="container ">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<!-- get this book in loop to get all 4 book in display -->

			<%
			BooksDaoImp dao = new BooksDaoImp(DBConnect.getConn());
			List<Book_Details> list = dao.getNewBook();

			for (Book_Details b : list) {
			%>
			<!-- col-md-3 is used to get deta in row -->

			<div class="col-md-3 ">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;" class="ing-thu mblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row ">

							<!-- For add to cart if user is logdin -->

							<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>


							<%
							} else {
							%>
							<!-- use cartServlet used to store user in database -->
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>


							<%
							}
							%>



							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<hr>
	<hr>

	<!-- End New Book -->

	<!-- Start Old Book -->

	<div class="container ">
		<h3 class="text-center">Old Book</h3>
		<div class="row">


			<%
			BooksDaoImp dao3 = new BooksDaoImp(DBConnect.getConn());
			List<Book_Details> list3 = dao3.getOldBook_Details();

			for (Book_Details b : list3) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px;" class="ing-thu mblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row ">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> 
								<a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>

	<!-- End Old Book -->

	<%@include file="all_Component/footer.jsp"%>
</body>
</html>