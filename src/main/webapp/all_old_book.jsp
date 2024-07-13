<%@page import="com.entity.User"%>
<%@page import="com.entity.Book_Details"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BooksDaoImp"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Book</title>
<%@include file="all_Component/allcss.jsp"%>

<style type="text/css">
.crd-ho:hover {
	background-color: #d6d3d2;
}
</style>

</head>
<body>

	<%@include file="all_Component/Navbar.jsp"%>
	
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<div class="container-fluid">
		<div class="row p-3">

			<%
			BooksDaoImp dao = new BooksDaoImp(DBConnect.getConn());
			List<Book_Details> list = dao.getAllOldBooks();

			for (Book_Details b : list) {
			%>
			<!-- col-md-3 is used to get deta in row -->

			<div class="col-md-3 ">
				<div class="card crd-ho p-3">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 120px; height: 150px;" class="ing-thu mblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row ">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

</body>
</html>