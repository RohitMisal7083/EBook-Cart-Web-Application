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
<title>Search Book</title>
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
			String ch=request.getParameter("ch");
			BooksDaoImp dao2=new BooksDaoImp(DBConnect.getConn());
			List<Book_Details> list2=dao2.getBookBySearch(ch);

			for(Book_Details b:list2){
			%>

			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 120px; height: 150px;" class="ing-thu mblin">
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

							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add
								Cart</a>


							<%
							} else {
							%>
							<!-- use cartServlet used to store user in database -->
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2">Add Cart</a>


							<%
							} %>							
							<a
								href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn
							btn-success btn-sm ml-1">View Details</a> <a href=""
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
	</div>

</body>
</html>